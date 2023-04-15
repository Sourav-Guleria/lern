import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalederWidget extends StatefulWidget {
  CalederWidget({super.key, required this.textEditingController});

  TextEditingController textEditingController;

  @override
  State<CalederWidget> createState() =>
      _CalederWidgetState(textEditingController: textEditingController);
}

class _CalederWidgetState extends State<CalederWidget> {
  _CalederWidgetState({required this.textEditingController});
  TextEditingController textEditingController;
  @override
  String? validateCalendar(String? value) {
    if (value!.isEmpty) {
      return 'Please select date';
    } else
      return null;
  }

  Widget build(BuildContext context) {
    var d;
    d = DateTime.now().year - 17;
    print(d);
    return TextFormField(
      validator: validateCalendar,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(d),
            //DateTime.now(),
            firstDate: DateTime(1963),
            lastDate: DateTime(d));
        //DateTime(2101));
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          setState(() {
            textEditingController.text =
                formattedDate; //set foratted date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
      readOnly: true,
      controller: textEditingController,
      cursorColor: Color.fromRGBO(184, 184, 184, 1),
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.calendar_month_rounded,
            color: Color.fromRGBO(112, 112, 112, 1)),
        focusColor: Color.fromRGBO(184, 184, 184, 1),
        border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(184, 184, 184, 1)),
            borderRadius: BorderRadius.circular(10)),
        hintText: "Enter Date",
        hintStyle: const TextStyle(
            color: Color.fromRGBO(184, 184, 184, 1),
            fontWeight: FontWeight.normal,
            fontSize: 15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color.fromRGBO(184, 184, 184, 1)),
        ),
      ),
    );
  }
}
