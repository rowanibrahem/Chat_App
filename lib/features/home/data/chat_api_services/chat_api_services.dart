
  import 'package:intl/intl.dart';

String formatTimestamp(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDay = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (messageDay == today) {
      return DateFormat('hh:mm a').format(dateTime);
    } else if (messageDay == today.subtract(const Duration(days: 1))) {
      return 'Yesterday, ${DateFormat('hh:mm a').format(dateTime)}';
    } else {
      return DateFormat('MMM d, hh:mm a').format(dateTime);
    }
  }

  String generateChatIdForUsers(String email1, String email2) {
    List<String> emails = [email1, email2];
    emails.sort();
    return emails.join('_');
  }
