// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, must_be_immutable
import 'package:cost_app/shared/components.dart';
import 'package:cost_app/shared/cubit.dart';
import 'package:cost_app/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DirectCalculation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return ListView(
          children: [
            Column(
              children: [
                defaultItemBuilder(
                  title: "Prime cost Items (Direct costs)",
                  description: "Direct Materials/Direcl Labour/Direct Expenses",
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Dismissible(
                      key: Key(cubit.primeCostItems[index]['id'].toString()),
                      onDismissed: (direction) {
                        cubit.deleteDataFromDatabase(
                            id: cubit.primeCostItems[index]['id']);
                      },
                      child: Card(
                        color: Colors.grey[300],
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  cubit.primeCostItems[index]["title"],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(cubit.primeCostItems[index]
                                          ["price"]
                                      .toString())),
                            ]),
                      ),
                    ),
                    itemCount: cubit.primeCostItems.length,
                  ),
                ),
                defaultItemBuilder(
                  title: "Factory Overhead Items",
                  description: "Variable and fixed factory overhead",
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Dismissible(
                      key: Key(
                          cubit.factoryOverHeadItems[index]['id'].toString()),
                      onDismissed: (direction) {
                        cubit.deleteDataFromDatabase(
                            id: cubit.factoryOverHeadItems[index]['id']);
                      },
                      child: Card(
                        color: Colors.grey[300],
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  cubit.factoryOverHeadItems[index]["title"],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(cubit.factoryOverHeadItems[index]
                                          ["price"]
                                      .toString())),
                            ]),
                      ),
                    ),
                    itemCount: cubit.factoryOverHeadItems.length,
                  ),
                ),
                defaultItemBuilder(
                  title: "work in progress Items",
                  description: "Opening and closing work in progress amount",
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Dismissible(
                      key: Key(
                          cubit.workInProgressItems[index]['id'].toString()),
                      onDismissed: (direction) {
                        cubit.deleteDataFromDatabase(
                            id: cubit.workInProgressItems[index]['id']);
                      },
                      child: Card(
                        color: Colors.grey[300],
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  cubit.workInProgressItems[index]["title"],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(cubit.workInProgressItems[index]
                                          ["price"]
                                      .toString())),
                            ]),
                      ),
                    ),
                    itemCount: cubit.workInProgressItems.length,
                  ),
                ),
                defaultItemBuilder(
                  title: "Finished goods Items",
                  description: "Opening and closing finished Goods",
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Dismissible(
                      key:
                          Key(cubit.finishedGoodsItems[index]['id'].toString()),
                      onDismissed: (direction) {
                        cubit.deleteDataFromDatabase(
                            id: cubit.finishedGoodsItems[index]['id']);
                      },
                      child: Card(
                        color: Colors.grey[300],
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  cubit.finishedGoodsItems[index]["title"],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(cubit.finishedGoodsItems[index]
                                          ["price"]
                                      .toString())),
                            ]),
                      ),
                    ),
                    itemCount: cubit.finishedGoodsItems.length,
                  ),
                ),
                defaultItemBuilder(
                  title: "Marketing Expenses",
                  description: "cost of any marketing Expenses",
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Dismissible(
                      key: Key(cubit.marketingitems[index]['id'].toString()),
                      onDismissed: (direction) {
                        cubit.deleteDataFromDatabase(
                            id: cubit.marketingitems[index]['id']);
                      },
                      child: Card(
                        color: Colors.grey[300],
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  cubit.marketingitems[index]["title"],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(cubit.marketingitems[index]
                                          ["price"]
                                      .toString())),
                            ]),
                      ),
                    ),
                    itemCount: cubit.marketingitems.length,
                  ),
                ),
                defaultItemBuilder(
                  title: "Administrative Expenses",
                  description: "cost of any Administrative Expenses",
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Dismissible(
                      key: Key(
                          cubit.administrativeitems[index]['id'].toString()),
                      onDismissed: (direction) {
                        cubit.deleteDataFromDatabase(
                            id: cubit.administrativeitems[index]['id']);
                      },
                      child: Card(
                        color: Colors.grey[300],
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  cubit.administrativeitems[index]["title"],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(cubit.administrativeitems[index]
                                          ["price"]
                                      .toString())),
                            ]),
                      ),
                    ),
                    itemCount: cubit.administrativeitems.length,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
