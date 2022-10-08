import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/app_color.dart';
import '../global/dimens.dart';
import '../screens/detail_page.dart';
import '../widgets/etiqa_loading_widget.dart';
import '../widgets/task_card_widget.dart';
import '../models/task_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Stream data from Firestore
    final Stream<QuerySnapshot> taskDbStream =
        FirebaseFirestore.instance.collection('task').snapshots();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: taskDbStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const EtiqaLoadingWidget(),
                SizedBox(
                  height: Dimens.space30,
                ),
                const Text(
                  'Sorry, something went wrong. Please try again later',
                ),
              ],
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const EtiqaLoadingWidget();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              TaskModel data = TaskModel.fromJson(
                document.data()! as Map<String, dynamic>,
              );
              return GestureDetector(
                child: TaskCard(
                  taskModel: data,
                  docId: document.id,
                ),
                onTap: () async {
                  await Get.to(
                    DetailsPage(
                      taskModel: data,
                      docId: document.id,
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.to(const DetailsPage());
        },
        tooltip: 'Add new',
        mini: true,
        child: const Icon(Icons.add),
      ),
    );
  }
}
