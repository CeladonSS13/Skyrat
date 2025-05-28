// THIS IS A NOVA SECTOR UI FILE
import {
  Box,
  Button,
  Collapsible,
  NoticeBox,
  Section,
  Stack,
} from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

class Interaction {
  categories;
  interactions;
  descriptions;
  colors;
  // SS1984 REMOVAL OF LEWD SLOTS
  self;
  ref_self;
  ref_user;
  block_interact;
}

class LewdSlot {
  img;
  name;
}

export const InteractionMenu = (props) => {
  const { act, data } = useBackend<Interaction>();
  const {
    categories = [],
    interactions,
    descriptions,
    colors,
    // SS1984 REMOVAL OF LEWD SLOTS
    self,
    ref_self,
    ref_user,
    block_interact,
  } = data;

  return (
    <Window width={500} height={600} title={'Interact - ' + self}>
      <Window.Content scrollable>
        {(block_interact && <NoticeBox>Unable to Interact</NoticeBox>) || (
          <NoticeBox>Able to Interact</NoticeBox>
        )}
        <Stack fill vertical>
          <Section key="interactions">
            {categories.map((category) => (
              <Collapsible key={category} title={category}>
                <Section fill>
                  <Box mt={0.2}>
                    {interactions[category].map((interaction) => (
                      <Button
                        key={interaction}
                        width="150.5px"
                        lineHeight={1.75}
                        disabled={block_interact}
                        color={block_interact ? 'grey' : colors[interaction]}
                        tooltip={descriptions[interaction]}
                        icon="exclamation-circle"
                        onClick={() =>
                          act('interact', {
                            interaction: interaction,
                            selfref: ref_self,
                            userref: ref_user,
                          })
                        }
                      >
                        {interaction}
                      </Button>
                    ))}
                  </Box>
                </Section>
              </Collapsible>
            ))}
          </Section>
        </Stack>
      </Window.Content>
    </Window>
  );
};
