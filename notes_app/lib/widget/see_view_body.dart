import 'package:flutter/material.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/core/notificationservies.dart';
import 'package:notes_add/widget/dropdownlist.dart';

class SeeViewBody extends StatefulWidget {
  const SeeViewBody({super.key, required this.note});

  final Note_Model note;

  @override
  State<SeeViewBody> createState() => _SeeViewBodyState();
}

class _SeeViewBodyState extends State<SeeViewBody> {
  String? selectedYear;
  String? selectedMonth;
  String? selectedDay;
  String? selectedHour;
  String? selectedMinute;

  @override
  Widget build(BuildContext context) {
    List<String> hours = List.generate(24, (index) => '${index + 1}');
    List<String> minutes = List.generate(59, (index) => '${index + 1}');
    List<String> years = List.generate(11, (index) => '${2025 + index}');
    List<String> months = List.generate(12, (index) => '${index + 1}');
    List<String> days = List.generate(30, (index) => '${index + 1}');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Card(
              child: ListTile(
                title: Text(widget.note.title),
                subtitle: Text(widget.note.subtitle),
                trailing: Text(widget.note.date),
              ),
            ),
            const SizedBox(height: 25),
            const Text("Choose Your Date"),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                    child: Dropdownlist(
                        valuechoose: selectedYear,
                        onChanged: (value) {
                          setState(() {
                            selectedYear = value;
                          });
                        },
                        hint: "Select year",
                        list: years)),
                const SizedBox(width: 12),
                Expanded(
                    child: Dropdownlist(
                        valuechoose: selectedMonth,
                        onChanged: (value) {
                          selectedMonth = value;
                          setState(() {
                            selectedMonth = value;
                          });
                        },
                        hint: "Select month",
                        list: months)),
                const SizedBox(width: 12),
                Expanded(
                    child: Dropdownlist(
                        valuechoose: selectedDay,
                        onChanged: (value) {
                          selectedDay = value;
                          setState(() {
                            selectedDay = value;
                          });
                        },
                        hint: "Select day",
                        list: days)),
              ],
            ),
            const SizedBox(height: 25),
            const Text("Choose Your Time"),
            Row(
              children: [
                Expanded(
                    child: Dropdownlist(
                        valuechoose: selectedHour,
                        onChanged: (value) {
                          setState(() {
                            selectedHour = value;
                          });
                        },
                        hint: "Select hour",
                        list: hours)),
                const SizedBox(width: 12),
                Expanded(
                    child: Dropdownlist(
                        valuechoose: selectedMinute,
                        onChanged: (value) {
                          setState(() {
                            selectedMinute = value;
                          });
                        },
                        hint: "Select minute",
                        list: minutes)),
              ],
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                if (selectedYear != null &&
                    selectedMonth != null &&
                    selectedDay != null &&
                    selectedHour != null &&
                    selectedMinute != null) {
                  NotificationServices.showScheduledNotification(
                      selectedYear!,
                      selectedMonth!,
                      selectedDay!,
                      selectedHour!,
                      selectedMinute!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Save Your Date")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select all fields")),
                  );
                }
              },
              child: const Text("Schedule Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
