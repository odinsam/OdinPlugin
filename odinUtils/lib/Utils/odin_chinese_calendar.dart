import 'package:odinutils/OdinExtensions/DateTimeExtensions/odin_datetime_extensions.dart';
import 'package:odinutils/OdinExtensions/StringExtensions/odin_string_extensions.dart';
import 'package:odinutils/Utils/ChineseCalendarHelper/chinese_calendar_struct.dart';

import 'ChineseCalendarHelper/chinese_calendar_exception.dart';
import 'ChineseCalendarHelper/lunar_holiday_struct.dart';
import 'ChineseCalendarHelper/solar_holiday_struct.dart';
import 'ChineseCalendarHelper/week_holiday_struct.dart';
import 'odin_transform_utils.dart';

class OdinChineseCalendar {
  late DateTime _date;
  late DateTime _datetime;
  late int _cYear;
  late int _cMonth;
  late int _cDay;
  late bool _cIsLeapMonth; //当月是否闰月
  late bool _cIsLeapYear; //当年是否有闰月

  final int minYear = 1900;
  final int maxYear = 2050;
  final DateTime minDay = DateTime(1900, 1, 30);
  final DateTime maxDay = DateTime(2049, 12, 31);
  final int ganZhiStartYear = 1864; //干支计算起始年
  final DateTime ganZhiStartDay = DateTime(1899, 12, 22); //起始日
  final String hzNum = "零一二三四五六七八九";
  final int animalStartYear = 1900; //1900年为鼠年
  final DateTime chineseConstellationReferDay =
      DateTime(2007, 9, 13); //28星宿参考值,本日为角

  // 阴历数据
  final lunarDateArray = <int>[
    0x04BD8,
    0x04AE0,
    0x0A570,
    0x054D5,
    0x0D260,
    0x0D950,
    0x16554,
    0x056A0,
    0x09AD0,
    0x055D2,
    0x04AE0,
    0x0A5B6,
    0x0A4D0,
    0x0D250,
    0x1D255,
    0x0B540,
    0x0D6A0,
    0x0ADA2,
    0x095B0,
    0x14977,
    0x04970,
    0x0A4B0,
    0x0B4B5,
    0x06A50,
    0x06D40,
    0x1AB54,
    0x02B60,
    0x09570,
    0x052F2,
    0x04970,
    0x06566,
    0x0D4A0,
    0x0EA50,
    0x06E95,
    0x05AD0,
    0x02B60,
    0x186E3,
    0x092E0,
    0x1C8D7,
    0x0C950,
    0x0D4A0,
    0x1D8A6,
    0x0B550,
    0x056A0,
    0x1A5B4,
    0x025D0,
    0x092D0,
    0x0D2B2,
    0x0A950,
    0x0B557,
    0x06CA0,
    0x0B550,
    0x15355,
    0x04DA0,
    0x0A5B0,
    0x14573,
    0x052B0,
    0x0A9A8,
    0x0E950,
    0x06AA0,
    0x0AEA6,
    0x0AB50,
    0x04B60,
    0x0AAE4,
    0x0A570,
    0x05260,
    0x0F263,
    0x0D950,
    0x05B57,
    0x056A0,
    0x096D0,
    0x04DD5,
    0x04AD0,
    0x0A4D0,
    0x0D4D4,
    0x0D250,
    0x0D558,
    0x0B540,
    0x0B6A0,
    0x195A6,
    0x095B0,
    0x049B0,
    0x0A974,
    0x0A4B0,
    0x0B27A,
    0x06A50,
    0x06D40,
    0x0AF46,
    0x0AB60,
    0x09570,
    0x04AF5,
    0x04970,
    0x064B0,
    0x074A3,
    0x0EA50,
    0x06B58,
    0x055C0,
    0x0AB60,
    0x096D5,
    0x092E0,
    0x0C960,
    0x0D954,
    0x0D4A0,
    0x0DA50,
    0x07552,
    0x056A0,
    0x0ABB7,
    0x025D0,
    0x092D0,
    0x0CAB5,
    0x0A950,
    0x0B4A0,
    0x0BAA4,
    0x0AD50,
    0x055D9,
    0x04BA0,
    0x0A5B0,
    0x15176,
    0x052B0,
    0x0A930,
    0x07954,
    0x06AA0,
    0x0AD50,
    0x05B52,
    0x04B60,
    0x0A6E6,
    0x0A4E0,
    0x0D260,
    0x0EA65,
    0x0D530,
    0x05AA0,
    0x076A3,
    0x096D0,
    0x04BD7,
    0x04AD0,
    0x0A4D0,
    0x1D0B6,
    0x0D250,
    0x0D520,
    0x0DD45,
    0x0B5A0,
    0x056D0,
    0x055B2,
    0x049B0,
    0x0A577,
    0x0A4B0,
    0x0AA50,
    0x1B255,
    0x06D20,
    0x0ADA0,
    0x14B63
  ];

  // 星座名称
  final _constellationName = <String>[
    "白羊座",
    "金牛座",
    "双子座",
    "巨蟹座",
    "狮子座",
    "处女座",
    "天秤座",
    "天蝎座",
    "射手座",
    "摩羯座",
    "水瓶座",
    "双鱼座"
  ];

  // 二十四节气
  final _lunarHolidayName = <String>[
    "小寒",
    "大寒",
    "立春",
    "雨水",
    "惊蛰",
    "春分",
    "清明",
    "谷雨",
    "立夏",
    "小满",
    "芒种",
    "夏至",
    "小暑",
    "大暑",
    "立秋",
    "处暑",
    "白露",
    "秋分",
    "寒露",
    "霜降",
    "立冬",
    "小雪",
    "大雪",
    "冬至"
  ];

  // 二十八星宿
  final _chineseConstellationName = <String>[
    //四       五      六       日      一      二      三
    "角木蛟", "亢金龙", "女土蝠", "房日兔", "心月狐", "尾火虎", "箕水豹",
    "斗木獬", "牛金牛", "氐土貉", "虚日鼠", "危月燕", "室火猪", "壁水獝",
    "奎木狼", "娄金狗", "胃土彘", "昴日鸡", "毕月乌", "觜火猴", "参水猿",
    "井木犴", "鬼金羊", "柳土獐", "星日马", "张月鹿", "翼火蛇", "轸水蚓"
  ];

  // 节气数据
  final _solarTerm = <String>[
    "小寒",
    "大寒",
    "立春",
    "雨水",
    "惊蛰",
    "春分",
    "清明",
    "谷雨",
    "立夏",
    "小满",
    "芒种",
    "夏至",
    "小暑",
    "大暑",
    "立秋",
    "处暑",
    "白露",
    "秋分",
    "寒露",
    "霜降",
    "立冬",
    "小雪",
    "大雪",
    "冬至"
  ];

  final _sTermInfo = <int>[
    0,
    21208,
    42467,
    63836,
    85337,
    107014,
    128867,
    150921,
    173149,
    195551,
    218072,
    240693,
    263343,
    285989,
    308563,
    331033,
    353350,
    375494,
    397447,
    419210,
    440795,
    462224,
    483532,
    504758
  ];

  final String ganStr = "甲乙丙丁戊己庚辛壬癸";
  final String zhiStr = "子丑寅卯辰巳午未申酉戌亥";
  final String animalStr = "鼠牛虎兔龙蛇马羊猴鸡狗猪";
  final String nStr1 = "日一二三四五六七八九";
  final String nStr2 = "初十廿卅";
  final monthString = <String>[
    "出错",
    "正月",
    "二月",
    "三月",
    "四月",
    "五月",
    "六月",
    "七月",
    "八月",
    "九月",
    "十月",
    "十一月",
    "腊月"
  ];
  //按公历计算的节日
  final solarHolidayStruct = <SolarHolidayStruct>[
    SolarHolidayStruct(1, 1, 1, "元旦"),
    SolarHolidayStruct(2, 2, 0, "世界湿地日"),
    SolarHolidayStruct(2, 10, 0, "国际气象节"),
    SolarHolidayStruct(2, 14, 0, "情人节"),
    SolarHolidayStruct(3, 1, 0, "国际海豹日"),
    SolarHolidayStruct(3, 5, 0, "学雷锋纪念日"),
    SolarHolidayStruct(3, 8, 0, "妇女节"),
    SolarHolidayStruct(3, 12, 0, "植树节 孙中山逝世纪念日"),
    SolarHolidayStruct(3, 14, 0, "国际警察日"),
    SolarHolidayStruct(3, 15, 0, "消费者权益日"),
    SolarHolidayStruct(3, 17, 0, "中国国医节 国际航海日"),
    SolarHolidayStruct(3, 21, 0, "世界森林日 消除种族歧视国际日 世界儿歌日"),
    SolarHolidayStruct(3, 22, 0, "世界水日"),
    SolarHolidayStruct(3, 24, 0, "世界防治结核病日"),
    SolarHolidayStruct(4, 1, 0, "愚人节"),
    SolarHolidayStruct(4, 7, 0, "世界卫生日"),
    SolarHolidayStruct(4, 22, 0, "世界地球日"),
    SolarHolidayStruct(5, 1, 1, "劳动节"),
    SolarHolidayStruct(5, 2, 1, "劳动节假日"),
    SolarHolidayStruct(5, 3, 1, "劳动节假日"),
    SolarHolidayStruct(5, 4, 0, "青年节"),
    SolarHolidayStruct(5, 8, 0, "世界红十字日"),
    SolarHolidayStruct(5, 12, 0, "国际护士节"),
    SolarHolidayStruct(5, 31, 0, "世界无烟日"),
    SolarHolidayStruct(6, 1, 0, "国际儿童节"),
    SolarHolidayStruct(6, 5, 0, "世界环境保护日"),
    SolarHolidayStruct(6, 26, 0, "国际禁毒日"),
    SolarHolidayStruct(7, 1, 0, "建党节 香港回归纪念 世界建筑日"),
    SolarHolidayStruct(7, 11, 0, "世界人口日"),
    SolarHolidayStruct(8, 1, 0, "建军节"),
    SolarHolidayStruct(8, 8, 0, "中国男子节 父亲节"),
    SolarHolidayStruct(8, 15, 0, "抗日战争胜利纪念"),
    SolarHolidayStruct(9, 9, 0, "  逝世纪念"),
    SolarHolidayStruct(9, 10, 0, "教师节"),
    SolarHolidayStruct(9, 18, 0, "九·一八事变纪念日"),
    SolarHolidayStruct(9, 20, 0, "国际爱牙日"),
    SolarHolidayStruct(9, 27, 0, "世界旅游日"),
    SolarHolidayStruct(9, 28, 0, "孔子诞辰"),
    SolarHolidayStruct(10, 1, 1, "国庆节 国际音乐日"),
    SolarHolidayStruct(10, 2, 1, "国庆节假日"),
    SolarHolidayStruct(10, 3, 1, "国庆节假日"),
    SolarHolidayStruct(10, 6, 0, "老人节"),
    SolarHolidayStruct(10, 24, 0, "联合国日"),
    SolarHolidayStruct(11, 10, 0, "世界青年节"),
    SolarHolidayStruct(11, 12, 0, "孙中山诞辰纪念"),
    SolarHolidayStruct(12, 1, 0, "世界艾滋病日"),
    SolarHolidayStruct(12, 3, 0, "世界残疾人日"),
    SolarHolidayStruct(12, 20, 0, "澳门回归纪念"),
    SolarHolidayStruct(12, 24, 0, "平安夜"),
    SolarHolidayStruct(12, 25, 0, "圣诞节"),
    SolarHolidayStruct(12, 26, 0, " 诞辰纪念")
  ];
  //按农历计算的节日
  final lunarHolidayStruct = <LunarHolidayStruct>[
    LunarHolidayStruct(1, 1, 1, "春节"),
    LunarHolidayStruct(1, 15, 0, "元宵节"),
    LunarHolidayStruct(5, 5, 0, "端午节"),
    LunarHolidayStruct(7, 7, 0, "七夕情人节"),
    LunarHolidayStruct(7, 15, 0, "中元节 盂兰盆节"),
    LunarHolidayStruct(8, 15, 0, "中秋节"),
    LunarHolidayStruct(9, 9, 0, "重阳节"),
    LunarHolidayStruct(12, 8, 0, "腊八节"),
    LunarHolidayStruct(12, 23, 0, "北方小年(扫房)"),
    LunarHolidayStruct(12, 24, 0, "南方小年(掸尘)"),
    //new LunarHolidayStruct(12, 30, 0, "除夕")  //注意除夕需要其它方法进行计算
  ];
  //按某月第几个星期几
  final weekHolidayStruct = <WeekHolidayStruct>[
    WeekHolidayStruct(5, 2, 1, "母亲节"),
    WeekHolidayStruct(5, 3, 1, "全国助残日"),
    WeekHolidayStruct(6, 3, 1, "父亲节"),
    WeekHolidayStruct(9, 3, 3, "国际和平日"),
    WeekHolidayStruct(9, 4, 1, "国际聋人节"),
    WeekHolidayStruct(10, 1, 2, "国际住房日"),
    WeekHolidayStruct(10, 1, 4, "国际减轻自然灾害日"),
    WeekHolidayStruct(11, 4, 5, "感恩节")
  ];

  void _checkDateLimit(DateTime dt) {
    if ((dt.isBefore(minDay)) || (dt.isAfter(maxDay))) {
      throw ChineseCalendarException("超出可转换的日期");
    }
  }

  int _getChineseLeapMonth(int year) {
    return lunarDateArray[year - minYear] & 0xF;
  }

  int _getChineseLeapMonthDays(int year) {
    if (_getChineseLeapMonth(year) != 0) {
      if ((lunarDateArray[year - minYear] & 0x10000) != 0) {
        return 30;
      } else {
        return 29;
      }
    } else {
      return 0;
    }
  }

  int _getChineseYearDays(int year) {
    int i, f, sumDay, info;

    sumDay = 348; //29天 X 12个月
    i = 0x8000;
    info = lunarDateArray[year - minYear] & 0x0FFFF;

    //计算12个月中有多少天为30天
    for (int m = 0; m < 12; m++) {
      f = info & i;
      if (f != 0) {
        sumDay++;
      }
      i = i >> 1;
    }
    return sumDay + _getChineseLeapMonthDays(year);
  }

  bool _bitTest32(int num, int bitpostion) {
    if ((bitpostion > 31) || (bitpostion < 0)) {
      throw Exception("Error Param: bitpostion[0-31]:$bitpostion");
    }

    int bit = 1 << bitpostion;

    if ((num & bit) == 0) {
      return false;
    } else {
      return true;
    }
  }

  int _getChineseMonthDays(int year, int month) {
    if (_bitTest32(
        (lunarDateArray[year - minYear] & 0x0000FFFF), (16 - month))) {
      return 30;
    } else {
      return 29;
    }
  }

  void _checkChineseDateLimit(int year, int month, int day, bool leapMonth) {
    if ((year < minYear) || (year > maxYear)) {
      throw ChineseCalendarException("非法农历日期");
    }
    if ((month < 1) || (month > 12)) {
      throw ChineseCalendarException("非法农历日期");
    }
    if ((day < 1) || (day > 30)) //中国的月最多30天
    {
      throw ChineseCalendarException("非法农历日期");
    }

    int leap = _getChineseLeapMonth(year); // 计算该年应该闰哪个月
    if ((leapMonth == true) && (month != leap)) {
      throw ChineseCalendarException("非法农历日期");
    }
  }

  bool _compareWeekDayHoliday(DateTime date, int month, int week, int day) {
    bool ret = false;

    if (date.month == month) //月份相同
    {
      if (date.weekday == day) //星期几相同
      {
        DateTime firstDay = DateTime(date.year, date.month, 1); //生成当月第一天
        int i = firstDay.weekday;
        int firWeekDays = 7 - firstDay.weekday + 1; //计算第一周剩余天数
        if (i > day) {
          if ((week - 1) * 7 + day + firWeekDays == date.day) {
            ret = true;
          }
        } else {
          if (day + firWeekDays + (week - 2) * 7 == date.day) {
            ret = true;
          }
        }
      }
    }

    return ret;
  }

  String _convertNumToChineseNum(String n)
  {
    if ((n.codeUnitAt(0) < '0'.codeUnitAt(0)) || (n.codeUnitAt(0) > '9'.codeUnitAt(0))) return "";
    switch (n)
    {
      case '0':
        return hzNum[0].toString();
      case '1':
        return hzNum[1].toString();
      case '2':
        return hzNum[2].toString();
      case '3':
        return hzNum[3].toString();
      case '4':
        return hzNum[4].toString();
      case '5':
        return hzNum[5].toString();
      case '6':
        return hzNum[6].toString();
      case '7':
        return hzNum[7].toString();
      case '8':
        return hzNum[8].toString();
      case '9':
        return hzNum[9].toString();
      default:
        return "";
    }
  }

  String _getChineseHour(DateTime dt)
  {
    //计算时辰的地支
    int hour; //获得当前时间小时
    hour = dt.hour;
    var minute = dt.minute; //获得当前时间分钟

    if (minute != 0) hour += 1;
    int offset = hour ~/ 2;
    if (offset >= 12) offset = 0;
    //zhiHour = zhiStr[offset].ToString();

    //计算天干
    var ts = _date - ganZhiStartDay;
    var i = ts.inDays % 60;

    var indexGan = ((i % 10 + 1) * 2 - 1) % 10 - 1; //ganStr[i % 10] 为日的天干,(n*2-1) %10得出地支对应,n从1开始
    var tmpGan = ganStr.substring(indexGan) + ganStr.substring(0, indexGan + 2); //凑齐12位
    //ganHour = ganStr[((i % 10 + 1) * 2 - 1) % 10 - 1].ToString();
    return tmpGan.toCharList()[offset].toString() + zhiStr[offset].toString();

  }

  // 阳历构造函数
  void _dateTimeConstructor(DateTime dt) {
    int i;
    _checkDateLimit(dt);

    _date = dt;
    _datetime = dt;

    //农历日期计算部分
    var leap = 0;
    var temp = 0;

    var ts = _date - minDay; //计算两天的基本差距
    var offset = ts.inDays;

    for (i = minYear; i <= maxYear; i++) {
      temp = _getChineseYearDays(i); //求当年农历年天数
      if (offset - temp < 1) {
        break;
      } else {
        offset = offset - temp;
      }
    }
    _cYear = i;

    leap = _getChineseLeapMonth(_cYear); //计算该年闰哪个月
    //设定当年是否有闰月
    if (leap > 0) {
      _cIsLeapYear = true;
    } else {
      _cIsLeapYear = false;
    }

    _cIsLeapMonth = false;
    for (i = 1; i <= 12; i++) {
      //闰月
      if ((leap > 0) && (i == leap + 1) && (_cIsLeapMonth == false)) {
        _cIsLeapMonth = true;
        i = i - 1;
        temp = _getChineseLeapMonthDays(_cYear); //计算闰月天数
      } else {
        _cIsLeapMonth = false;
        temp = _getChineseMonthDays(_cYear, i); //计算非闰月天数
      }

      offset = offset - temp;
      if (offset <= 0) break;
    }

    offset = offset + temp;
    _cMonth = i;
    _cDay = offset;
  }

  // 农历构造函数
  void _ccConstructor(int cy, int cm, int cd, bool leapMonthFlag) {
    int i;
    int temp;
    _checkChineseDateLimit(cy, cm, cd, leapMonthFlag);
    _cYear = cy;
    _cMonth = cm;
    _cDay = cd;
    var offset = 0;
    for (i = minYear; i < cy; i++) {
      temp = _getChineseYearDays(i); //求当年农历年天数
      offset = offset + temp;
    }
    var leap = _getChineseLeapMonth(cy); // 计算该年应该闰哪个月
    if (leap != 0) {
      _cIsLeapYear = true;
    } else {
      _cIsLeapYear = false;
    }
    if (cm != leap) {
      _cIsLeapMonth = false; //当前日期并非闰月
    } else {
      _cIsLeapMonth = leapMonthFlag; //使用用户输入的是否闰月月份
    }
    if ((_cIsLeapYear == false) || //当年没有闰月
        (cm < leap)) //计算月份小于闰月
    {
      for (i = 1; i < cm; i++) {
        temp = _getChineseMonthDays(cy, i); //计算非闰月天数
        offset = offset + temp;
      }

      //检查日期是否大于最大天
      if (cd > _getChineseMonthDays(cy, cm)) {
        throw ChineseCalendarException("不合法的农历日期");
      }
      offset = offset + cd; //加上当月的天数
    } else //是闰年，且计算月份大于或等于闰月
    {
      for (i = 1; i < cm; i++) {
        temp = _getChineseMonthDays(cy, i); //计算非闰月天数
        offset = offset + temp;
      }

      if (cm > leap) //计算月大于闰月
      {
        temp = _getChineseLeapMonthDays(cy); //计算闰月天数
        offset = offset + temp; //加上闰月天数

        if (cd > _getChineseMonthDays(cy, cm)) {
          throw ChineseCalendarException("不合法的农历日期");
        }
        offset = offset + cd;
      } else //计算月等于闰月
      {
        //如果需要计算的是闰月，则应首先加上与闰月对应的普通月的天数
        if (_cIsLeapMonth == true) //计算月为闰月
        {
          temp = _getChineseMonthDays(cy, cm); //计算非闰月天数
          offset = offset + temp;
        }

        if (cd > _getChineseLeapMonthDays(cy)) {
          throw ChineseCalendarException("不合法的农历日期");
        }
        offset = offset + cd;
      }
    }
    _date = minDay.add(Duration(days: offset));
  }

  /// 动态参数 构造重载
  OdinChineseCalendar(dynamic cc) {
    if (cc is DateTime) {
      _dateTimeConstructor(cc);
    }
    if (cc is ChineseCalendarStruct) {
      _ccConstructor(cc.cy, cc.cm, cc.cd, cc.leapMonthFlag);
    }
  }

  /// 计算中国农历节日
  String chineseCalendarHoliday() {
    String tempStr = "";
    if (_cIsLeapMonth == false) //闰月不计算节日
    {
      for (LunarHolidayStruct lh in lunarHolidayStruct) {
        if ((lh.month == _cMonth) && (lh.day == _cDay)) {
          tempStr = lh.holidayName;
          break;
        }
      }
      //对除夕进行特别处理
      if (_cMonth == 12) {
        int i = _getChineseMonthDays(_cYear, 12); //计算当年农历12月的总天数
        if (_cDay == i) //如果为最后一天
        {
          tempStr = "除夕";
        }
      }
    }
    return tempStr;
  }

  ///按某月第几周第几日计算的节日
  String weekDayHoliday() {
    String tempStr = "";
    for (WeekHolidayStruct wh in weekHolidayStruct) {
      if (_compareWeekDayHoliday(_date, wh.month, wh.weekAtMonth, wh.weekDay)) {
        tempStr = wh.holidayName;
        break;
      }
    }
    return tempStr;
  }

  /// 按公历日计算的节日
  String dateHoliday() {
    String tempStr = "";
    for (SolarHolidayStruct sh in solarHolidayStruct) {
      if ((sh.month == _date.month) && (sh.day == _date.day)) {
        tempStr = sh.holidayName;
        break;
      }
    }
    return tempStr;
  }

  ///周几的字符
  String weekDayStr() {
    switch (_date.weekday) {
      case 7:
        return "星期日";
      case 1:
        return "星期一";
      case 2:
        return "星期二";
      case 3:
        return "星期三";
      case 4:
        return "星期四";
      case 5:
        return "星期五";
      default:
        return "星期六";
    }
  }
  ///公历日期中文表示法 如一九九七年七月一日
  String dateString()
  {
    return OdinTransformUtils.convertDateToChineseDate(_date.toString().split(' ')[0]);
  }

  ///当前是否公历闰年
  bool isLeapYear()
  {
    return _date.isLeapYear();
  }

  ///28星宿计算
  String chineseConstellation(){
    int offset = 0;
    int modStarDay = 0;

    var ts = _date - chineseConstellationReferDay;
    offset = ts.inDays;
    modStarDay = offset % 28;
    return (modStarDay >= 0 ? _chineseConstellationName[modStarDay] : _chineseConstellationName[27 + modStarDay]);
  }

  ///时辰
  String chineseHour()
  {
      return _getChineseHour(_datetime);
  }
  ///是否闰月
  bool isChineseLeapMonth()
  {
      return _cIsLeapMonth;
  }

  ///当年是否有闰月
  bool isChineseLeapYear()
  {
      return _cIsLeapYear;
  }

  ///农历日
  int chineseDay()
  {
      return _cDay;
  }

  ///农历日中文表示
  String chineseDayString()
  {
    switch (_cDay)
    {
      case 0:
        return "";
      case 10:
        return "初十";
      case 20:
        return "二十";
      case 30:
        return "三十";
      default:
        return nStr2[_cDay / 10 as int].toString() + nStr1[_cDay % 10].toString();
    }
  }

  /// 农历的月份
  int chineseMonth()
  {
  return _cMonth;
  }

  ///农历月份字符串
  String chineseMonthString()
  {
    return monthString[_cMonth];
  }

  ///取农历年份
  int chineseYear()
  {
    return _cYear;
  }

  /// 中文纪年
  String chineseYearString()
  {
    String tempStr = "";
    String num = _cYear.toString();
    for (int i = 0; i < 4; i++)
    {
      tempStr += _convertNumToChineseNum(num[i]);
    }
    return "$tempStr年";
  }

  ///取农历日期表示法：农历一九九七年正月初五
  String chineseDateString()
  {
    if (_cIsLeapMonth == true)
    {
      return "农历${chineseYearString()}闰${chineseMonthString()}${chineseDayString()}";
    }
    else
    {
      return "农历${chineseYearString()}${chineseMonthString()}${chineseDayString()}";
    }
  }

  ///当前日期后一个最近节气
  String chineseTwentyFourDay()
  {
    DateTime baseDateAndTime = DateTime(1900, 1, 6, 2, 5, 0); //#1/6/1900 2:05:00 AM#
    DateTime newDate;
    double num;
    int y;
    String tempStr = "";

    y = _date.year;

    for (int i = 1; i <= 24; i++)
    {
      num = 525948.76 * (y - 1900) + _sTermInfo[i - 1];

      newDate = baseDateAndTime.add(Duration(minutes: num.toInt()));//按分钟计算
      if (newDate.weekday == _date.weekday)
      {
        tempStr = _solarTerm[i - 1];
        break;
      }
    }
    return tempStr;
  }

  ///计算指定日期的星座序号
  String constellation()
  {
    int index = 0;
    int y, m, d;
    y = _date.year;
    m = _date.month;
    d = _date.day;
    y = m * 100 + d;
    if (((y >= 321) && (y <= 419))) { index = 0; }
    else if ((y >= 420) && (y <= 520)) { index = 1; }
    else if ((y >= 521) && (y <= 620)) { index = 2; }
    else if ((y >= 621) && (y <= 722)) { index = 3; }
    else if ((y >= 723) && (y <= 822)) { index = 4; }
    else if ((y >= 823) && (y <= 922)) { index = 5; }
    else if ((y >= 923) && (y <= 1022)) { index = 6; }
    else if ((y >= 1023) && (y <= 1121)) { index = 7; }
    else if ((y >= 1122) && (y <= 1221)) { index = 8; }
    else if ((y >= 1222) || (y <= 119)) { index = 9; }
    else if ((y >= 120) && (y <= 218)) { index = 10; }
    else if ((y >= 219) && (y <= 320)) { index = 11; }
    else { index = 0; }
    return _constellationName[index];
  }
  ///计算属相的索引，注意虽然属相是以农历年来区别的，但是目前在实际使用中是按公历来计算的 鼠年为1,其它类推
  int animal()
  {
    int offset = _date.year - animalStartYear;
    return (offset % 12) + 1;
  }

  /// 取属相字符串
  String animalString()
  {
    int offset = _date.year - animalStartYear; //阳历计算
    //int offset = this._cYear - AnimalStartYear;　农历计算
    return animalStr[offset % 12].toString();
  }

  ///取农历年的干支表示法如 乙丑年
  String ganZhiYearString()
  {
    String tempStr;
    int i = (_cYear - ganZhiStartYear) % 60; //计算干支
    tempStr = "${ganStr[i % 10]}${zhiStr[i % 12]}年";
    return tempStr;
  }

  ///取干支的月表示字符串，注意农历的闰月不记干支
  String ganZhiMonthString()
  {
    //每个月的地支总是固定的,而且总是从寅月开始
    int zhiIndex;
    String zhi;
    if (_cMonth > 10)
    {
      zhiIndex = _cMonth - 10;
    }
    else
    {
      zhiIndex = _cMonth + 2;
    }
    zhi = zhiStr[zhiIndex - 1].toString();
    //根据当年的干支年的干来计算月干的第一个
    int ganIndex = 1;
    String gan;
    int i = (_cYear - ganZhiStartYear) % 60; //计算干支
    switch (i % 10)
    {
      case 0: //甲
        ganIndex = 3;
      break;
      case 1: //乙
        ganIndex = 5;
      break;
      case 2: //丙
        ganIndex = 7;
      break;
      case 3: //丁
        ganIndex = 9;
      break;
      case 4: //戊
        ganIndex = 1;
      break;
      case 5: //己
        ganIndex = 3;
      break;
      case 6: //庚
        ganIndex = 5;
      break;
      case 7: //辛
        ganIndex = 7;
      break;
      case 8: //壬
        ganIndex = 9;
      break;
      case 9: //癸
        ganIndex = 1;
      break;
    }
    gan = ganStr[(ganIndex + _cMonth - 2) % 10].toString();
    return "$gan$zhi月";
  }

  ///取干支日表示法
  String ganZhiDayString()
  {
    int i, offset;
    var ts = _date - ganZhiStartDay;
    offset = ts.inDays;
    i = offset % 60;
    return "${ganStr[i % 10]}${zhiStr[i % 12]}日";
  }

  ///取当前日期的干支表示法如 甲子年乙丑月丙庚日
  String ganZhiDateString()
  {
    return ganZhiYearString() + ganZhiMonthString() + ganZhiDayString();
  }

  ///取下一天
  OdinChineseCalendar nextDay()
  {
    DateTime nextDay = _date.add(const Duration(days: 1));
    return OdinChineseCalendar(nextDay);
  }

  ///取前一天
  OdinChineseCalendar pervDay()
  {
    DateTime pervDay = _date.add(const Duration(days: -1));
    return OdinChineseCalendar(pervDay);
  }

}
