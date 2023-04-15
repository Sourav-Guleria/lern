
  // String? validateDropDown(String? value) {
  //   if (value!.isEmpty) {
  //     return 'Please select date';
  //   } else
  //     return null;
  // }


  // Widget dropDownWidget() {
  //   return DecoratedBox(
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Color.fromRGBO(184, 184, 184, 1)),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: DropdownButton(
  //         value: selectval,
  //         items: [
  //           // ...seprationReasonSearchList.map(
  //           //   (e) => DropdownMenuItem(
  //           //     child: Padding(
  //           //       padding: const EdgeInsets.all(8.0),
  //           //       child: Text(e,
  //           //           style: TextStyle(
  //           //               color: Colors.black,
  //           //               fontWeight: FontWeight.w300,
  //           //               fontSize: 19)),
  //           //     ),
  //           //     value: e,
  //           //   ),
  //           // )
  //           //add items in the dropdown
  //           DropdownMenuItem(
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(
  //                 "Reliance Jio",
  //                 style: TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.w300,
  //                     fontSize: 19),
  //               ),
  //             ),
  //             value: "Reliance Jio",
  //           ),
  //           DropdownMenuItem(
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text("Ajio",
  //                   style: TextStyle(
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.w300,
  //                       fontSize: 19)),
  //             ),
  //             value: "Ajio",
  //           ),
  //           DropdownMenuItem(
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text("Jio Sawan",
  //                   style: TextStyle(
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.w300,
  //                       fontSize: 19)),
  //             ),
  //             value: "Jio Sawan",
  //           ),
  //           DropdownMenuItem(
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(
  //                 "Fresh Zip",
  //                 style: TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.w300,
  //                     fontSize: 19),
  //               ),
  //             ),
  //             value: "Fresh Zip",
  //           ),
  //           DropdownMenuItem(
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text("DAN",
  //                   style: TextStyle(
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.w300,
  //                       fontSize: 19)),
  //             ),
  //             value: "DAN",
  //           ),
  //           DropdownMenuItem(
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text("Haptik",
  //                   style: TextStyle(
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.w300,
  //                       fontSize: 19)),
  //             ),
  //             value: "Haptik",
  //           )
  //         ],
  //         onChanged: (value) {
  //           setState(() {
  //              selectval = value!;
  //           });
  //           //get value when changed
  //           print("You have selected $value");
  //         },
  //         icon: Padding(
  //             padding: EdgeInsets.only(left: 20),
  //             child: Icon(Icons.arrow_drop_down)),
  //         iconEnabledColor: Color.fromRGBO(
  //           112,
  //           112,
  //           112,
  //           1,
  //         ), //Icon color
  //         style: TextStyle(
  //             color: Colors.black, fontSize: 19, fontWeight: FontWeight.w700),
  //         borderRadius: BorderRadius.circular(10),
  //         dropdownColor: Colors.white, //dropdown background color
  //         underline: Container(), //remove underline
  //         isExpanded: true, //make true to make width 100%
  //       ));
  // }