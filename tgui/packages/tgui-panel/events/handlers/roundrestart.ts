import { saveChatToStorage } from '../../chat/helpers';
import { roundRestartedAtAtom } from '../../game/atoms';
import { store } from '../store';

export function roundrestart() {
  store.set(roundRestartedAtAtom, Date.now());
  saveChatToStorage();
  startAsyncReconnect(); // SS1984 ADDITION
}
// SS1984 ADDITION START
function delay_reconnect(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}
async function startAsyncReconnect(): Promise<void> {
  for (let i = 0; i < 8; i++) {
    await delay_reconnect(15 * 1000); // Wait for 15 seconds
    Byond.command('.reconnect');
  }
}
// SS1984 ADDITION END
