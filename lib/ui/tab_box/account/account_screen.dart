import 'package:book_reader/provider/profile_provider.dart';
import 'package:book_reader/ui/tab_box/account/widgets/change_language.dart';
import 'package:book_reader/ui/tab_box/account/widgets/universal_list_tile.dart';
import 'package:book_reader/utils/colors.dart';
import 'package:book_reader/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final switchProvider = context.read<ProfileProvider>();
    final modeProvider = context.read<ProfileProvider>();

    return Scaffold(
       appBar: AppBar(
        title: Text(tr('Account'),style: Theme.of(context).textTheme.titleLarge,),
        elevation: 0,
      ),
      body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        15.ph,
                        Text(
                          tr('Account_Settings'),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 22,
                                  color: AppColors.black.withOpacity(0.3)),
                        ),
                        15.ph,
                        UniversalListTile(
                            title: tr('Change_language'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_outlined),
                            onTap: () {
                              changeLanguageDialog(context);
                            }),
                        15.ph,
                        UniversalListTile(
                            title: tr('Push_notifications'),
                            trailing: CupertinoSwitch(
                                value: switchProvider.switchValue,
                                onChanged: (bool value) {
                                  setState(() {
                                    switchProvider.switchValue = value;
                                  });
                                }),
                            onTap: null),
                        15.ph,
                        UniversalListTile(
                            title: tr('Dark_Mode'),
                            trailing: CupertinoSwitch(
                                value: modeProvider.modeSwitch,
                                onChanged: (bool value) {
                                  setState(() {
                                    switchProvider.modeSwitch = value;
                                  });
                                }),
                            onTap: null),
                        15.ph,
                        const Divider(),
                        Text(
                          tr('More'),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: 22,
                                  color: AppColors.black.withOpacity(0.3)),
                        ),
                        UniversalListTile(
                            title: tr('About_Us'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_outlined),
                            onTap: () {}),
                        UniversalListTile(
                            title: tr('Privacy_Policy'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_outlined),
                            onTap: () {}),
  
                      ],
                    ),
                  ),
                ),
              )
    );
  }

 


}
