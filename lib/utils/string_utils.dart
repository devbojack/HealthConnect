class StringUtils {
  // Function to capitalize the first letter of a string
  static String capitalizeFirstLetter(String str) {
    if (str.isEmpty) {
      return str;
    }
    return str[0].toUpperCase() + str.substring(1);
  }

  // Function to truncate a string if it exceeds a specified length
  static String truncateString(String str, int maxLength) {
    if (str.length <= maxLength) {
      return str;
    }
    return str.substring(0, maxLength) + '...';
  }

  // Function to check if a string is empty or consists only of whitespace
  static bool isEmptyOrWhitespace(String str) {
    return str.trim().isEmpty;
  }
}
