import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:weight_tracker/models/weightSave.dart';
import 'package:weight_tracker/view-models/controller.dart';
import 'history.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({Key? key}) : super(key: key);

  @override
  State<AddRecordView> createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  final TextEditingController _textEditingController = TextEditingController();
  int weight = 70;
  DateTime dateTime = DateTime.now();
  String? note;

  void _saveButtonClk() {
    Navigator.of(context).pop(WeightSave(dateTime, weight, note));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Record'),
      ),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesomeIcons.weightScale,
                      size: 40,
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        NumberPicker(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(8.0)),
                            axis: Axis.horizontal,
                            minValue: 40,
                            maxValue: 130,
                            value: weight,
                            onChanged: (value) {
                              setState(() {
                                weight = value;
                              });
                            }),
                        Icon(
                          FontAwesomeIcons.chevronUp,
                          size: 15,
                        )
                      ],
                    )
                  ]),
            ),
          ),
          GestureDetector(
            onTap: () async {
              var initialDate = DateTime.now();
              dateTime = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100)) ??
                  dateTime;
              setState(() {});
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.calendar,
                      size: 40,
                    ),
                    Expanded(
                        child: Text(
                      DateFormat('EEE,MMM d').format(dateTime),
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Optional note',
              ),
              controller: _textEditingController,
              onChanged: (value) => note = value,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              /*Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HistoryScreen(
                        note: note,
                        dateTime: DateTime.now(),
                        weight: weight,
                      )));*/
            },
            child: Text('Save Record'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0))),
          )
        ],
      ),
    );
  }
}
