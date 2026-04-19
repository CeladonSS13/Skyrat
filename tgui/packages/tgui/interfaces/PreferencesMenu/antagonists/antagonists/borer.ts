import { Antagonist, Category } from '../base';

const Borer: Antagonist = {
  key: 'borer',
  name: 'Cortical Borer',
  description: [
    `
    A cortical borer has appeared on station. It will also attempt to produce eggs, and will attempt to gather willing hosts and learn chemicals through the blood.
    You are a cortical borer! You can fear someone to make them stop moving, but make sure to inhabit them!
    You only grow/heal/talk when inside a host!
    `,
  ],
  category: Category.Midround,
};

export default Borer;
