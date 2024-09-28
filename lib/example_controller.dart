// Controller File (No Changes)
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleController extends GetxController {
  RxList<String> fruitList = [
    'Orange',
    'Apple',
    'Banana',
    'Mango',
    'Grapes',
    'Kiwi',
    'Peach',
    'Malta',
    'Badam',
    'Kishmish'
  ].obs;

  RxList tempFavList = [].obs;

  addToFavourite(String value) {
    tempFavList.add(value);
  }

  removeToFavourite(String value) {
    tempFavList.remove(value);
  }
}
