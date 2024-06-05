import dataPreferences from '@ohos.data.preferences';
import { ForecastFactory } from '../../ViewModel/ForecastVM';
import { GlobalContext } from '../GlobalContext';
import Logger from './Logger';

const TAG = '[PreferencesUtil]';
const PREFERENCES_NAME = 'myPreferences';
const KEY_APP_FORECAST = 'keyAppForecast';

export class PreferencesUtil {
  createFontPreferences(context: Context) {
    let fontPreferences: Function = (() => {
      let preferences: Promise<dataPreferences.Preferences> = dataPreferences.getPreferences(context,
        PREFERENCES_NAME);
      return preferences;
    });
    GlobalContext.getContext().setObject('getPreferences', fontPreferences);
  }

  async save(currentForecast: string) {
    let getPreferences: Function = GlobalContext.getContext().getObject('getPreferences') as Function;
    let preference: dataPreferences.Preferences = await getPreferences()
    await preference.put(KEY_APP_FORECAST, currentForecast)
    await preference.flush()
  }

  async hasData() {
    let getPreferences: Function = GlobalContext.getContext().getObject('getPreferences') as Function;
    let preference: dataPreferences.Preferences = await getPreferences()
    return await preference.has(KEY_APP_FORECAST);
  }


  async get() {
    let currentForecast: string;
    let getPreferences: Function = GlobalContext.getContext().getObject('getPreferences') as Function;
    currentForecast = await (await getPreferences()).get(KEY_APP_FORECAST, currentForecast);
    return currentForecast;
  }

  async delete() {
    let getPreferences: Function = GlobalContext.getContext().getObject('getPreferences') as Function;
    const preferences: dataPreferences.Preferences = await getPreferences();
    let deleteValue = preferences.delete(KEY_APP_FORECAST);
    deleteValue.then(() => {
      Logger.info(TAG, 'Succeeded in deleting the key keyAppForecast.');
    }).catch((err: Error) => {
      Logger.error(TAG, 'Failed to delete the key keyAppForecast. Cause: ' + err);
    });
  }
}

export default new PreferencesUtil();