class ChartData {
  final double x;
  final double y;

  ChartData(this.x, this.y);

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
        json['monthId']==null?0.0:json['monthId'].toDouble(), // or other relevant x-axis data
      json['total']??0.0,
    );
  }
}
