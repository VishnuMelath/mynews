import 'package:flutter/material.dart';
import 'package:mynews/utils/themes.dart';

Widget customButton(BuildContext context,{required String label , void Function()? onTap})
{
  final width=MediaQuery.sizeOf(context).width;
  return InkWell(onTap: onTap,
  child: Container(
    decoration: BoxDecoration(
      color: blue,
      borderRadius: BorderRadius.circular(10)
    ),
    width:width*0.55 ,
    height: 40,
    child: Center(child: Text(label,style: const TextStyle(color: white,fontWeight: FontWeight.w700),),),
  ),
  );
}