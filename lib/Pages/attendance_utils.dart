import 'dart:math';

class AttendanceUtils {
  static double calculateTotalAttendancePercentage(subjectIndex) {
    final random = Random();
    double totalPercentage = 0.0;
    
    for (int i = 0; i < 15; i++) {
      final bool isPresent = random.nextBool(); // Generate random attendance
      totalPercentage += isPresent ? 1.0 : 0.0;
    }
    
    return (totalPercentage / 15) * 100;
  }
}

