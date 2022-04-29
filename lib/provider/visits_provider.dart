import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../models/visit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VisitsProvider with ChangeNotifier {
  List _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  Future<void> getTasks() async {
    try {
      var url =
          Uri.parse('https://onsitetracking.trottedmedia.com/api/visits.php');
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Task> loadedData = [];
      extractedData.forEach((taskId, taskData) {
        loadedData.add(Task(
            visitId: taskId,
            contactName: taskData['contact'],
            status: taskData['visitstatus']));
      });

      _tasks = loadedData;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  int getCount(int thestatus) {
    List TaskbyStatus =
        tasks.where((element) => element.status == '$thestatus').toList();
    int Itemscount = TaskbyStatus.length;

    return Itemscount;
  }
}
