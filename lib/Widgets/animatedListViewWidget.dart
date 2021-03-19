import 'package:flutter/material.dart';

Widget animatedLv(Map data) {
  return AnimatedList(
    initialItemCount: data.length,
    itemBuilder: (context, index, animation) {
      return ListTile(
        leading: Text('hey'),
      );
    },
  );
}
