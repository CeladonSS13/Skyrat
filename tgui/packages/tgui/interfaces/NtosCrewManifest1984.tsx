import React from 'react';
import { Button, Section } from 'tgui-core/components';

import { useBackend } from '../backend';
import { NtosWindow } from '../layouts';
import { CrewManifestSS1984, Manifest } from './CrewManifestSS1984';

type Data = {
  manifest: Manifest;
};

export const NtosCrewManifest1984 = (props) => {
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
          <CrewManifestSS1984 manifest={manifest} />
        </Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
