class StateLogic {
  double weight;
  double height;
  double bmi;
  StateLogic({required this.weight, required this.height, required this.bmi});
  StateLogic copyWith({double? w, double? h, double? bmi}) {
    return StateLogic(
        weight: w ?? this.weight,
        height: h ?? this.height,
        bmi: bmi ?? this.bmi);
  }
}
