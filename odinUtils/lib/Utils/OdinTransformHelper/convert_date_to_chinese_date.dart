class ConvertDateToChineseDate
{
  var chineseNum = <String>["零","一","二","三","四","五","六","七","八","九"];
  String toChineseDate(String date) {
    String year = date.split('-')[0];
    String month = date.split('-')[1];
    String day = date.split('-')[2];
    return "${_convertYear(year)}年${_convertMonthAndDay(month)}月${_convertMonthAndDay(day)}日";
  }

  String _convertYear(String year){
    var cyear = StringBuffer();
    for(var i=0;i<year.length;i++){
      cyear.write(chineseNum[int.parse(year[i])]);
    }
    return cyear.toString();
  }
  String _convertMonthAndDay(String str){
    var cstr = StringBuffer();
    var num = int.parse(str);
    if(num>30){
      cstr.write("三十${chineseNum[num-30]}");
    }
    else if(num==30){
      cstr.write("三十");
    }else if(num>20 && num<30) {
      cstr.write("二十${chineseNum[num-20]}");
    }else if(num==20){
      cstr.write("二十");
    }else if(num>10 && num<20){
      cstr.write("十${chineseNum[num-10]}");
    }else if(num==10){
      cstr.write("十");
    }else {
      cstr.write(chineseNum[num]);
    }
    return cstr.toString();
  }

}