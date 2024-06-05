import http from '@ohos.net.http';
import Logger from './Logger';

export function httpRequestGet<T>(url: string, bodyData: any = {}): Promise<T> {
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    readTimeout: 10000,
    header: {
      'Content-Type': 'application/json'
    },
    connectTimeout: 10000,
    extraData: bodyData
  });

  var res: T = null;
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === 200) {
      let result = `${value.result}`;
      res = <T> JSON.parse(result);
      return res;
    }
    return res;
  }).catch(() => {
    Logger.error("network error");
    return res;
  })
}