import 'package:book_reader/ui/tab_box/account_screen.dart';
import 'package:book_reader/ui/tab_box/book_list/books_list_screen.dart';
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
  List<String> _appBars = [];
  @override
  void initState() {
    _screens = [
      const BooksListScreen(),
      const VocabularyScreen(),
      const FriendsScreen(),
      const FavoritesScreen(),
      const AccountScreen(),
    ];
    _appBars = [
      'Books',
      'Vocabulary',
      'Friends',
      'Favourites',
      'Account',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBars[currentIndex]),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (value)=>setState(() {
          currentIndex = value;
        }),
        items: [
          BottomNavigationBarItem(icon: Image.asset(currentIndex==0?AppImages.booksListOr:AppImages.booksListBlack,height: 40,width: 40,),label: ""),
          BottomNavigationBarItem(icon: Image.asset(currentIndex==1?AppImages.vocab2:AppImages.vocab1,height: 45,width: 45,),label: ""),
          BottomNavigationBarItem(icon: Image.asset(currentIndex==2?AppImages.friends2:AppImages.friends1,height: 45,width: 45,),label: ""),
          BottomNavigationBarItem(icon: Image.asset(currentIndex==3?AppImages.favorite2:AppImages.favorite1,height: 45,width: 45,),label: ""),
          BottomNavigationBarItem(icon: Image.asset(currentIndex==4?AppImages.account2:AppImages.account1,height: 45,width: 45,),label: ""),

        ],
      ),
    );
  }
}

