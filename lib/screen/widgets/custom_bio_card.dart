import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef printerfunction = void Function();

class CustomBioCard extends StatelessWidget {
  CustomBioCard({
    Key? key,
    // متغيرات  وبنخليها مطلوبة
    required IconData leadingIcon,
    required String title,
    required String subTitle,
    required IconData trailingIcon,
    required onActionPress, // علشان اعمل تخصيص لكل ضغطة
    double marginBouttom = 0,

    // بما انه الكنستركتور list  ف بنمرر القيم بعد ال :  وقبل ال super
  })  : _printerfunction = onActionPress,
        _marginBouttom = marginBouttom,
        _leadingIcon = leadingIcon,
        _title = title,
        _subTitle = subTitle,
        _trailingIcon = trailingIcon,
        super(key: key);

// المتغيرت الي عرفناهم برايفت , وما بننفع نتعامل مع البرايفت في كنستركتور position and optional
  final IconData _leadingIcon;
  final String _title;
  final String _subTitle;
  final IconData _trailingIcon;
  final double _marginBouttom;
  final printerfunction _printerfunction;

  @override
  Widget build(BuildContext context) {
    return Card(
      // هاي الطريقة بتشيل المسافة على جميع الاتجاهات
      //margin: EdgeInsets.zero,
      //  ال constructor ال zero  هوا عبار عن constructor ال only  بقيم افتراضية صفرر
      // margin: EdgeInsets.only(left: 10 , right: 10 , bottom: 10 ,top:  10),
      // ال symmetric بتعطي مسافة لاتجاهين في سطر واحد
      //  margin: EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: _marginBouttom),
      elevation: 5,
      shadowColor: Colors.yellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        //  تم تركيب ال padding  علي عنصر Row  لان الكارد لا تحتوي علي padding
        child: Row(
          children: [
            // Icon(Icons.phone),
            Icon(_leadingIcon),
            // ازاحة بين الايقونة والنص الموجود
            const SizedBox(width: 15),
            Column(
              // العناصر داخل ال column  بتكون في المنتصف ف بنغيرها لبداية ال column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //    'Mobile',
                  _title,
                  style: GoogleFonts.nunito(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  // '+972-592-149-300',
                  _subTitle,
                  style: GoogleFonts.nunito(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            // لازاحة الايقونة اخر ال row  نستخدم طريقتين spacer()  or expanded with align
            const Spacer(),
            // السبيسر اسهل من الطريقة الي تحت هاي
            // IconButton(
            //   onPressed: () {},
            //   icon:  Icon(_trailingIcon),
            IconButton(
              onPressed: _printerfunction,
              icon: Icon(_trailingIcon),
            )
            /*
             //  حل ثاني بدل ال Spacer  لاضافة الايقونة اخر الRow
             Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: IconButton(
                     onPressed: () {},
                     icon: const Icon(Icons.phone),
                   ),
              ),
            ),
         */
          ],
        ),
      ),
    );
  }
}
