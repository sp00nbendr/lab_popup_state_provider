import 'package:flutter/material.dart';
import 'package:lab_popup_state_provider/providers/notifiers/timestamp_change_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimestampChangeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Providerdemo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Kalles provider-demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Sätt datum"),
                    content: const Text("Tryck på ok för att uppdatera tidsstämpeln någon annanstans i appen."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Provider.of<TimestampChangeNotifier>(context, listen: false).generateTimestamp();
                          Navigator.pop(context);
                        },
                        child: const Text("Ok"),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<TimestampChangeNotifier>(context, listen: false).clearTimestamp();
                          Navigator.pop(context);
                        },
                        child: const Text("Radera"),
                      )
                    ],
                  ),
                );
              },
              child: const Text("Öppna popup"),
            ),
            Text(Provider.of<TimestampChangeNotifier>(context).timestamp)
          ],
        ),
      ),
    );
  }
}
