import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categoryList,
  });

  final List<String> categoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(6),
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
          ),
          child: Text(categoryList[index]),
        );
      },
    );
  }
}
