import 'package:flutter/material.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.colorScheme.surfaceContainerHighest,
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Введите текст...",
                      hintStyle: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withAlpha(120),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 12),

              GestureDetector(
                onTap: () => _onTapSearch(context),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.colorScheme.primary,
                  ),
                  child: Icon(Icons.search, color: theme.colorScheme.onPrimary),
                ),
              ),
            ],
          ),
        ),

        Divider(height: 1, thickness: 2, color: theme.colorScheme.primary),

        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => ListTile(title: Text("Игра")),
            separatorBuilder: (context, _) => Divider(height: 1),
            itemCount: 15,
          ),
        ),
      ],
    );
  }

  void _onTapSearch(BuildContext context) {
    Navigator.of(context).pop(controller.text);
  }
}
