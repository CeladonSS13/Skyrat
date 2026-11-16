import { type Antagonist, Category } from '../base';
import { HERETIC_MECHANICAL_DESCRIPTION } from './heretic';

const SleeperHeretic: Antagonist = {
  key: 'sleeperheretic',
  name: 'Sleeper Heretic',
  description: [
    'A form of heretic that can activate at any point in the middle of the shift',
    HERETIC_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default SleeperHeretic;
