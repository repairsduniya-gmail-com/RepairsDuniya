import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:repair_duniya/Model_Screens/Buy_Appliances/screens/filteredproduct.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;

  CategoryItem(
    this.id,
    this.title,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (context) => filterProductScreen(),
        settings: RouteSettings(
          arguments: {
            'id': id,
            'title': title,
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        //its a class but adding const doesnot change it
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 147, 198, 240),
          // gradient: LinearGradient(
          //   colors: [Colors.blue, Colors.green, Colors.red],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
