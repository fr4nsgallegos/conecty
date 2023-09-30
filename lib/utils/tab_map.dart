import 'package:flutter/material.dart';
import 'package:conecty/pages/list_page.dart';
import 'package:conecty/pages/login_view.dart';
import 'package:conecty/pages/map_page.dart';
import 'package:conecty/pages/stream_page.dart';

final List<Map<String, dynamic>> pageDetails = [
  {
    'pageName': StreamPage2(
      bgColor: Colors.blue.shade200,
    ),
    'title': 'Home',
    'navigationBarColor': Colors.blue.shade200,
    'bottom_color': Colors.blue.shade600
  },
  {
    'pageName': MapPage(
      bgColor: Colors.green.shade200,
    ),
    'title': 'Insights',
    'navigationBarColor': Colors.green.shade200,
    'bottom_color': Colors.green.shade600
  },
  {
    'pageName': loginView(
        // bgColor: const Color.fromARGB(255, 167, 143, 244),
        ),
    'title': 'Share',
    'navigationBarColor': const Color.fromARGB(255, 167, 143, 244),
    'bottom_color': const Color.fromARGB(255, 74, 25, 238),
  },
  {
    'pageName': ListPage(
      bgColor: Colors.amber.shade200,
    ),
    'title': 'Profile',
    'navigationBarColor': Colors.amber.shade200,
    'bottom_color': Colors.amber.shade600
  },
];
