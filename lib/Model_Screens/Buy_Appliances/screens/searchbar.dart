import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_providers.dart';
import 'filteredproduct.dart';

class ItemListProvider with ChangeNotifier {
  List<String> itemList = ['Geyser', 'Ac', 'Washing Machine'];

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  set searchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<String> get filteredItems {
    if (_searchQuery.isEmpty) {
      return itemList;
    } else {
      return itemList
          .where(
              (item) => item.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<FilterProductProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                productProvider.setSearchQuery(value);
              },
              decoration: const InputDecoration(
                  label: Text("Find your appliances"),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    // size: 30,
                    color: Colors.grey,
                  )),
            ),
          ),
          DropdownButtonFormField<String>(
            value: productProvider.selectedCategory.isNotEmpty
                ? productProvider.selectedCategory
                : null,
            onChanged: (value) {
              productProvider.setSelectedCategory(value!);
              productProvider.fetchFilteredProducts();
            },
            items: productProvider.categories
                .map<DropdownMenuItem<String>>((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => filterProductScreen()));
            },
            child: Text('Search'),
          ),
        ],
      ),
    );
  }
}
