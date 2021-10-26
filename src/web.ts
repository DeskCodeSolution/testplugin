import { WebPlugin } from '@capacitor/core';

import type { EchoPluginPlugin } from './definitions';

export class EchoPluginWeb extends WebPlugin implements EchoPluginPlugin {
  async askPermission(): Promise<{ results: any }> {
    return { results: {permission: 'permission denite', base64Image: ''} };
  }

  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO11', options);
    return options;
  }
}
