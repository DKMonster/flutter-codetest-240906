import 'package:intl/intl.dart';

class Launch {
  final int flightNumber;
  // That's is flight name with number `Flight ${flightNumber}`
  final String flightName;
  final String missionName;
  final String launchDate;
  final String missionPatch;

  Launch({
    required this.flightNumber,
    required this.flightName,
    required this.missionName,
    required this.launchDate,
    required this.missionPatch,
  });

  // 未來這邊會被自動編譯取代，目前先暫時寫
  // 在解析的時候會拿到 Error parsing launch: type 'Null' is not a subtype of type 'String' 錯誤，
  // 代表可能有空值的情況。
  factory Launch.fromJson(Map<String, dynamic> json) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
    DateTime? parsedDate;
    String? formattedDate;

    if (json['launch_date_local'] != null) {
      try {
        parsedDate = DateTime.parse(json['launch_date_local']);
        formattedDate = formatter.format(parsedDate);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }

    return Launch(
      flightNumber: json['flight_number'] ?? 0,
      flightName: 'Flight ${json['flight_number'] ?? 0}',
      missionName: json['mission_name'] ?? '-',
      // format DD/MM/YYYY HH:ii:ss
      launchDate: formattedDate ?? '-',
      missionPatch: json['links']['mission_patch'] ?? '-',
    );
  }
}
