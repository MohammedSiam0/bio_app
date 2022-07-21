import 'package:bio_app/screen/widgets/custom_listtitle_bio_card.dart';
import 'package:bio_app/screen/widgets/custom_bio_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BioScreen extends StatelessWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  جعل المحتوى فوق بداية الشاشة
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // جعل النص في وسط الاب بار
        centerTitle: true,
        title: const Text(
          'Bio',
          style: TextStyle(color: Colors.black),
        ),
        // الظل الموجود صفر
        elevation: 0,
        // لون الخلفية شفاف لا يوجد لون
        backgroundColor: Colors.transparent,
      ),

      body: Container(
        //  لا يجوز استخام اللون خارج التدرج اللوني بوكس ديكوريشن
        // color: Colors.orange,
        decoration: const BoxDecoration(
          // color: Colors.orange,
          // تدرج لوني  من ازرق واصفر
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xFF6E85B7),
              Color(0xFFF8F9D7),
            ],
          ),
        ),

        child: Column(
          // جعل المحتوى في نصف الشاشة بالاتجاه العمودي الديفولت
          mainAxisAlignment: MainAxisAlignment.center,
          // جعل المحتوى في نصف الشاشة بالاتجاه الافقي عكس الكولم
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            // const CircleAvatar(
            //   radius: 50,
            //   backgroundImage: NetworkImage(
            //       'https://cdn-icons-png.flaticon.com/128/3135/3135715.png'),
            // ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'images/user.png'),
            ),
            const SizedBox(height: 10),
            Text('Mohammed Siam',
                style: GoogleFonts.cairo(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Im a programing Im a programing ',
                style: GoogleFonts.cairo(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    height:
                        1 // هاي علشان في مسافة ديفولت بين النصوص , ويفضل  0.8 و 0.5
                    )),
            const Divider(
              thickness: 0.8,
              height: 40,
              color: Color(0X484848FF),
              indent: 45,
              endIndent: 45,
            ),
            CustomBioCard(
              leadingIcon: Icons.phone_android_outlined,
              title: 'Mobile',
              subTitle: '+972-592-149-300',
              trailingIcon: Icons.phone,
              marginBouttom: 10,
              onActionPress: () {
                //  طريقة تعريف الفنكشن بتختلف عن الثانية استخدمت typedef
                print('Call Me');
                _showMessage(context, message: 'Call Me');
              },
            ),
            CustomBioCard(
              leadingIcon: Icons.email,
              title: 'Email',
              subTitle: 'Mohammedsiam059@gmail.com',
              trailingIcon: Icons.send,
              onActionPress: () {
                print('Send Email');
                _showMessage(context, message: 'Send Email');
              },
              marginBouttom: 10,
            ),
            CustomListTitleBioCard(
                leadingIcon: Icons.social_distance,
                title: 'Account',
                subTitle: 'All Account For Social Media',
                trailingIcon: Icons.ads_click,
                marginBottom: 10,
                onActionPressed: () {
                  print('Social Media');
                  _showMessage(context, message: 'Social Media');
                }),
            CustomListTitleBioCard(
              leadingIcon: Icons.location_searching_outlined,
              title: 'Location',
              subTitle: 'Gaza - North Gaza',
              trailingIcon: Icons.location_city_rounded,
              onActionPressed: () {
                // طريقة تعريف الفنكشن بتخ تلف عن الاولة
                print('Open Map');
                _showMessage(context, message: 'Open Map');
              },
            ),
            Spacer(),
            Text(
              'All Rights Reserved©',
              style:
                  GoogleFonts.cairo(fontWeight: FontWeight.w300, fontSize: 12),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        // الوضع الطبيعي لشكل ال snack bar  هوا تلاصقه بالشاشة من الاسفل fixed
        // behavior: SnackBarBehavior.fixed,
        // شكل ال snack bar العائم بالاسفل floating
        behavior: SnackBarBehavior.floating,

        // ممنوع  اطلاقا استخدام ال margin , width
        // width: 100,
        // margin: EdgeInsets.all(10),
        // اتجاه الا خفاء او انتهاء الsnack bar من اي اتجاه
        dismissDirection: DismissDirection.horizontal,
        // مدة ظهور الsnack bar
        duration: Duration(seconds: 3),
        //  padding: EdgeInsets.all(20),
        elevation: 5,
        // الحدث عند الظهور هل تريد التراجع عن الحدف الخ ...
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {},
          textColor: Colors.white,
        ),
        // لما يظهر ال snack bar  اطبعلي ..
        onVisible: () => print('Visable'),
        // لعمل حواف دائرية للشكل
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
