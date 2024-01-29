import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Credits and Thanks 🙂"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Developer's testimony:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "From start to finish, it was a very fun ride creating this app.\n\n"
                "From state management to local storage, to creating your own api, this app taught me "
                "a lot.\n\n"
                "When I look back, "
                "It was tough at times, but seeing the finished app, I feel very happy and grateful that it"
                " turned out well.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
