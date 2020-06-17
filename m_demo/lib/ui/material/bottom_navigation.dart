import 'package:flutter/material.dart';

class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    Color color,
    TickerProvider vsync,
    bool isDark,
  })  : _icon = icon,
        _color = color,
        _title = title,
        item = BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'IndieFlower',
              fontSize: 16,
            ),
          ),
          backgroundColor: isDark? Colors.black : color,
        ),
        animationController = AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = animationController.drive(CurveTween(
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));
  }

  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController animationController;
  Animation<double> _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }
    return FadeTransition(
        opacity: _animation,
        child: SlideTransition(
          position: _animation.drive(
            Tween<Offset>(begin: const Offset(0.0, 0.02), end: Offset.zero),
          ),
          child: IconTheme(
            data: IconThemeData(
              color: iconColor,
              size: 120.0,
            ),
            child: Semantics(
              label: 'Placeholder for $_title tab',
              child: _icon,
            ),
          ),
        ));
  }
}

class BottomNavigation extends StatefulWidget {
  BottomNavigation(this._navigationViews);
  static const String routeName = '/material/bottom_navigation';
  final List<NavigationIconView> _navigationViews;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  


  @override
  void dispose() {
    for (NavigationIconView view in widget._navigationViews)
      view.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: widget._navigationViews
          .map<BottomNavigationBarItem>((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      //iconSize: 4.0,
      onTap: (int index) {
        setState(() {
          widget._navigationViews[_currentIndex].animationController.reverse();
          _currentIndex = index;
          widget._navigationViews[_currentIndex].animationController.forward();
        });
      },
    );
    return botNavBar;
  }
}
