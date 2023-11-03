import 'package:flutter/material.dart';

import '../../core/app_styles.dart';
import '../../core/icons.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  final String hintText;
  final ValueChanged<String> onChanged;
  final String text;

  @override
  // ignore: library_private_types_in_public_api
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      decoration: StyleDatas.inputBox,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(AppIconData.screachClr, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: "  ${widget.hintText}",
          hintStyle: style,
          border: InputBorder.none,
          icon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              AppIconData.search,
              color: Colors.black,
            ),
          ),
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
