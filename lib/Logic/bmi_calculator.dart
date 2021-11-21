
double calculateBMI(double height, double weight){
  // We dived height by 100 because we are taking the height in centimeter
  // and formula takes height in meter.
  double heightSquare = height * height;
  double result = weight / heightSquare;
  return result;
}