import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:odinutils/OdinExtensions/DateTimeExtensions/odin_datetime_extensions.dart';
import 'package:odinutils/OdinExtensions/IntExtensions/odin_int_extensions.dart';
import 'package:odinutils/OdinExtensions/StringExtensions/odin_string_extensions.dart';
import 'package:odinutils/OdinExtensions/StringExtensions/odin_string_regex_extensions.dart';
import 'package:odinutils/Utils/odin_algorithm.dart';
import 'package:odinutils/Utils/odin_chinese_calendar.dart';
import 'package:odinutils/Utils/odin_string_utils.dart';
import 'package:odinutils/Utils/odin_transform_utils.dart';
import 'package:odinutils/Utils/params_sign_utils.dart';
import 'package:odinutils/odinutils.dart';
import 'package:odinutils/odinutils_platform_interface.dart';
import 'package:odinutils/odinutils_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOdinutilsPlatform
    with MockPlatformInterfaceMixin
    implements OdinutilsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}
class Stu{
  Stu(this.name,this.age);
  String? name;
  int? age;
  void show(){}
}
void main() {
  final OdinutilsPlatform initialPlatform = OdinutilsPlatform.instance;

  test('createUrlSign',(){
    var url = "name=odinsam&age=19";
    var signUrl = ParamsSignUtils();
    var newUrl = signUrl.urlAddSign(url, "abc");
    print(newUrl);
  });

  test('validateUrlSign',(){
    var url = "age=19&name=odinsam&sign=34fa599226a44fc7f2431c78a6b15393";
    var signUrl = ParamsSignUtils();
    var flag = signUrl.validateSign(url, "abc");
    print("验证结果:$flag");
    expect(flag, true);
  });

  test('paramsSign',(){
    var kv = SplayTreeMap();
    kv.addAll({"b":"b"});
    kv.addAll({"a":"a"});
    for(var k in kv.entries){
      print("key:${k.key}\tvalue:${k.value}");
    }
    print(kv['c']);
  });

  test('OdinChineseCalendar',(){
    var str = OdinChineseCalendar(DateTime.now()).chineseCalendarHoliday();
    print(str);
  });

  test('transformChineseDate',(){
    var date = DateTime.now().toString().split(' ')[0];
    var str = OdinTransformUtils.convertDateToChineseDate(date);
    print(str);
  });

  test('transformChineseNumber',(){
    var str = OdinTransformUtils.convertNumberToChineseNumber("100002001.32");
    print(str);
  });

  test('transformMoneyWork',(){
    var str = OdinTransformUtils.convertNumberToChineseMoneyWords("30003.3275");
    print(str);
  });

  test('timer',(){
    var dt = OdinChineseCalendar(DateTime.now());
    print(dt.dateString());
    print(dt.ganZhiDateString());
  });

  test('listSum',(){
    var lst = <Map<Stu, int>>[
      {Stu("odinsam1",120):6},{Stu("odinsam2",220):30},{Stu("odinsam3",120):130},{Stu("odinsam4",420):834}
    ];
    var i1=0,i2=0,i3=0,i4=0;
    for(var i =0;i<100;i++){
      var wlst = OdinAlgorithm.getRandomListByWeight(lst, 1);
      if(wlst[0].keys.first.name=="odinsam1"){
        i1+=1;
      }
      if(wlst[0].keys.first.name=="odinsam2"){
        i2+=1;
      }
      if(wlst[0].keys.first.name=="odinsam3"){
        i3+=1;
      }
      if(wlst[0].keys.first.name=="odinsam4"){
        i4+=1;
      }
    }
    print("1:${i1}\t\t2:${i2}\t\t3:${i3}\t\t4:${i4}");
  });

  test('stringUtils',(){
    String str="abc";
    expect(str.compareIgnoreCase("ABC"), true);
    expect(str.compareIgnoreCase("ABC",ignoreCase: false), false);
  });

  /// 判断中国身份号码格式
  test('stringRegex-中国身份号码格式',(){
    String str="62010419820729029x";
    expect(str.isChinaCardId(), true);
  });

  /// 判断中国移动电话号码格式
  test('stringRegex-中国移动电话号码格式',(){
    String str="17377777777";
    expect(str.isChinaMobile(), true);
  });

  /// 判断邮箱地址格式
  test('stringRegex-邮箱地址格式',(){
    String str="123456@qq.com";
    expect(str.isEmail(), true);
  });

  /// 判断url地址格式
  test('stringRegex-url地址格式',(){
    String str="https://www.baidu.com";
    expect(str.isUrl(), true);
  });

  /// 判断Ip地址格式
  test('stringRegex-Ip地址格式',(){
    String str="127.0.0.1";
    expect(str.isIpAddress(), true);
  });

  /// string进行md5加密
  test('stringMd5',(){
    var str = "odinsam";
    expect(str.toMd5(), "6f61c3e668ff2fc275895b843044829c");
    expect(str.toMd5(upperCase: true), "6F61C3E668FF2FC275895B843044829C");
  });

  /// string进行SHA1加密
  test('stringSHA1',(){
    var str = "odinsam";
    expect(str.toSHA1(), "6d07eb5c4263173417428f226655438d346471f9");
    expect(str.toSHA1(upperCase: true), "6D07EB5C4263173417428F226655438D346471F9");
  });

  /// UnixTimer时间戳转DateTime  DateTime转UnixTimer时间戳
  test('time',(){
    var dt = DateTime.now();
    int unixTime = dt.toUnixTime();
    print(dt.toString());
    print(unixTime);
    print(unixTime.unixTimerToTimer());
  });

  /// 按长度生成对应的字符串
  test('generationCode',(){
    var str = OdinStringUtils.generationCode(4);
    print(str);
    expect(str.length, 4);
  });

  /// 按长度生成对应的字符串，不包含 0 o 1 I 等容易混淆的之母和数字
  test('generationLimpidCode',(){
    var str = OdinStringUtils.generationLimpidCode(6);
    print(str);
    expect(str.length, 6);
  });

  test('$MethodChannelOdinutils is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOdinutils>());
  });

  test('getPlatformVersion', () async {
    Odinutils odinutilsPlugin = Odinutils();
    MockOdinutilsPlatform fakePlatform = MockOdinutilsPlatform();
    OdinutilsPlatform.instance = fakePlatform;

    expect(await odinutilsPlugin.getPlatformVersion(), '42');
  });
}
