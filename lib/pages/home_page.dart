import 'package:flutter/material.dart';
import 'package:sports_external/data/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSportIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Featured Sport"),
        actions: [
          IconButton(
            onPressed: _refreshSport,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: screenSize.height * 0.02),
                child: Text(
                  sportsList[_currentSportIndex].name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Text(
                sportsList[_currentSportIndex].description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Cycles through the list of sports.
  void _refreshSport() {
    setState(() {
      if (_currentSportIndex >= sportsList.length - 1) {
        _currentSportIndex = 0;
      } else {
        _currentSportIndex++;
      }
    });
  }
}
