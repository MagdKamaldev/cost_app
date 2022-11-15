// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cost_app/modules/direct_calculation.dart';
import 'package:cost_app/shared/components.dart';
import 'package:cost_app/shared/cubit.dart';
import 'package:cost_app/shared/states.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppEntrance extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String category = "";
  var titleController = TextEditingController();
  var priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertToDataBaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              title: Center(
                child: Text(
                  "Absortbtion method Cost Calulator",
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDataFromDataBaseLoadingState,
              builder: (context) => DirectCalculation(),
              fallback: (context) => Center(
                child: CircularProgressIndicator(color: Colors.indigo),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDataBase(
                      title: titleController.text,
                      price: priceController.text,
                      category: category,
                    );
                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) => Container(
                          padding: EdgeInsets.all(20.0),
                          color: Colors.grey[200],
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DropdownSearch(
                                  items: [
                                    "Prime cost item",
                                    "Factory overhead item",
                                    "Work in progress item",
                                    "Opening and closing finished goods",
                                    "Marketing expense",
                                    "Administrative expense",
                                  ],
                                  onSaved: (newValue) {},
                                  onChanged: (selectedValue) {
                                    category = selectedValue.toString();
                                  },
                                  selectedItem: "Type of expense",
                                  validator: (String? item) {
                                    if (item == null) {
                                      return "Required field";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                defaultFormField(
                                  controller: titleController,
                                  suffix: Icons.title,
                                  type: TextInputType.text,
                                  onSubmit: () {},
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return "title must not be empty";
                                    }
                                  },
                                  onTab: () {},
                                  onChanged: () {},
                                  label: "item title",
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                defaultFormField(
                                  controller: priceController,
                                  type: TextInputType.number,
                                  suffix: Icons.price_change,
                                  onSubmit: () {},
                                  onTab: () {},
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return "Price must not be empty";
                                    }
                                  },
                                  onChanged: () {},
                                  label: "item Price",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 15.0,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        isShown: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShown: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
          );
        },
      ),
    );
  }
}
