String formatDuration(Duration duration) {
  // Extract days, hours, and minutes from the duration
  int days = duration.inDays;
  int hours = duration.inHours.remainder(24);
  int minutes = duration.inMinutes.remainder(60);

  // Build the formatted string dynamically
  if (days > 0) {
    return '$days day${days > 1 ? 's' : ''}';
  } else if (hours > 0) {
    return '$hours hour${hours > 1 ? 's' : ''}';
  } else {
    return '$minutes minute${minutes > 1 ? 's' : ''}';
  }
}
