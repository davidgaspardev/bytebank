/// Show a [int] as binary in [String]
String showAsBinary(int decimal) {
  List<int> result = [];
  
  if(decimal < 2) return decimal.toString();
  
  while(true) {
    result += "${decimal%2}".codeUnits;
    decimal = decimal ~/ 2;
    if(decimal == 1) {
      result += decimal.toString().codeUnits;
      break;
    }
  }
  
  return String.fromCharCodes(result.reversed);
}