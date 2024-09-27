import 'package:flutter/material.dart';
import 'package:mynews/utils/themes.dart';
import 'package:provider/provider.dart';

import '../../providers/provider.dart';

Widget customButton(BuildContext context,
    {required String label, void Function()? onTap}) {
  final width = MediaQuery.sizeOf(context).width;
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration:
          BoxDecoration(color: blue, borderRadius: BorderRadius.circular(10)),
      width: width * 0.55,
      height: 40,
      child: Center(
        child: context.watch<UserProvider>().isloading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: white,
                ))
            : Text(
                label,
                style:
                    const TextStyle(color: white, fontWeight: FontWeight.w700),
              ),
      ),
    ),
  );
}
