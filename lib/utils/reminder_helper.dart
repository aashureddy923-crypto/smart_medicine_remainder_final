// Experiment 1: User-defined Functions, Arithmetic Operations, and Conditional Statements in Dart
class ReminderHelper {
  /// Calculates the next dose time given interval in hours and last taken hour (24hr clock).
  static String calculateNextDose(int hoursInterval, int lastTakenHour) {
    int nextHour = (lastTakenHour + hoursInterval) % 24;
    String period = nextHour >= 12 ? "PM" : "AM";
    int formattedHour = nextHour > 12 ? nextHour - 12 : (nextHour == 0 ? 12 : nextHour);
    return "$formattedHour:00 $period";
  }

  /// Calculates adherence percentage (0% to 100%)
  static double calculateAdherenceRate(int takenCount, int totalDoses) {
    if (totalDoses <= 0) {
      return 0.0;
    }
    double percentage = (takenCount / totalDoses) * 100.0;
    return double.parse(percentage.toStringAsFixed(1));
  }

  /// Evaluates adherence category based on conditionals
  static String getAdherenceGrade(double percentage) {
    if (percentage >= 90.0) {
      return "Excellent";
    } else if (percentage >= 70.0) {
      return "Good";
    } else if (percentage >= 50.0) {
      return "Needs Attention";
    } else {
      return "Critical";
    }
  }
}
