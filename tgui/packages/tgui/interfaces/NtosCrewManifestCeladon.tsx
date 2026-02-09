import React from 'react';
import { Button, Section } from 'tgui-core/components';

import { useBackend } from '../backend';
import { NtosWindow } from '../layouts';
import { CrewManifestCeladon, Manifest } from './CrewManifestCeladon';

type Data = {
  manifest: Manifest;
};

export const NtosCrewManifestCeladon = (props) => {
  const { act, data } = useBackend<Data>();
  const { manifest } = data;
  return (
    <NtosWindow width={500} height={480}>
      <NtosWindow.Content scrollable>
        <Section
          title="Crew Manifest"
          buttons={
            <Button
              icon="print"
              onClick={() => act('PRG_print')}
            >
                Print
            </Button>
          }
        >
          <CrewManifestCeladon manifest={manifest} />
        </Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
