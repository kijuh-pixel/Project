import 'dart:io';
import 'dart:async';

class StopwatchApp {
  Stopwatch _stopwatch = Stopwatch();
  // ignore: unused_field
  Timer? _timer;

  void start() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      print("Stopwatch started at: ${DateTime.now().toLocal()}");
    } else {
      print("Stopwatch is already running.");
    }
  }

  void stop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      print("Stopwatch stopped at: ${DateTime.now().toLocal()}");
      print("Total elapsed time: ${_stopwatch.elapsed.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_stopwatch.elapsed.inSeconds.remainder(60).toString().padLeft(2, '0')}");
    } else {
      print("Stopwatch is not running.");
    }
  }

  void reset() {
    _stopwatch.reset();
    print("Stopwatch reset to zero.");
  }

  void displayMenu() {
    print("\n--- Stopwatch Menu ---");
    print("1. Start Stopwatch");
    print("2. Stop Stopwatch");
    print("3. Reset Stopwatch");
    print("4. Exit");
  }
}

void main() {
  var stopwatchApp = StopwatchApp();
  while (true) {
    stopwatchApp.displayMenu();
    stdout.write("Choose an option: ");
    var input = stdin.readLineSync();

    switch (input) {
      case '1':
        stopwatchApp.start();
        break;
      case '2':
        stopwatchApp.stop();
        break;
      case '3':
        stopwatchApp.reset();
        break;
      case '4':
        stopwatchApp.stop();
        print("Exiting...");
        return;
      default:
        print("Invalid option. Please choose again.");
    }
  }
}
