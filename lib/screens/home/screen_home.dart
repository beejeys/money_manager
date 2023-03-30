import 'package:flutter/material.dart';
import 'package:money_manager/screens/category/category_add_popup.dart';
import 'package:money_manager/screens/transactions/screen_transactions.dart';
import '../../models/category/category_model.dart';
import '../add_transaction/screen_add_transaction.dart';
import '../category/screen_category.dart';
import 'widgets/bottom_navigation.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = [
    ScreenTransactions(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('MONEY MANAGER')),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body:SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier, 
          builder: (BuildContext context, int updatedIndex, _){
            return _pages[updatedIndex];
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(selectedIndexNotifier.value==0) {
            print("Add transaction!");
            Navigator.of(context).pushNamed(ScreenaddTransaction.routeName);
          }else {
            //print("Add category!");
            showCategoryAddPopup(context);
          }
           
        },
        child:Icon(Icons.add),
      ),
    );
  }
}

