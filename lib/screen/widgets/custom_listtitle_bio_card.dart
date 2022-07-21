import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTitleBioCard extends StatelessWidget {
  const CustomListTitleBioCard({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.subTitle,
    required this.trailingIcon,
    this.marginBottom = 0,
    required this.onActionPressed, // علشان اعمل تخصيص لكل ضغطة
  }) : super(key: key);

  final IconData leadingIcon;
  final String title;
  final String subTitle;
  final IconData trailingIcon;
  final double marginBottom;
  final void Function()
      onActionPressed; // هاي الفنكشن الي بتخليني اعمل تخصيص لكل ضغطة على ايقونة في الكارد

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // margin: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: marginBottom),
      shadowColor: Colors.yellow,
      child: ListTile(
        // المسافة حول محتوى الكارد
        // contentPadding: EdgeInsets.zero,
        // المسافة بين النص والايقونة البدائية
        // horizontalTitleGap: 0,
        // خاصية للسماح بالضغط على الcard
        //   onTap: () {},
        // بتخليني اشيل المسافة من فوق وتحت يعني ال padding  الي حول المحتوى
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        // leading: Icon(Icons.email),
        // title: Text('Email'),
        // subtitle: Text('email@app.com'),
        // trailing: IconButton(
        //   onPressed: (){},
        //   icon: Icon(Icons.email_outlined),
        leading: Icon(leadingIcon, color: Colors.black),
        title: Text(
          title,
          style: GoogleFonts.cairo(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(subTitle),
        // trailing: IconButton(
        //   onPressed: () {},
        //   icon: Icon(trailingIcon),
        // ),
        trailing: IconButton(
          color: Colors.black,
          onPressed: onActionPressed, // استدعاء الفنكشن علشان نخصصها
          icon: Icon(trailingIcon),
        ),
      ),
    );
  }
}
