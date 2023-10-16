import 'package:book_reader/ui/tab_box/book_list/books_list_screen.dart';
import 'package:book_reader/ui/tab_box/favorites_screen.dart';
import 'package:book_reader/ui/tab_box/vocabulary_screen.dart';
import 'package:book_reader/utils/colors.dart';
import 'package:flutter/material.dart';
import 'account/account_screen.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  int currentIndex = 0;

  List<Widget> _screens = [];
  @override
  void initState() {
    _screens = [
      const BooksListScreen(),
      const VocabularyScreen(),
      const FavoritesScreen(),
      const AccountScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.C_DE7773,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (value)=>setState(() {
          currentIndex = value;
        }),
        items:const [
          BottomNavigationBarItem(icon:Icon(Icons.home_outlined,size: 40,),label: ""),
          BottomNavigationBarItem(icon:Icon(Icons.list_alt_sharp,size: 40,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined,size: 40,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined,size: 40,),label: ""),
        ],
      ),
    );
  }
}

