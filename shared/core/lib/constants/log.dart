part of 'constants.dart';

const kLogTag = '[App]';

var logger = Logger();

void printLog(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  final now = DateTime.now().toString().split(' ').last;

  logger.d('[$now] ${data.toString()}', error, stackTrace);
}
