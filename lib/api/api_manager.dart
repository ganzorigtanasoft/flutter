import 'dart:convert';

import 'package:mobile_habido_v2/api/http_path.dart';
import 'package:mobile_habido_v2/api/http_utils.dart';
import 'package:mobile_habido_v2/helpers/base_response.dart';
import 'package:mobile_habido_v2/helpers/shared_pref.dart';
import 'package:mobile_habido_v2/models/user_models/user_device.dart';

import 'api_helper.dart';

class ApiManager {
  static Future<BaseResponse> insertDeviceInfo(UserDevice userDevice) async {
    var res = BaseResponse.fromJson(await httpUtils.sendRequest(
      path: HttpPath.insertDevice,
      objectData: userDevice,
    ));

    if (res.code == ResponseCode.Success) {
      SharedPref.setPushNotifTokenRegistered(true);
    }

    return res;
  }
}
