import 'dart:io';
import 'package:odinutils/OdinExtensions/RandomExtensions/odin_random_extensions.dart';

import '../odin_random_utils.dart';

class GenerationCodeHelper {
  static int _randomIndex = 0;
  static List<String> lstNumber = <String>[
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0"
  ];
  static List<String> lstValidateCodeNumber = <String>[
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
  ];
  static List<String> lstUpperLetter = <String>[
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  static List<String> lstValidateCodeUpperLetter = <String>[
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "J",
    "K",
    "L",
    "M",
    "N",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  static List<String> lstLowerLetter = <String>[
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];
  static List<String> lstValidateCodeLowerLetter = <String>[
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "m",
    "n",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];
  static List<String> lstSpecialCode = <String>[
    "~",
    "!",
    "@",
    "#",
    "\$",
    "%",
    "^",
    "&",
    "*",
    "(",
    ")",
    "_",
    "+",
    "-",
    "=",
    "[",
    "]",
    "{",
    "}",
    "\\",
    "|",
    ";",
    ":",
    "'",
    "\"",
    ",",
    "<",
    ".",
    ">",
    "/",
    "?"
  ];

  static String _generateCode(int length, List<String> codes) {
    List<String> result = <String>[];
    for (int i = 0; i < length; i++) {
      _randomIndex = OdinRandomUtils.createRandom().odinNextInt(codes.length,
          seed: DateTime.now().millisecondsSinceEpoch);
      result.add(codes[_randomIndex]);
      sleep(Duration(milliseconds: _randomIndex));
    }
    return result.join("");
  }

  /// 按长度生成对应的字符串   length 生成的字符串长度
  /// containNum 是否包含数字  containLetter 是否包含字符  containSpecial 是否包含特殊字符
  static String generationCode(int length,
      {bool containNum = true,
      bool containLetter = true,
      bool containSpecial = false}) {
    List<String> codes = <String>[];
    if (containNum) {
      codes.addAll(lstNumber);
    }
    if (containLetter) {
      codes.addAll(lstUpperLetter);
      codes.addAll(lstLowerLetter);
    }
    if (containSpecial) {
      codes.addAll(lstSpecialCode);
    }
    codes = codes.toSet().toList();
    return _generateCode(length, codes);
  }

  /// 按长度生成对应的字符串，不包含 0 o 1 I 等容易混淆的之母和数字     length 生成的字符串长度
  /// containNum 是否包含数字  containLetter 是否包含字符  containSpecial 是否包含特殊字符
  static String generationLimpidCode(int length,
      {bool containNum = true,
      bool containLetter = true,
      bool containSpecial = false}) {
    List<String> codes = <String>[];
    if (containNum) {
      codes.addAll(lstValidateCodeNumber);
    }
    if (containLetter) {
      codes.addAll(lstValidateCodeUpperLetter);
      codes.addAll(lstValidateCodeLowerLetter);
    }
    if (containSpecial) {
      codes.addAll(lstSpecialCode);
    }
    return _generateCode(length, codes);
  }
}
