# odin flutter plugin odinutils

![Platform](https://img.shields.io/badge/Plateform-ios|android|windws|linux-greenyellow) ![OdinUtils](https://img.shields.io/badge/pub.dev-1.0.1-greenyellow)

1. 包引用
```yaml
dependencies:
  # dart linq function
  flinq: ^2.0.2
  # dart crypto
  crypto: ^3.0.2 
```
    


2. OdinUtils 扩展方法包括内容如下:

| 扩展类型| 方法名称                 | 方法描述                     |
|:-------|:---------------------|:-------------------------|
| String  | compareIgnoreCase    | 忽略大小写比较                  |
| String  | isChinaCardId        | 判断中国身份号码格式               |
| String  | isChinaMobile        | 判断中国移动电话号码格式             |
| String  | isIpAddress          | 判断Ip地址格式                 |
| String  | isEmail              | 判断邮箱地址格式                 |
| String  | isUrl                | 判断url地址格式                |
| String  | toMd5                | string进行md5加密            |
| String  | toSHA1               | string进行SHA1加密           |
| String  | toCharList           | 转CharList List<String>类型 |
| int     | unixTimerToTimer     | UnixTimer时间戳转DateTime    |
| DatTime | toUnixTime           | DateTime转UnixTimer时间戳    |
| DatTime | 减运算符 - 运算符重载         | 时间差                      |
| DatTime | isLeapYear           | 是否是闰年                    |
| Random | odinNextInt          | 随机 A-B 之间的int随机数         |
| Random | odinNextDouble       | 随机 A-B 之间的double随机数      |
| ParamsSignUtils | urlAddSign       | url添加sign签名              |
| ParamsSignUtils | validateSign       | 验证url sign签名 是否正确        |
| ParamsSignUtils | createUrlSign       | 创建 sign签名 是否正确      |

3. OdinUtils Utils方法包括内容如下:

| 工具类类型  | 方法名称                                            | 方法描述                                |
|:-------|:------------------------------------------------|:------------------------------------|
| String | OdinStringUtils.generationCode                  | 按长度生成对应的字符串                         |
| String | OdinStringUtils.generationLimpidCode            | 按长度生成对应的字符串，不包含 0 o 1 I 等容易混淆的之母和数字 |
| OdinAlgorithm | OdinAlgorithm.getRandomListByWeight             | 按权重返回对应需要个数的数组                      |
| OdinRandomUtils | OdinRandomUtils.createRandom                    | 创建random随机对象                        |
| OdinTransformUtils | OdinTransformUtils.convertNumberToChineseMoneyWords | 数字转人民币大写                            |
| OdinTransformUtils | OdinTransformUtils.convertNumberToChineseNumber | 数字转中文大写                             |
| OdinTransformUtils | OdinTransformUtils.convertDateToChineseDate     | 日期转中文大写                             |
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseCalendarHoliday | 计算中国农历节日|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).weekDayHoliday      | 按某月第几周第几日计算的节日|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).dateHoliday         | 按公历日计算的节日|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).weekDayStr          | 周几的字符|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).dateString          | 公历日期中文表示法 如一九九七年七月一日|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).isLeapYear          | 当前是否公历闰年|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseConstellation | 28星宿计算|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseHour         | 时辰|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).isChineseLeapMonth  | 是否闰月|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).isChineseLeapYear   | 当年是否有闰月|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseDay          | 农历日|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseDayString    | 农历日中文表示|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseMonth    | 农历的月份|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseMonthString    | 农历月份字符串|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseYear    | 取农历年份|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseYearString    | 中文纪年|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseDateString    | 取农历日期表示法：农历一九九七年正月初五|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).chineseTwentyFourDay    | 当前日期后一个最近节气|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).constellation    | 计算指定日期的星座序号|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).animal    | 计算属相的索引，注意虽然属相是以农历年来区别的，但是目前在实际使用中是按公历来计算的 鼠年为1,其它类推|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).animalString    | 取属相字符串|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).ganZhiYearString    | 取农历年的干支表示法如 乙丑年|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).ganZhiMonthString    | 取干支的月表示字符串，注意农历的闰月不记干支|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).ganZhiDayString    | 取干支日表示法|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).ganZhiDateString    | 取当前日期的干支表示法如 甲子年乙丑月丙庚日|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).nextDay    | 取下一天|
| OdinChineseCalendar | OdinChineseCalendar(Date类型).pervDay    | 取前一天|


## Getting Started
详细说明在：[odinSam-Flutter - OdinUtils Flutter工具类封装](https://www.odinsam.com/articles/eff3.html)

pub.dev发布地址：[odinSam-Flutter - OdinUtils Flutter工具类封装](https://pub.dev/packages/odinutils)


