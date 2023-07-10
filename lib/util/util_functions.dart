class UtilFunctions {
  String views(int view, int index) {
    String v = '$view';
    if (view < 1000000 && view / 1000 > 0) {
      v = '${(view / 1000).toStringAsFixed(0)} ming';
    } else if (view < 1000000000 && view / 1000000 > 0) {
      v = '${(view / 1000000).toStringAsFixed(0)} mln';
    } else if (view / 1000000000 > 0) {
      v = '${(view / 1000000000).toStringAsFixed(0)} mlrd';
    }
    return '$v marta';
  }

  String date(String date, int index) {
    var list = date.split(' ');
    String v = '';
    if (list[1].contains('hours')) {
      v = 'soat';
    } else if (list[1].contains('day')) {
      v = 'kun';
    } else if (list[1].contains('weeks')) {
      v = 'hafta';
    } else if (list[1].contains('months')) {
      v = 'oy';
    } else if (list[1].contains('years')) {
      v = 'yil';
    } else {
      return date;
    }
    return '${list[0]} $v oldin';
  }
}
