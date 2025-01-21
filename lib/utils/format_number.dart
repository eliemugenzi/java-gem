
import 'package:intl/intl.dart';

String formatNumber(int number) {
  final formatter = NumberFormat('#,###', 'en_US');
  return formatter.format(number);
}