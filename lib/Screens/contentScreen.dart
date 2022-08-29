import 'package:flutter/material.dart';

class ContentScreen extends StatefulWidget {
  final String content;

  const ContentScreen({Key? key, required this.content}) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Content Screen'),
      ),
      body: widget.content.isNotEmpty
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.content,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(height: 1.5),
                ),
              ),
            )
          : const Center(
              child: Text('Content Not Found'),
            ),
    );
  }
}
