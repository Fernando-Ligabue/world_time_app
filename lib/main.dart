import 'package:flutter/material.dart';
import 'package:world_time/views/choose_location.dart';
import 'package:world_time/views/home_page.dart';
import 'package:world_time/views/loading.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => const Home(),
          '/location': (context) => const ChooseLocation(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
