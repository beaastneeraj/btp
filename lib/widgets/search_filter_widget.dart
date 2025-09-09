import 'package:flutter/material.dart';

class SearchFilterWidget extends StatelessWidget {
  final ValueChanged<String> onSearch;
  final List<String> filters;
  final ValueChanged<String> onFilter;

  const SearchFilterWidget({required this.onSearch, required this.filters, required this.onFilter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onChanged: onSearch,
            ),
          ),
          SizedBox(width: 12),
          DropdownButton<String>(
            value: filters.isNotEmpty ? filters.first : null,
            items: filters.map((f) => DropdownMenuItem(value: f, child: Text(f))).toList(),
            onChanged: onFilter,
          ),
        ],
      ),
    );
  }
}
