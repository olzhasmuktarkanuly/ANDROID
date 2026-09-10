
void main(){

//Task1
for (int i = 1; i <= 10; i++) {
for (int j = 1; j <= 10; j++) {
print("$i * $j = ${i * j}");
}
print("");
}

// Task 2
String date = "28.02.2024";

List<String> parts = date.split(".");
int day = int.parse(parts[0]);
int month = int.parse(parts[1]);
int year = int.parse(parts[2]);

bool isLeapYear = false;
if (year % 400 == 0) {
  isLeapYear = true;
} else if (year % 100 == 0) {
  isLeapYear = false;
} else if (year % 4 == 0) {
  isLeapYear = true;
}

int maxDays = 31;
if (month == 2) {
  if (isLeapYear == true) {
    maxDays = 29;
  } else {
    maxDays = 28;
  }
} else if (month == 4 || month == 6 || month == 9 || month == 11) {
  maxDays = 30;
}

if (day > maxDays || month > 12) {
  print("$date -> invalid date");
} else {
  day = day + 1;

  if (day > maxDays) {
    day = 1;
    month = month + 1;

    if (month > 12) {
      month = 1;
      year = year + 1;
    }
  }

  String strDay = day.toString();
  if (day < 10) {
    strDay = "0$day";
  }

  String strMonth = month.toString();
  if (month < 10) {
    strMonth = "0$month";
  }

  print("$date -> $strDay.$strMonth.$year");
}


}