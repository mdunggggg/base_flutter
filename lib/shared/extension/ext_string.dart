import 'package:intl/intl.dart';

extension extString on String? {
  double? get convertDouble => double.tryParse(toString());
  int? get convertInt => int.tryParse(toString());

  String get validator => this ?? '';

  String formatDate({String format = 'dd/MM/yyyy'}) {
    if (this != null) {
      return DateFormat(format)
          .format(DateTime.tryParse(this!) ?? DateTime.now());
    }
    return '';
  }
}