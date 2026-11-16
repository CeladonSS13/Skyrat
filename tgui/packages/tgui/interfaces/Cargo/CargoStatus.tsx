import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  Section,
} from 'tgui-core/components';
import { formatMoney } from 'tgui-core/format';

import { useBackend } from '../../backend';
import type { CargoData } from './types';

export function CargoStatus(props) {
  const { act, data } = useBackend<CargoData>();
  const {
    department,
    grocery,
    away,
    docked,
    loan,
    loan_dispatched,
    location,
    message,
    points,
    requestonly,
    can_send,
    current_plasma_cost, // SS1984 ADDITION
  } = data;

  return (
    <Section
      title={department}
      buttons={
      // SS1984 REMOVAL START
      //     // <Box inline bold verticalAlign="middle">
      //     //   <AnimatedNumber
      //     //     value={points}
      //     //     format={(value) => formatMoney(value)}
      //     //   />
      //     //   {' credits'}
      //     // </Box>
      //   }
      // SS1984 REMOVAL END
      // SS1984 ADDITION START
        <>
          <Box inline bold verticalAlign="middle" style={{ marginRight: '1em' }}>
            <span style={{ color: '#BA3692' }}>Plasma</span> cost: {current_plasma_cost}
          </Box>
          <Box inline bold verticalAlign="middle">
            <AnimatedNumber
              value={points}
              format={(value) => formatMoney(value)}
            />
            {' credits'}
          </Box>
        </>
      }
      // SS1984 ADDITION END
    >
      <LabeledList>
        <LabeledList.Item label="Shuttle">
          {!!docked && !requestonly && !!can_send ? (
            <Button
              color={grocery ? 'orange' : 'green'}
              tooltip={
                grocery
                  ? 'The kitchen is waiting for their grocery supply delivery!'
                  : ''
              }
              tooltipPosition="right"
              onClick={() => act('send')}
            >
              {location}
            </Button>
          ) : (
            String(location)
          )}
        </LabeledList.Item>
        <LabeledList.Item label="CentCom Message">{message}</LabeledList.Item>
        {!!loan && !requestonly && (
          <LabeledList.Item label="Loan">
            {!loan_dispatched ? (
              <Button disabled={!(away && docked)} onClick={() => act('loan')}>
                Loan Shuttle
              </Button>
            ) : (
              <Box color="bad">Loaned to Centcom</Box>
            )}
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
}
