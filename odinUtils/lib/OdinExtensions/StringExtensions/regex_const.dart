class RegexConst {
  /// IP4
  static String regexIp4 = r"\b(([01]?\d?\d|2[0-4]\d|25[0-5])\.){3}([01]?\d?\d|2[0-4]\d|25[0-5])\b";

  /// 中国身份号码
  static String regexChinaCardId = r"(\d{10})\d{7}([\dxX]{1})";

  /// 中国移动电话号码掩码规则
  static String stringMarkChinaMobile = r"$1****$2";

  /// 邮箱
  static String regexEmail = r"^([a-zA-Z0-9_-])+.*([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$";

  /// ip地址
  static String regexIpAddress = r"(\.((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})){3}";

  /// Uri
  static String regexUri = r"(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]";

  /// 身份证掩码规则
  static String stringMarkChinaCardId = r"$1*******$2";

  /// 中国移动电话号码
  static String regexChinaMobile = r"(\d{3})\d{4}(\d{4})";
}
