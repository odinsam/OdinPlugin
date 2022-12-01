extension OdinStringExtensions on String
{
  /// string compare ignoreCase
  int compareIgnoreCase(String other){
    return toLowerCase().compareTo(other.toLowerCase());
  }
}


