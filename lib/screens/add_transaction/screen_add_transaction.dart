import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

import '../../db/category/category_db.dart';
import '../../models/category/category_model.dart';

class ScreenaddTransaction extends StatefulWidget {
  static const routeName = 'add-transaction';
  const ScreenaddTransaction({super.key});

  @override
  State<ScreenaddTransaction> createState() => _ScreenaddTransactionState();
}

class _ScreenaddTransactionState extends State<ScreenaddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategorytype;
  CategoryModel? _selectedCategoryModel;

  /*

  Purpose
  Date
  Amount
  Income/Expense
  CategoryType

  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Purpose',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Amount',
                ),
              ),
              TextButton.icon(
                onPressed: () async {
                  final _selectedDateTemp = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime.now().subtract(const Duration(days:30)), 
                    lastDate: DateTime.now()
                  );

                  if(_selectedDateTemp == null) {
                    return;
                  } else {
                    print(_selectedDate.toString());
                    setState((){
                      _selectedDate = _selectedDateTemp;
                    });
                  }
                }, 
                icon: const Icon(Icons.calendar_today),
                label:  Text( _selectedDate == null ? 'Select a date':_selectedDate!.toString()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: CategoryType.income,
                        groupValue: CategoryType.income,
                        onChanged: (newValue) {

                        }
                      ),
                      Text('Income'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: CategoryType.expense,
                        groupValue: CategoryType.expense,
                        onChanged: (newValue) {

                        }
                      ),
                      Text('Expense'),
                    ],
                  ),
                ],
              ),
              DropdownButton(
                hint: const Text('Select Category'),
                items: CategoryDB.instance.incomeCategoryListListener.value.map((e){
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name));
                }).toList(), 
                onChanged: (selectedCategory) {

                }
              ),
              ElevatedButton.icon(
                onPressed: () { },
                icon:const Icon(Icons.check), 
                label:Text('Submit'),
              )
            ],
          ),
        )
      ),
    );
  }
}