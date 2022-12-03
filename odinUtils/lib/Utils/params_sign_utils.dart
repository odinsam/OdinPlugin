import 'dart:collection';
import 'dart:core';

import 'package:odinutils/OdinExtensions/StringExtensions/odin_string_extensions.dart';

/// *       签名算法 （无需参数   此步骤作废）
/// *       第一步：对参数按照key=value的格式，并按照参数名ASCII字典序排序:    b=yy&a=xx&c=zz  排序后为  a=xx&b=yy&c=zz
/// *       第二步：拼接Url密钥：a=xx&b=yy&c=zz&sign=key     （key由开发者提供）
/// *       第三步：Md5ToLower(Url密钥,32) 得到签名秘钥signKey
/// *       第四步：生产完整请求参数  a=xx&b=yy&c=zz&sign=signKey
/// *       {
/// *            "money":30,
/// *            "openId":"oJF440nFowxxoEEPLil_h2LyE6Eg",
/// *            "orderId":"订单流水号"
/// *            "sign":"f9f2finfi2****0jg500g3rgeri",
/// *       }
class ParamsSignUtils{
  final uriParamsMaps = SplayTreeMap();

  /// 设置某个字段的值
  void _setValue(String key, Object value)
  {
    uriParamsMaps.addAll({key:value});
  }


  /// 根据字段名获取某个字段的值
  Object _getValue(String key)
  {
    return uriParamsMaps[key];
  }

  /// 判断某个字段是否已设置
  bool _isSet(String key)
  {
    return uriParamsMaps[key]!=null;
  }


  /// Dictionary格式转化成url参数格式
  String _toUrl()
  {
    var params = <String>[];
    for (var pair in uriParamsMaps.entries)
    {
      if (pair.value == null)
      {
        throw Exception("SortedDictionary内部含有值为null的字段!");
      }
      if (pair.key != "sign" && pair.value.toString() != "")
      {
        params.add("${pair.key}=${pair.value}");
      }
    }
    return params.isNotEmpty? params.join("&"):"";
  }

  /// url添加sign签名
  String urlAddSign(String urlParams, String signKey)
  {
    uriParamsMaps.clear();
    //验证 去sign
    for (var urlParam in urlParams.split('&'))
    {
      if (urlParam.split('=').length == 1)
      {
        throw Exception("urlParams内部含没有值的参数!");
      }
      var key = urlParam.split('=')[0];
      var value = urlParam.split('=')[1];
      if (key != "sign") {
        _setValue(key, value);
      }
    }
    String urlP = _toUrl();
    String urlPSign = "$urlP&sign=$signKey";
    String sign = urlPSign.toMd5();
    urlPSign = urlPSign.replaceAll(signKey, sign);
    return urlPSign;
  }


  /// 验证url sign签名 是否正确
  bool validateSign(String urlParams, String signKey)
  {
    uriParamsMaps.clear();
    String oldSign = "";
    //验证 去sign
    for(var urlParam in urlParams.split('&'))
    {
      if (urlParam.split('=').length == 1)
      {
        throw Exception("urlParams内部含没有值的参数!");
      }
      var key = urlParam.split('=')[0];
      var value = urlParam.split('=')[1];
      if (key != "sign") {
        _setValue(key, value);
      } else {
        oldSign = value;
      }
    }
    String urlP = _toUrl();
    String urlPSign = "$urlP&sign=$signKey";
    String newSign = urlPSign.toMd5();
    return newSign == oldSign;
  }

  /// 创建 sign签名 是否正确
  String createUrlSign(String urlParams, String signKey)
  {
    uriParamsMaps.clear();
    //验证 去sign
    for(var urlParam in urlParams.split('&'))
    {
      if (urlParam.split('=').length == 1)
      {
        throw Exception("urlParams内部含没有值的参数!");
      }
      var key = urlParam.split('=')[0];
      var value = urlParam.split('=')[1];
      if (key != "sign") {
        _setValue(key, value);
      }
    }
    String urlP = _toUrl();
    String urlPSign = "$urlP&sign=$signKey";
    return urlPSign.toMd5();
  }
}