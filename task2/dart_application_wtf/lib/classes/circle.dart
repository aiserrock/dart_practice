import 'package:dart_application_wtf/classes/point.dart';
import 'package:equatable/equatable.dart';

class Circle extends Equatable {
  final kPoint center;
  final double radius;

  Circle({
    required this.center,
    required this.radius,
  });

  @override
  List<Object> get props => [center, radius];
}
