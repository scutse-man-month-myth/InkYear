import 'package:flutter/material.dart';

enum stateTags {mental, physical, skill, sense, others}
final Map<String, IconData> stateIcons = {
  '${stateTags.mental.index}': Icons.favorite,
  '${stateTags.physical.index}': Icons.hotel,
  '${stateTags.skill.index}': Icons.build,
  '${stateTags.sense.index}': Icons.brush,
  '${stateTags.others.index}': Icons.all_inclusive,
};
