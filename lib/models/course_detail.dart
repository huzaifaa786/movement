import 'package:flutter/foundation.dart';
import './section.dart';

class CourseDetail {
  int? courseId;
  String? productId;
  List<String>? courseIncludes;
  List<String>? courseRequirements;
  List<String>? courseOutcomes;
  bool? isWishlisted;
  bool? isPurchased;
  String? description;
  List<Section>? mSection;

  CourseDetail({
    @required this.courseId,
    @required this.courseIncludes,
    @required this.courseRequirements,
    @required this.courseOutcomes,
    @required this.isWishlisted,
    @required this.isPurchased,
    @required this.mSection,
    @required this.productId,
    @required this.description,
  });
}
