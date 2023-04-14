import 'package:logger/logger.dart';

class AppUtils {

  static final LOGGER = Logger(
    printer: PrettyPrinter(
        methodCount: 1, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: false, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true,
        noBoxingByDefault: false),
    // level: Level.info
  );

  // COPY <levelEmojis> AND PASTE IT INSIDE THE <PrettyPrinter> OF THE LIBRARY
  static final levelEmojis = {
    Level.verbose: '',
    Level.debug: '🔍 🔍 🔍 ',
    Level.info: '💡 💡 💡  ',
    Level.warning: '⚠️ ⚠️ ⚠️ ',
    Level.error: '🔴 🔴 🔴 ',
    Level.wtf: '🆘 🆘 🆘 ',
  };
}