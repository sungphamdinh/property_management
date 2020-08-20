import 'package:flutter/material.dart';

class UtilityItem extends StatefulWidget {
  final String name;
  final int iconCodePoint;
  final Function(bool isSelected) onSelectUtility;
  UtilityItem(this.name, this.iconCodePoint, this.onSelectUtility);

  @override
  _UtilityItemState createState() => _UtilityItemState();
}

class _UtilityItemState extends State<UtilityItem> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onSelectUtility(_isSelected);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: _isSelected ? Colors.white : Colors.white10,
            borderRadius: BorderRadius.circular(4),
            border: _isSelected
                ? Border.all(color: Colors.lightBlue, width: 2)
                : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(IconData(widget.iconCodePoint, fontFamily: 'MaterialIcons')),
            SizedBox(
              width: 8,
            ),
            Text(widget.name)
          ],
        ),
      ),
    );
  }
}
