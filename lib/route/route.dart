import 'package:caregiver_manager/views/route_page.dart';
import 'package:flutter/material.dart';
import 'package:caregiver_manager/views/acept_mentor.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/PageInput': (context) => const InputMentor(),
  '/PageMain': (context) => const RoutePage(),
};
