import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryCheckTile extends StatefulWidget {
  final String title;

  CategoryCheckTile({@required this.title});
  @override
  _CategoryCheckTileState createState() => _CategoryCheckTileState();
}

class _CategoryCheckTileState extends State<CategoryCheckTile> {
  var _isChecked = false;

  void _checkboxCallback(bool checkboxState) {
    setState(() {
      _isChecked = checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: ListTile(
        tileColor: kScaffoldColor,
        title: Text(
          widget.title,
          style: kDescTextStyle,
        ),
        trailing: CatCheckbox(
          checkboxState: _isChecked,
          toggleCheckboxState: _checkboxCallback,
        ),
      ),
    );
  }
}

/////////////// CHECKBOX WIDGET ////////////// 

class CatCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function toggleCheckboxState;

  CatCheckbox({
    @required this.checkboxState,
    @required this.toggleCheckboxState,
  });
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
