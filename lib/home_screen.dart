import 'package:favourite_app/example_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ExampleController controller = Get.put(ExampleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourite Marking App'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(
            () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: controller.fruitList.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                shadowColor: Colors.black54,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  onTap: () {
                    if (controller.tempFavList
                        .contains(controller.fruitList[index].toString())) {
                      controller.removeToFavourite(
                          controller.fruitList[index].toString());
                    } else {
                      controller.addToFavourite(
                          controller.fruitList[index].toString());
                    }
                  },
                  title: Text(
                    controller.fruitList[index].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      controller.fruitList[index][0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: Obx(
                        () => Icon(
                      Icons.favorite,
                      size: 28,
                      color: controller.tempFavList
                          .contains(controller.fruitList[index].toString())
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
