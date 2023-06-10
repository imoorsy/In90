import 'package:flutter/material.dart';

Widget defaultTextFormField(
  context, {
  required TextEditingController controller,
  required TextInputType keyboardtype,
  ValueChanged<String>? submitFunction,
  required FormFieldValidator validator,
  required IconData prefix,
  required String labelText,
  bool isPassword = false,
  IconData? suflix,
  ValueChanged<String>? onchange,
  VoidCallback? suflixpressed,
  VoidCallback? onTap,
  String? value,
  bool autofocus = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardtype,
      autofocus: autofocus,
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.normal,letterSpacing: 1.2,color: Colors.grey),
        prefixIcon: Icon(prefix),
        suffixIcon: suflix != null
            ? IconButton(icon: Icon(suflix), onPressed: suflixpressed)
            : null,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 5)),
      ),
      obscureText: isPassword,
      onFieldSubmitted: submitFunction,
      onChanged: onchange,
      onTap: onTap,
      validator: validator,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal,letterSpacing: 1.2),
    );

Widget defultButton({
  double width = double.infinity,
  double height = 50,
  Color background = Colors.amber,
  double borderRadius = 5.0,
  required Function() pressfunction,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: background,
      ),
      child: MaterialButton(
          onPressed: pressfunction,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );

Widget defaultSearchFormField(
  context, {
  required TextEditingController controller,
  required TextInputType keyboardtype,
  ValueChanged<String>? submitFunction,
  required FormFieldValidator validator,
  required IconData prefix,
  required String labelText,
  bool isPassword = false,
  IconData? suflix,
  ValueChanged<String>? onchange,
  VoidCallback? suflixpressed,
  VoidCallback? onTap,
  String value = '',
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardtype,
      autocorrect: true,
      decoration: InputDecoration(
          hintText: labelText,
          hintStyle: const TextStyle(fontSize: 25,fontWeight: FontWeight.normal,letterSpacing: 1.2,color: Colors.grey),
          prefixIcon: Icon(prefix,color: Colors.green,size: 30,),
          suffixIcon: suflix != null
              ? IconButton(icon: Icon(suflix), onPressed: suflixpressed)
              : null,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          errorStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      obscureText: isPassword,
      onFieldSubmitted: submitFunction,
      onChanged: onchange,
      onTap: onTap,
      validator: validator,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal,letterSpacing: 1.2),
    );

void navigatorGoto(context, Widget widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

enum SnackState { SUCCESS, ERROR, WARNING }

void showSnackBar(context, msg, SnackState state) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: chooseSnackColor(state),
    ));

Color chooseSnackColor(SnackState state) {
  Color color;
  switch (state) {
    case SnackState.SUCCESS:
      color = Colors.green;
      break;
    case SnackState.ERROR:
      color = Colors.red;
      break;
    case SnackState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

String editMatchTime(int hour, int minute) {
  hour = hour;
  int? hur;
  String? min;
  String? tim;

  if(hour > 0 && hour < 12) {
    hur = hour;
    tim = 'am';
  }else if(hour == 0) {
    hur = 12;
    tim = 'pm';
  } else {
    hur = hour - 12;
    tim = 'pm';
  }
  if(minute.bitLength <= 1) {
    min = '0$minute';
  }else {
    min = minute.toString();
  }
  if(hur.bitLength == 1) {
    return '0$hur:$min $tim';
  }else {
    return '$hur:$min $tim';
  }


}

String parseTimeInSec(int ms) {
  String data = "";
  Duration dur = Duration(milliseconds: ms);
  int hor = dur.inHours;
  int min = (dur.inMinutes) - (hor * 60);
  if (hor > 0) data += "$hor:";
  int sec = (dur.inSeconds) - (dur.inMinutes * 60);
  if (min <= 9) data += "0";
  data += "$min:";
  if (sec <= 9) data += "0";
  data += sec.toString();
  return data;
}