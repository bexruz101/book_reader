import 'package:book_reader/ui/tab_box/account_screen.dart';
import 'package:book_reader/ui/tab_box/books_list_screen.dart';
import 'package:book_reader/ui/tab_box/favorites_screen.dart';
import 'package:book_reader/ui/tab_box/friends_screen.dart';
import 'package:book_reader/ui/tab_box/vocabulary_screen.dart';
import 'package:book_reader/utils/images.dart';
import 'package:flutter/material.dart';

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
      const AccountScreen(),
      const BooksListScreen(),
      const FavoritesScreen(),
      const FriendsScreen(),
      const VocabularyScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Image.asset(AppImages.booksListBlack,height: 40,width: 40,),label: ""),
          BottomNavigationBarItem(icon: Image.asset(AppImages.vocab1,height: 45,width: 45,),label: ""),
          BottomNavigationBarItem(icon: Image.asset(AppImages.friends1,height: 45,width: 45,),label: ""),
          BottomNavigationBarItem(icon: Image.asset(AppImages.favorite1,height: 45,width: 45,),label: ""),
          BottomNavigationBarItem(icon: Image.asset(AppImages.account1,height: 45,width: 45,),label: ""),
        ],
      ),
    );
  }
}

