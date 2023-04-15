
// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
//  Widget searchField(
//       String hintText, TextEditingController textEditingController, List list) {
//     return TypeAheadField(
//         textFieldConfiguration: TextFieldConfiguration(
//           decoration: InputDecoration(
//             // suffixIcon: Icon(Icons.calendar_month_rounded,
//             //     color: Color.fromRGBO(112, 112, 112, 1)),
//             focusColor: Color.fromRGBO(184, 184, 184, 1),
//             border: OutlineInputBorder(
//                 borderSide:
//                     const BorderSide(color: Color.fromRGBO(184, 184, 184, 1)),
//                 borderRadius: BorderRadius.circular(10)),
//             hintText: hintText,
//             hintStyle: const TextStyle(
//                 color: Color.fromRGBO(184, 184, 184, 1),
//                 fontWeight: FontWeight.normal,
//                 fontSize: 15),
//             errorText: validate ? 'Value Can\'t Be Empty' : null,
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide:
//                   const BorderSide(color: Color.fromRGBO(184, 184, 184, 1)),
//             ),
//           ),
//           controller: textEditingController,
//         ),
//         suggestionsCallback: (pattern) async {
//           return await getSuggestions(
//             list,
//             pattern,
//           );
//         },
//         transitionBuilder: (context, suggestionsBox, controller) {
//           return suggestionsBox;
//         },
//         itemBuilder: (context, suggestion) {
//           return ListTile(
//             title: Text(suggestion),
//           );
//         },
//         onSuggestionSelected: (suggestion) {
//           textEditingController.text = suggestion;
//         });
//   }
