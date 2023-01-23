import 'package:intl/intl.dart';

String getDateTimrFormatted(DateTime dt,String format)=>
    DateFormat(format).format(dt);