// Layout
import 'package:artbuy/app/presentation/layouts/dashboard.dart';
// Flutter
import 'package:flutter/material.dart';

class AuctionsPageWidget extends StatefulWidget {
  const AuctionsPageWidget({super.key});

  @override
  State<AuctionsPageWidget> createState() => _AuctionsPageWidgetState();
}

class _AuctionsPageWidgetState extends State<AuctionsPageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthDashboard(
      builder: (_, state) {
        return const Center(
          child: Text('Auctions'),
        );
      },
    );
  }
}
