import { sortBy } from 'es-toolkit';
import { filter } from 'es-toolkit/compat';
import { useState } from 'react';
import {
  Button,
  Input,
  LabeledList,
  NoticeBox,
  Section,
  Stack,
  Table,
} from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type AASConfigEntry = {
  name: string;
  entryRef: string;
  enabled: BooleanLike;
  modifiable: BooleanLike;
  announcementLinesMap: Record<string, string>;
  generalTooltip: string;
  varsAndTooltipsMap: Record<string, string>;
};

type nttc_configuration = {
  toggle_jobs: BooleanLike;
  toggle_job_color: BooleanLike;
  toggle_name_color: BooleanLike;
  toggle_command_bold: BooleanLike;
}

type Data = {
  config_entries: AASConfigEntry[];
  nttc: nttc_configuration;
};

export const AutomatedAnnouncement = (props) => {
  const { act, data } = useBackend<Data>();
  const { config_entries = [], nttc } = data;
  const [search, setSearch] = useState('');

  const isEntryMatch = (entry: AASConfigEntry, search: string) => {
    if (!search) return true;
    const { name, announcementLinesMap = [], varsAndTooltipsMap = [] } = entry;
    switch (true) {
      case name?.toLowerCase().includes(search?.toLowerCase()):
      case Object.keys(announcementLinesMap).some((lineKey) =>
        lineKey.toLowerCase().includes(search?.toLowerCase()),
      ):
      case Object.values(announcementLinesMap).some((line) =>
        line.toLowerCase().includes(search?.toLowerCase()),
      ):
      case Object.keys(varsAndTooltipsMap).some((varName) =>
        varName.toLowerCase().includes(search?.toLowerCase()),
      ):
        return true;
      default:
        return false;
    }
  };

  const errorMessage = !config_entries.length
    ? 'No configurable options detected! Please report this to Nanotrasen.'
    : 'No match. Refine your search.';

  const sorted = sortBy(
    filter(config_entries, (entry) => isEntryMatch(entry, search)),
    [(entry) => entry.name],
  );
  return (
    <Window title="Automated Announcement System" width={500} height={400}>
      <Window.Content>
        <Stack fill vertical>
          {/* SS1984 EDIT ADDITION START */}
          <Section title="Radio Configuration">
            <LabeledList>
              <LabeledList.Item label="Job Announcements">
                <Button
                  selected={nttc.toggle_jobs}
                  icon="user-tag"
                  onClick={() => act('nttc_toggle_jobs')}
                >
                  {nttc.toggle_jobs ? 'On' : 'Off'}
                </Button>
              </LabeledList.Item>
              <LabeledList.Item label="Job Departmentalisation">
                <Button
                  selected={nttc.toggle_job_color}
                  icon="clipboard-list"
                  onClick={() => act('nttc_toggle_job_color')}
                >
                  {nttc.toggle_job_color ? 'On' : 'Off'}
                </Button>
              </LabeledList.Item>
              <LabeledList.Item label="Name Departmentalisation">
                <Button
                  selected={nttc.toggle_name_color}
                  icon="user-tag"
                  onClick={() => act('nttc_toggle_name_color')}
                >
                  {nttc.toggle_name_color ? 'On' : 'Off'}
                </Button>
              </LabeledList.Item>
              <LabeledList.Item label="Command Amplification">
                <Button
                  selected={nttc.toggle_command_bold}
                  icon="volume-up"
                  onClick={() => act('nttc_toggle_command_bold')}
                >
                  {nttc.toggle_command_bold ? 'On' : 'Off'}
                </Button>
              </LabeledList.Item>
            </LabeledList>
          </Section>
          {/* SS1984 EDIT ADDITION END */}
          <Stack.Item>
            <LabeledList>
              <LabeledList.Item label="Search">
                <Input fluid placeholder="Name/Line/Var" onChange={setSearch} />
              </LabeledList.Item>
            </LabeledList>
          </Stack.Item>
          <Stack.Item grow>
            {!sorted.length ? (
              <NoticeBox>{errorMessage}</NoticeBox>
            ) : (
              <Section fill scrollable>
                {sorted.map((entry, index) => (
                  <Section
                    key={entry.entryRef}
                    title={entry.name}
                    buttons={
                      <>
                        <Button
                          icon="info"
                          tooltip={
                            (entry.generalTooltip
                              ? `${entry.generalTooltip}\n`
                              : '') +
                            Object.entries(entry.varsAndTooltipsMap)
                              .map(
                                ([varName, tooltip]) =>
                                  `%${varName} ${tooltip}`,
                              )
                              .join('\n')
                          }
                          tooltipPosition="left"
                        />
                        <Button
                          icon={entry.enabled ? 'power-off' : 'times'}
                          selected={entry.enabled}
                          disabled={!entry.modifiable}
                          tooltip={
                            !entry.modifiable
                              ? 'Editing disabled by CentCom!'
                              : undefined
                          }
                          onClick={() =>
                            act('Toggle', { entryRef: entry.entryRef })
                          }
                        >
                          {entry.enabled ? 'On' : 'Off'}
                        </Button>
                      </>
                    }
                  >
                    <Table>
                      {Object.entries(entry.announcementLinesMap).map(
                        ([lineKey, announcementLine]) => (
                          <Table.Row key={lineKey}>
                            <Table.Cell collapsing color="label">
                              {lineKey}:
                            </Table.Cell>
                            <Table.Cell>
                              <Input
                                fluid
                                value={announcementLine}
                                disabled={!entry.modifiable}
                                onBlur={(value) =>
                                  act('Text', {
                                    entryRef: entry.entryRef,
                                    lineKey,
                                    newText: value,
                                  })
                                }
                              />
                            </Table.Cell>
                          </Table.Row>
                        ),
                      )}
                    </Table>
                  </Section>
                ))}
              </Section>
            )}
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
