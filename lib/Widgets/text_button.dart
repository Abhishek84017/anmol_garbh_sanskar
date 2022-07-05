import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color? maincolor;
  final VoidCallback? callback;
  final double? width;

  const SignInButton(
      {Key? key,
        this.text,
        this.icon,
        this.maincolor,
        this.callback,
        this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: width,
        height: 40.h,
        child: TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(maincolor!),
              backgroundColor: MaterialStateProperty.all<Color>(maincolor!),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.transparent)
                  )
              )
          ),
          onPressed: callback,
          child: Text(
            text ?? '',
            style: TextStyle(
                color: Palette.BackGroundColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,),
          ),
        ),
      ),
    );
  }
}