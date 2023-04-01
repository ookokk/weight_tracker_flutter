import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/models/record.dart';
import 'package:weight_tracker/widgets/record_list_tile.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/view-models/controller.dart';

class HistoryScreen extends StatefulWidget {
  int? weight;
  DateTime? dateTime = DateTime.now();
  String? note;

  HistoryScreen({
    this.weight,
    this.dateTime,
    this.note,
    Key? key,
  }) : super(key: key);
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    List<Record> records = _controller.records;
    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("History"),
          ),
          body: records.isEmpty
              ? Center(
                  child: Container(
                    child: Text('Please Add Some Records'),
                  ),
                )
              : ListView(
                  physics: BouncingScrollPhysics(),
                  children: records
                      .map((record) => RecordListTile(record: record))
                      .toList()),
        ));
  }
}
