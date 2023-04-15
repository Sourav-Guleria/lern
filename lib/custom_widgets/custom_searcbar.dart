import 'package:alumni_verification_form/utils/size.dart';
import 'package:alumni_verification_form/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  List getSuggestions(List list, String query) {
    List matches = [];
    matches.addAll(list);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  TextEditingController textEditingController = TextEditingController();
  List list = [];

  @override
  Widget build(BuildContext context) {
    return searchField("", textEditingController, list);
  }

  Widget searchField(String hintText,
      TextEditingController textEditingController, List? list) {
    return SizedBox(
      height: 30,
      child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              prefixIcon: const Icon(
                Icons.search,
                size: 24,
                color: Colors.black,
              ),
              focusColor: Color.fromRGBO(184, 184, 184, 1),
              border: StyleConstant.searchTextFieldOutLineBorder,
              // OutlineInputBorder(
              //     borderSide:
              //         const BorderSide(color: Color.fromRGBO(184, 184, 184, 1)),
              //     borderRadius: BorderRadius.circular(10)),
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Color.fromRGBO(184, 184, 184, 1),
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide:
                    const BorderSide(color: Color.fromRGBO(184, 184, 184, 1)),
              ),
            ),
            controller: textEditingController,
          ),
          suggestionsCallback: (pattern) async {
            return await getSuggestions(
              list!,
              pattern,
            );
          },
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion),
            );
          },
          // noItemsFoundBuilder: (value) {
          //   var localizedMessage = "Message not provider";
          //   return Text(localizedMessage);
          // },
          onSuggestionSelected: (suggestion) {
            textEditingController.text = suggestion;
          }),
    );
  }
}
