import { useState } from 'react';
import {
  Box,
  Button,
  Dropdown,
  Input,
  Knob,
  NumberInput,
  Section,
  Stack,
  TextArea,
  Tooltip,
} from 'tgui-core/components';
import { useBackend } from '../backend';
import { Window } from '../layouts';

// SS1984 ADDITION START
type FaxTemplate = {
  templateName: string;
  fromWho: string;
  paperName: string;
  stamp: string;
  paperText: string;
  stampX: number;
  stampY: number;
};
// SS1984 ADDITION END

type Data = {
  faxes: string[];
  stamps: string[];
  preselected_fax_name: string; // SS1984 ADDITION
  fax_templates: FaxTemplate[]; // SS1984 ADDITION
};

const paperNameOptions = [
  'Nanotrasen Official Report',
  'Syndicate Report',
] as const;

const fromWhoOptions = ['Nanotrasen', 'Syndicate'] as const;

export function AdminFax(props) {
  const { act, data } = useBackend<Data>();
  const { faxes = [], stamps = [], preselected_fax_name, fax_templates = [] } = data; // SS1984 EDIT, original: const { faxes = [], stamps = [] } = data;

  const [fax, setFax] = useState(preselected_fax_name ? preselected_fax_name : ''); // SS1984 EDIT, original: const [fax, setFax] = useState('');
  const [saved, setSaved] = useState(false);
  const [paperName, setPaperName] = useState('');
  const [fromWho, setFromWho] = useState('');
  const [rawText, setRawText] = useState('');
  const [stamp, setStamp] = useState('');
  const [stampCoordX, setStampCoordX] = useState(0);
  const [stampCoordY, setStampCoordY] = useState(0);
  const [stampAngle, setStampAngle] = useState(0);
  const [selectedTemplate, setSelectedTemplate] = useState('Select Template') // SS1984 ADDITION

  if (stamp && stamps[0] !== 'None') {
    stamps.unshift('None');
  }

  return (
    <Window title="Admin Fax Panel" width={400} height={675} theme="admin">
      <Window.Content scrollable>
        <Section
          title="Fax Menu"
          buttons={
            <Button
              icon="arrow-up"
              disabled={!fax}
              onClick={() =>
                act('follow', {
                  faxName: fax,
                })
              }
            >
              Follow
            </Button>
          }
        >
          <Dropdown
            placeholder="Choose fax machine..."
            fluid
            selected={fax}
            options={faxes}
            onSelected={setFax}
          />
        </Section>
        <Section
          title="Paper"
          buttons={
            <Button
              icon="eye"
              disabled={!saved}
              onClick={() =>
                act('preview', {
                  faxName: fax,
                })
              }
            >
              Preview
            </Button>
          }
        >
          <Stack fill vertical>
            <Stack.Item>
              <Input
                placeholder="Paper name..."
                value={paperName}
                fluid
                onChange={setPaperName}
              />
            </Stack.Item>
            <Stack.Item>
              <SourceButtons
                stateSetter={setPaperName}
                options={paperNameOptions}
                tooltip="What is written on the top of the fax paper?"
              />
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item>
              <Input
                placeholder="From who..."
                value={fromWho}
                fluid
                onChange={setFromWho}
              />
            </Stack.Item>
            <Stack.Item>
              <SourceButtons
                stateSetter={setFromWho}
                options={fromWhoOptions}
                tooltip="What was written in fax log?"
              />
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item>
              <TextArea
                placeholder="Your message here..."
                height="200px"
                fluid
                value={rawText}
                onChange={setRawText}
              />
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item>
              <Dropdown
                fluid
                options={stamps}
                selected="Choose stamp(optional)"
                onSelected={(value) => {
                  if (value === 'None') {
                    setStamp('');
                    stamps.shift();
                  } else {
                    setStamp(value);
                  }
                }}
              />
            </Stack.Item>
            <Stack.Item textAlign="center">
              {stamp && (
                <>
                  <h4>
                    X Coordinate:{' '}
                    <NumberInput
                      step={1}
                      width="45px"
                      minValue={0}
                      maxValue={300}
                      value={stampCoordX}
                      onChange={(v) => setStampCoordX(v)}
                    />
                  </h4>

                  <h4>
                    Y Coordinate:{' '}
                    <NumberInput
                      step={1}
                      width="45px"
                      minValue={0}
                      maxValue={400}
                      value={stampCoordY}
                      onChange={(v) => setStampCoordY(v)}
                    />
                  </h4>

                  <Box textAlign="center">
                    <h4>Rotation Angle</h4>
                    <Knob
                      size={1.5}
                      value={stampAngle}
                      minValue={0}
                      maxValue={360}
                      animated={false}
                      onChange={(_event, value) => setStampAngle(value)}
                    />
                  </Box>
                </>
              )}
            </Stack.Item>
          </Stack>
        </Section>
        <Section title="Actions">
          <Button
            disabled={!saved || !fax}
            icon="paper-plane"
            onClick={() =>
              act('send', {
                faxName: fax,
              })
            }
          >
            Send
          </Button>
          <Button
            icon="floppy-disk"
            color="green"
            onClick={() => {
              setSaved(true);
              act('save', {
                faxName: fax,
                paperName: paperName,
                rawText: rawText,
                stamp: stamp,
                stampX: stampCoordX,
                stampY: stampCoordY,
                stampAngle: stampAngle,
                fromWho: fromWho,
              });
            }}
          >
            Save
          </Button>
          <Button
            disabled={!saved}
            icon="circle-plus"
            onClick={() =>
              act('createPaper', {
                faxName: fax,
              })
            }
          >
            Create paper
          </Button>
          {/* SS1984 ADDITION START */}
          <Dropdown
            fluid
            options={fax_templates.map((fax_template) => {
              return fax_template.templateName;
            })}
            selected={selectedTemplate}
            onSelected={(value) => {
              setSelectedTemplate(value);
              if (value === 'None' || value === "Blank") {
                setFromWho('');
                setPaperName('');
                setStamp('');
                stamps.shift();
                setRawText('')
                setStampCoordX(0);
                setStampCoordY(0);
                setStampAngle(0);
              } else {
                const faxTemplate: FaxTemplate|undefined = fax_templates.find((template_temp) => template_temp.templateName === value);
                if (faxTemplate && typeof(faxTemplate) !== 'undefined')
                {
                  setFromWho(faxTemplate.fromWho);
                  setPaperName(faxTemplate.paperName);
                  setStamp(faxTemplate.stamp);
                  setRawText(faxTemplate.paperText);
                  setStampCoordX(faxTemplate.stampX);
                  setStampCoordY(faxTemplate.stampY);
                  setStampAngle(0);
                }
              }
            }}
          />
          {/* SS1984 ADDITION END */}
        </Section>
      </Window.Content>
    </Window>
  );
}

type SourceButtonsProps = {
  stateSetter: (source: string) => void;
  options: readonly string[];
  tooltip: string;
};

function SourceButtons(props: SourceButtonsProps) {
  const { stateSetter, options, tooltip } = props;

  return (
    <Tooltip content={tooltip}>
      <Stack fill>
        <Stack.Item grow>
          <Button fluid icon="n" onClick={() => stateSetter(options[0])}>
            Nanotrasen
          </Button>
        </Stack.Item>
        <Stack.Item grow>
          <Button fluid icon="s" onClick={() => stateSetter(options[1])}>
            Syndicate
          </Button>
        </Stack.Item>
      </Stack>
    </Tooltip>
  );
}
