import 'package:flutter/material.dart';
import 'package:to_do_app/text_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  Function(int)? saveEdit;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    this.saveEdit,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // to get input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                hintText: "Enter a task",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // cancel button
                CustBotton(
                  color: Colors.red,
                  onPressed: onCancel,
                  text: 'Cancel',
                  child: null,
                ),
                const SizedBox(
                  width: 12,
                ),
                // Save button
                CustBotton(
                  color: Colors.green,
                  onPressed: onSave,
                  saveEditTask: saveEdit,
                  text: 'Save',
                  child: null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
