import { type Antagonist, Category } from '../base';
import { CHANGELING_MECHANICAL_DESCRIPTION } from './changeling';

const SleeperChangeling: Antagonist = {
  key: 'sleeperchangeling',
  name: 'Sleeper Changeling',
  description: [
    `
      A Changeling that was sleeping disguised as crewmember, which can awake in middle of the shift.
    `,
    CHANGELING_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default SleeperChangeling;
