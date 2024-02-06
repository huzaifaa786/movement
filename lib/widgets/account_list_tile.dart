import 'package:academy_app/providers/auth.dart';
import 'package:academy_app/screens/app_translate/translate.dart';
import 'package:academy_app/screens/downloaded_course_list.dart';
import 'package:academy_app/screens/edit_password_screen.dart';
import 'package:academy_app/screens/edit_profile_screen.dart';
import 'package:academy_app/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../screens/account_remove_screen.dart';
import './custom_text.dart';

class AccountListTile extends StatefulWidget {
  final String? titleText;
  final IconData? icon;
  final String? actionType;
  final String? courseAccessibility;

  const AccountListTile({
    Key? key,
    @required this.titleText,
    @required this.icon,
    @required this.actionType,
    this.courseAccessibility,
  }) : super(key: key);

  @override
  State<AccountListTile> createState() => _AccountListTileState();
}

class _AccountListTileState extends State<AccountListTile> {
  void _actionHandler(BuildContext context) {
    if (widget.actionType == 'logout') {
      if (widget.courseAccessibility == 'publicly') {
        Provider.of<Auth>(context, listen: false).logout().then((_) =>
            Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false));
      } else {
        Provider.of<Auth>(context, listen: false).logout().then((_) =>
            Navigator.pushNamedAndRemoveUntil(
                context, '/auth-private', (r) => false));
      }
    } else if (widget.actionType == 'my_messages') {
      Navigator.of(context).pushNamed(MessagesScreen.routeName);
    } else if (widget.actionType == 'edit') {
      Navigator.of(context).pushNamed(EditProfileScreen.routeName);
    } else if (widget.actionType == 'change_password') {
      Navigator.of(context).pushNamed(EditPasswordScreen.routeName);
    } else if (widget.actionType == 'account_delete') {
      Navigator.of(context).pushNamed(AccountRemoveScreen.routeName);
    } else if (widget.actionType == 'language') {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const TranslateScreen()));
    } else {
      Navigator.of(context).pushNamed(DownloadedCourseList.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: kPrimaryColor.withOpacity(0.7),
        radius: 20,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: FittedBox(
            child: Icon(
              widget.icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
      title: Text(widget.titleText!,
        style: TextStyle(
            fontSize: 16,
            color: kTextColor,
            fontWeight: FontWeight.bold)).translate(),
      // title: CustomText(
      //   text: titleText,
      //   colors: kTextColor,
      //   fontSize: 16,
      //   fontWeight: FontWeight.bold,
      // ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: InkWell(
          onTap: () => _actionHandler(context),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: iCardColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              child: ImageIcon(
                const AssetImage("assets/images/long_arrow_right.png"),
                color: kPrimaryColor.withOpacity(0.7),
                size: 25,
              ),
            ),
          ),
        ),
      ),
      // trailing: IconButton(
      //   icon: const Icon(Icons.arrow_forward_ios),
      //   onPressed: () => _actionHandler(context),
      //   color: Colors.grey,
      // ),
    );
  }
}
