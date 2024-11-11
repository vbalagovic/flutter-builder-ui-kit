import 'package:flutter/material.dart';

class WidgetExample extends StatelessWidget {
  final String name;
  final String description;
  final String code;
  final Widget Function(BuildContext) builder;

  const WidgetExample({
    super.key,
    required this.name,
    required this.description,
    required this.code,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(title: Text(name), subtitle: Text(description)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: builder(context),
          ),
          ExpansionTile(
            title: const Text('View Code'),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SelectableText(code),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
