import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  Section,
} from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type Data = {
  points: number;
  pad: string;
  sending: BooleanLike;
  status_report: string;
  current_plasma_cost: number | string; // SS1984 ADDITION
};

export const CargoHoldTerminal = (props) => {
  const { act, data } = useBackend<Data>();
  const { points, pad, sending, status_report, current_plasma_cost } = data; // SS1984 ADDITION: current_plasma_cost

  return (
    <Window width={600} height={230}>
      <Window.Content scrollable>
        <Section>
          <LabeledList>
            <LabeledList.Item label="Current Cargo Value">
              <Box inline bold>
                <AnimatedNumber value={Math.round(points)} /> credits
              </Box>
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section
          title="Cargo Pad"
          buttons={
            <>
              <Button
                icon={'sync'}
                content={'Recalculate Value'}
                disabled={!pad}
                onClick={() => act('recalc')}
              />
              <Button
                icon={sending ? 'times' : 'arrow-up'}
                content={sending ? 'Stop Sending' : 'Send Goods'}
                selected={sending}
                disabled={!pad}
                onClick={() => act(sending ? 'stop' : 'send')}
              />
            </>
          }
        >
          <LabeledList>
            <LabeledList.Item label="Status" color={pad ? 'good' : 'bad'}>
              {pad ? 'Online' : 'Not Found'}
            </LabeledList.Item>
            { /* SS1984 ADDITION START */ }
            <LabeledList.Item>
              <span style={{ color: '#BA3692' }}>Plasma</span> cost: {current_plasma_cost}
            </LabeledList.Item>
            { /* SS1984 ADDITION END */ }
            <LabeledList.Item label="Cargo Report">
              {status_report}
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
