import 'package:book_reader/utils/images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> changeLanguageDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(tr('Choose_your_language')),
              actions: [
                ListTile(
                    title: Text('Uzbek'),
                    leading: SvgPicture.asset(AppImages.uz,height: 35,width: 35,),
                    onTap: (){
                      context.setLocale(const Locale('uz', 'UZ'));
                    },
                  ),
                  ListTile(
                    title: Text('English'),
                    leading: SvgPicture.asset(AppImages.eng,height: 35,width: 35,),
                    onTap: (){
                       context.setLocale(const Locale('en', 'EN'));
                    },
                  ),
                  ListTile(
                    title: Text('Russian'),
                    leading: SvgPicture.asset(AppImages.ru,height: 35,width: 35,),
                    onTap: (){
                      context.setLocale(const Locale('ru', 'RU'));
                    }, 
                  ),
              ],);
        });
  }