double calculateIconPosition({
  required double start,
  required double end,
  required double shrinkFactor,
  bool invert = false,
}) {
  return invert
      ? start + (1 - (end * shrinkFactor))
      : start + (end * shrinkFactor);
}