import { Box, Button, Dropdown, LabeledList, Section } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type Data = {
  timing: BooleanLike;
  flash_charging: BooleanLike;
  cell_id: string;
	occupant: string;
	crimes: string;
	brigged_by: string;
	time_set: string;
	time_left: string;
	isAllowed: BooleanLike;
	prisoner_name: string;
	prisoner_charge: string;
	prisoner_time: string;
	prisoner_hasrec: BooleanLike;
  spns: string[];
};

export const BrigTimer1984 = (props) => {
  const { act, data } = useBackend<Data>();

  // Copy occupant to nameText, but we will override it later if timing is true
  let nameText: React.ReactNode = data.occupant;

  if (data.timing) {
    if (data.prisoner_hasrec) {
      nameText = <Box color="green">{data.occupant}</Box>;
    } else {
      nameText = <Box color="red">{data.occupant}</Box>;
    }
  }

  let nameIcon = 'pencil-alt';
  if (data.prisoner_name) {
    if (!data.prisoner_hasrec) {
      nameIcon = 'exclamation-triangle';
    }
  }

  return (
    <Window width={500} height={!data.timing ? 396 : 237}>
      <Window.Content>
        <Section title="Cell Information">
          <LabeledList>
            <LabeledList.Item label="Cell ID">{data.cell_id}</LabeledList.Item>
            <LabeledList.Item label="Occupant">{nameText}</LabeledList.Item>
            <LabeledList.Item label="Crimes">{data.crimes}</LabeledList.Item>
            <LabeledList.Item label="Brigged By">{data.brigged_by}</LabeledList.Item>
            <LabeledList.Item label="Time Brigged For">{data.time_set}</LabeledList.Item>
            <LabeledList.Item label="Time Left">{data.time_left}</LabeledList.Item>
            <LabeledList.Item label="Actions">
              <>
                <Button
                  icon="lightbulb-o"
                  disabled={data.flash_charging}
                  onClick={() => act('flash')}
                >
                  {data.flash_charging ? 'Recharging' : 'Flash'}
                </Button>
                <Button
                  icon="sync"
                  disabled={!data.timing || !data.isAllowed}
                  onClick={() => act('restart_timer')}
                >
                  Reset Timer
                </Button>
                <Button
                  icon="eject"
                  disabled={!data.timing || !data.isAllowed}
                  onClick={() => act('stop')}
                >
                  Release Prisoner
                </Button>
              </>
            </LabeledList.Item>
          </LabeledList>
        </Section>
        {!data.timing && (
          <Section title="New Prisoner">
            <LabeledList>
              <LabeledList.Item label="Prisoner Name">
                <Button
                  icon={nameIcon}
                  content={data.prisoner_name ? data.prisoner_name : '-----'}
                  disabled={!data.isAllowed}
                  onClick={() => act('prisoner_name')}
                />
                {!!data.spns.length && (
                  <Box mt="0.3rem">
                    <Dropdown
                      disabled={!data.isAllowed || !data.spns.length}
                      options={data.spns.map(spn => ({ value: spn, displayText: spn }))}
                      selected={
                      data.prisoner_name
                        ? { value: data.prisoner_name, displayText: data.prisoner_name }
                        : null
                      }
                      width="250px"
                      onSelected={(value) =>
                        act('prisoner_name', {
                          prisoner_name: value,
                        })
                      }
                    />
                  </Box>
                )}
              </LabeledList.Item>
              <LabeledList.Item label="Prisoner Crimes">
                <Button
                  icon="pencil-alt"
                  content={data.prisoner_charge ? data.prisoner_charge : '-----'}
                  disabled={!data.isAllowed}
                  onClick={() => act('prisoner_charge')}
                />
              </LabeledList.Item>
              <LabeledList.Item label="Prisoner Time">
                <Button
                  icon="pencil-alt"
                  content={data.prisoner_time ? data.prisoner_time : '-----'}
                  disabled={!data.isAllowed}
                  onClick={() => act('prisoner_time')}
                />
              </LabeledList.Item>
              <LabeledList.Item label="Start">
                <Button
                  icon="gavel"
                  content="Start Sentence"
                  disabled={
                    !data.prisoner_name ||
                    !data.prisoner_charge ||
                    !data.prisoner_time ||
                    !data.isAllowed
                  }
                  onClick={() => act('start')}
                />
              </LabeledList.Item>
            </LabeledList>
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};
