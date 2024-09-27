import 'package:flutter/material.dart';

import '../../utils/themes.dart';

AppBar customAppBar()
{
return AppBar(
          backgroundColor: backgroundColor,
          title: Text('MyNews',style: TextStyle(color: blue,fontWeight: FontWeight.w900,fontSize: 15),),
        );
}