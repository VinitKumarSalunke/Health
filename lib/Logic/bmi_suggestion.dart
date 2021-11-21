
String bmiSuggestion(double bmi) {

  if (bmi < 18.0) {
    return "You are considered underweight and possibly malnourished";
  } else if (18.5 <= bmi && bmi < 24.9) {
    return "You are within a healthy weight range for young and middle-aged adults";
  } else if (24.9 <= bmi && bmi < 29.9) {
    return "You are considered overweight";
  } else if (bmi >= 30) {
    return "You are considered obese";
  }

  return "Something went wrong";
}