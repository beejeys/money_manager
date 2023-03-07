
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return Card(
          child: ListTile(
            title: Text('Expense category $index'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                
              },
            )
          ),
        );
      }, 
      separatorBuilder: (ctx, index) {
        return SizedBox(height:10);
      }, 
      itemCount: 100
    );
  }
}