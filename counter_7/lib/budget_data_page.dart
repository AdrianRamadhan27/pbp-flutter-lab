import 'package:flutter/material.dart';

import 'package:counter_7/main.dart';
import 'package:counter_7/widgets/my_drawer_.dart';
import 'package:counter_7/models/budget.dart';
import 'package:flutter/services.dart';

class BudgetDataPage extends StatelessWidget {
  const BudgetDataPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Data'),
      ),
      drawer: const MyDrawer(),
      body:  ListView.builder(
          itemCount: budgetList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  budgetList[index].judul
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      budgetList[index].nominal.toString()
                  ),
                  Text(
                      budgetList[index].tipe
                  ),
                ],
              ),

            );
          }
      ),
    );
  }
}