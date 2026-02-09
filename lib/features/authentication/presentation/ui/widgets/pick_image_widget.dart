import 'dart:io';

import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:flutter/material.dart';

class PickImageWidget extends StatelessWidget {
  final File? profileImage;
  final void Function()? pickImage;
  const PickImageWidget({
    super.key,
    required this.profileImage,
    this.pickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.lightBlueColor,
            ),
            child: profileImage == null
                ? Icon(
                    Icons.person,
                    size: 60,
                    color: context.colorScheme.lightGreyColor,
                  )
                : ClipOval(child: Image.file(profileImage!, fit: BoxFit.cover)),
          ),

          Positioned(
            top: 5,
            right: 10,
            child: GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 19.h,
                width: 19.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
