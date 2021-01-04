import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:m_demo/redux_demo/ui/material/animation.dart';
import 'package:m_demo/redux_demo/ui/material/navigation_drawer.dart';
import 'package:m_demo/redux_demo/theme/appTheme.dart';
import 'package:flutter/animation.dart';
import 'package:m_demo/redux_demo/ui/view_model/user_vm.dart';

class AccountPage extends StatefulWidget {
  final UserVM viewModel;
  const AccountPage({Key key, this.viewModel}) : super(key: key);
  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1400));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () {
          _animationController.reset();
        });
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawerDragStartBehavior: DragStartBehavior.down,
        key: _scaffoldKey,
        drawer: NavigationDrawer(),
        body: Container(
          // color: AppTheme.of(context).brightness == Brightness.light
          //     ? Colors.white
          //     : Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        // color:
                        //     AppTheme.of(context).brightness == Brightness.light
                        //         ? Colors.white
                        //         : Colors.black,
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            _scaffoldKey.currentState.openDrawer();
                          },
                          child: Semantics(
                            button: true,
                            label: 'Open drawer',
                            excludeSemantics: true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  // decoration: const BoxDecoration(
                                  //   color: Colors.black,
                                  //   gradient: LinearGradient(
                                  //     colors: [Colors.purple, Colors.pink],
                                  //     begin: Alignment.topRight ,
                                  //     end: Alignment.topLeft,
                                  //   ),
                                  //   // borderRadius: new BorderRadius.all(
                                  //   //     new Radius.circular(20.0)),
                                  //   // (如果值是BoxShape.circle，那么borderRadius将无效)
                                  //   // shape: BoxShape.circle,
                                  //   image: DecorationImage(
                                  //     image: AssetImage('images/login.jpg'),
                                  //   ),
                                  // ),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                        AssetImage('images/login.jpg'),
                                  ),
                                  // decoration: ShapeDecoration(
                                  //     // gradient: LinearGradient(
                                  //     //   colors: [Colors.purple, Colors.pink],
                                  //     //   begin: Alignment.topRight,
                                  //     //   end: Alignment.topLeft,
                                  //     // ),
                                  //     image: DecorationImage(
                                  //       image: AssetImage('images/login.jpg'),
                                  //     ),
                                  //     shape: CircleBorder(
                                  //         side: BorderSide(
                                  //             color: Colors.black,
                                  //             style: BorderStyle.solid,
                                  //             width: 2))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          // color: AppTheme.of(context).brightness ==
                          //         Brightness.light
                          //     ? Colors.white
                          //     : Colors.black,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.fromLTRB(0, 60, 100, 0),
                          child: Text(
                            widget.viewModel.userState.userName,
                            // style: TextStyle(
                            //     color: AppTheme.of(context).brightness ==
                            //             Brightness.light
                            //         ? Colors.black
                            //         : Colors.white
                            //         ),
                          ),
                        ))
                  ],
                ),
              ),
              // Expanded(

              // )
              AnimatedUpArrow(
                animation: _animation,
              ),
            ],
          ),
        ));
  }
}
