import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension extContext on BuildContext{
  // AppLocalizations get lang => AppLocalizations.of(this)!;
  Size get sizeOf => MediaQuery.of(this).size;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  EdgeInsets get padding => MediaQuery.of(this).padding;

  bool checkListLength(ScrollController scroll) {
    final RenderBox renderBox = findRenderObject() as RenderBox;
    final double screenHeight = renderBox.size.height;
    final double listHeight = scroll.position.maxScrollExtent + screenHeight;
    return listHeight > screenHeight;
  }

  void requestFocus({FocusNode? focus}) {
    FocusScope.of(this).requestFocus(focus);
  }

  void unFocus({FocusNode? focus}) {
    if (focus != null) {
      focus.unfocus();
    } else {
      FocusScope.of(this).unfocus();
    }
  }

  Future bottomSheet(
      Widget child, {
        bool isScrollControlled = true,
        bool useSafeArea = true,
      }) async {
    return showModalBottomSheet(
      context: this,
      builder: (context) => child,
      isScrollControlled: isScrollControlled,
      useSafeArea: useSafeArea,
      backgroundColor: Colors.transparent,
      //shape: RoundedRectangleBorder(borderRadius: 20.radiusTop),
    );
  }

  Future dialog(Widget child) async {
    return showDialog(
      context: this,
      builder: (context) => child,
    );
  }

}