import 'package:flutter/material.dart';

class UtilityWidgets {
  static Widget buildTagBoxWidget(String title, {Color color: Colors.red}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        title,
        style: TextStyle(color: color),
      ),
    );
  }

  static Container buildContainerOf({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  static ListTile buildTileOf(
    String title, {
    String? subTitle,
    Widget? trailing,
    Widget? leading,
    VisualDensity visualDensity = VisualDensity.compact,
    EdgeInsets contentPadding = EdgeInsets.zero,
  }) {
    return ListTile(
      contentPadding: contentPadding,
      visualDensity: visualDensity,
      leading: leading,
      title: Text(title),
      subtitle: subTitle == null ? null : Text(subTitle),
      trailing: trailing,
    );
  }
}
