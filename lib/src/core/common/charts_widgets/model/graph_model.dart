

import 'dart:math';

class GraphPoints {
  double x;
  double y;

  GraphPoints({
    required this.x,
    required this.y
  });

}

List<GraphPoints> line1Data = List.generate(12, (index) {
  double yValue = index == 11
      ? 850000
      : 750000 + Random().nextDouble() * (990000 - 750000);
  return GraphPoints(x: (index + 1).toDouble(), y: yValue.roundToDouble());
});

List<GraphPoints> line2Data = List.generate(12, (index) {
  double yValue = index == 11
      ? 945000
      : 750000 + Random().nextDouble() * (990000 - 750000);
  return GraphPoints(x: (index + 1).toDouble(), y: yValue.roundToDouble());
});


List<GraphPoints> barData = List.generate(6, (index) {
  int val = Random().nextInt(500);
  int yValue = index == 5? 240 : val<10 ? val*50 : val;
  return GraphPoints(x: (index + 1).toDouble(), y: yValue.roundToDouble());
});

