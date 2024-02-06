// ignore_for_file: prefer_const_constructors

import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/providers/courses.dart';
import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:provider/provider.dart';

buildPopupDialog(BuildContext context, items) {
  return AlertDialog(
    title: const Text('Notifying').translate(),
    content:  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Do you wish to remove this course?').translate(),
      ],
    ),
    actions: <Widget>[
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text(
          'No',
          style: TextStyle(color: Colors.red),
        ).translate(),
      ),
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
          Provider.of<Courses>(context, listen: false)
              .toggleWishlist(items, true)
              .then((_) =>
                  CommonFunctions.showSuccessToast('Removed from wishlist.'));
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text(
          'Yes',
          style: TextStyle(color: Colors.green),
        ).translate(),
      ),
    ],
  );
}

buildPopupDialogWishList(BuildContext context, isWishlisted, id, msg) {
  return AlertDialog(
    title: const Text('Notifying').translate(),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        msg
            ? const Text('Do you want remove it?').translate()
            : const Text('Do you want to add it?').translate(),
      ],
    ),
    actions: <Widget>[
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text(
          'No',
          style: TextStyle(color: Colors.red),
        ).translate(),
      ),
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
          var msg = isWishlisted ? 'Remove from Wishlist' : 'Added to Wishlist';
          CommonFunctions.showSuccessToast(msg);
          Provider.of<Courses>(context, listen: false)
              .toggleWishlist(id, false);
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text(
          'Yes',
          style: TextStyle(color: Colors.green),
        ).translate(),
      ),
    ],
  );
}
