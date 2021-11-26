class TimeState {

  DateTime dateTime;

  TimeState(this.dateTime);

  String formatTime() {
    String time = dateTime.toString().split(' ')[1];
    time = time.split('.')[0];
    return time;
  }

}