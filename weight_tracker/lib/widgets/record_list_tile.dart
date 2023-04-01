import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/models/record.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/view-models/controller.dart';

class RecordListTile extends StatelessWidget {
  final Record record;

  RecordListTile({Key? key, required this.record}) : super(key: key);
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: ListTile(
          leading: _buildDate(record: record),
          title: _buildWeight(),
          trailing: _buildIcons(),
        ),
      ),
    );
  }

  Center _buildWeight() {
    return Center(
        child: Text(
      record.weight.toString(),
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ));
  }
}

class _buildIcons extends StatefulWidget {
  const _buildIcons({
    super.key,
  });

  @override
  State<_buildIcons> createState() => _buildIconsState();
}

class _buildIconsState extends State<_buildIcons> {
  final Controller _controller = Get.find();
  late final Record record;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.edit,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {
              _controller.deleteRecord(record);
              setState(() {});
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ))
      ],
    );
  }
}

class _buildDate extends StatelessWidget {
  const _buildDate({
    super.key,
    required this.record,
  });

  final Record record;

  @override
  Widget build(BuildContext context) {
    return Text(DateFormat('EEE,MMM d').format(record.dateTime));
  }
}
