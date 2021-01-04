import 'package:flutter/material.dart';
import 'package:m_demo/redux_demo/ui/material/bottom_navigation.dart';
import 'package:m_demo/redux_demo/ui/page/slidingPage.dart';
import 'package:m_demo/redux_demo/theme/appTheme.dart';
import 'package:m_demo/redux_demo/ui/view_model/user_vm.dart';
import 'accountPage.dart';
import 'mainPage.dart';
import 'cookbookPage.dart';
import 'asymmetricPage.dart';
// import 'package:flutterdemo/material/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<NavigationIconView> _navigationViews;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  int _currentIndex = 0;
  var _pageList;
  @override
  void initState() {
    super.initState();
    // print('${AppTheme.of(context).brightness}');
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
          icon: const Icon(Icons.all_inclusive),
          title: 'Inclusive',
          color:  Colors.blue ,
          vsync: this,isDark: false),
      NavigationIconView(
          icon: const Icon(Icons.favorite_border),
          activeIcon: const Icon(Icons.favorite),
          title: 'Favorites',
          color: Colors.teal,
          vsync: this,isDark: false),
      NavigationIconView(
          icon: const Icon(Icons.grade),
          title: 'Grade',
          color: Colors.deepPurple,
          vsync: this,isDark: false),
      NavigationIconView(
          icon: const Icon(Icons.person),
          title: 'Person',
          color:  Colors.black,
          vsync: this,isDark: false),
    ];

    _navigationViews[_currentIndex].animationController.value = 1;

    _pageList = [
      MainPage(),
      CookHomePage(),
      SlidingPage(),
      AccountScreenBuilder(),
    ];
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // bool isdark = AppTheme.of( context).brightness == Brightness.light ? false:true;
     _navigationViews = <NavigationIconView>[
      NavigationIconView(
          icon: const Icon(Icons.all_inclusive),
          title: 'Inclusive',
          color:  Colors.blue ,
          vsync: this,
          isDark: false),
      NavigationIconView(
          icon: const Icon(Icons.favorite_border),
          activeIcon: const Icon(Icons.favorite),
          title: 'Favorites',
          color: Colors.teal,
          vsync: this,isDark: false),
      NavigationIconView(
          icon: const Icon(Icons.grade),
          title: 'Grade',
          color: Colors.deepPurple,
          vsync: this,isDark: false),
      NavigationIconView(
          icon: const Icon(Icons.person),
          title: 'Person',
          color:  Colors.black,
          vsync: this,isDark: false),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawer(),
      // appBar: AppBar(
      //   title: Text(
      //     'M',
      //     style: new TextStyle(
      //       fontFamily: 'IndieFlower',
      //       fontSize: 30,
      //     ),
      //   ),
      // ),
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationViews
            .map<BottomNavigationBarItem>(
                (NavigationIconView navigationView) => navigationView.item)
            .toList(),
        currentIndex: _currentIndex,
        type: _type,
        //iconSize: 4.0,
        onTap: (int index) {
          setState(() {
            _navigationViews[_currentIndex].animationController.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].animationController.forward();
          });
        },
      ),
    );
  }
}
