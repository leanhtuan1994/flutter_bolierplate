part of 'constants.dart';

const kLogTag = '[App]';

void printLog(dynamic data) {
  final now = DateTime.now().toString().split(' ').last;
  debugPrint('[$now]$kLogTag${data.toString()}');
}
