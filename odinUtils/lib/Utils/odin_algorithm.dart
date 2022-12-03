import 'dart:math';
import 'package:darq/darq.dart';
import 'package:odinutils/OdinExtensions/RandomExtensions/odin_random_extensions.dart';
import 'package:odinutils/Utils/odin_random_utils.dart';

class OdinAlgorithm{
  /// 按权重返回对应需要个数的数组
  static List<Map<T, int>> getRandomListByWeight<T>(List<Map<T, int>> list, int count)
  {
    if (count <= 0)
    {
      throw Exception("list.count不能 小于等于 = ");
    }
    if (list.length <= count)
    {
      return list;
    }
    //计算权重总和
    var totalWeights = list.sum<int>((ls)=>ls.values.sum());
    //随机赋值权重
    Random ran = OdinRandomUtils.createRandom();  //GetRandomSeed()随机种子，防止快速频繁调用导致随机一样的问题
    var weightlst = <Map<T, int>>[];
    for (int i = 0; i < list.length; i++)
    {
      int w = (list[i].values.first + 1) + ran.odinNextInt(totalWeights);   // （权重+1） + 从0到（总权重-1）的随机数
      weightlst.add({list[i].keys.first:w});
    }
    //排序
    weightlst.sort((kvp1,kvp2)=>kvp2.values.first - kvp1.values.first);
    return weightlst.take(count).toList();
  }
}