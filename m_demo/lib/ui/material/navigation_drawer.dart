import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:m_demo/ui/page/settingsPage.dart';
import 'package:m_demo/theme/appTheme.dart';

class NavigationDrawer extends StatefulWidget {
  static const String routeName = '/material/drawer';
  @override
  NatigationDrawerState createState() => NatigationDrawerState();
}

class NatigationDrawerState extends State<NavigationDrawer>
    with TickerProviderStateMixin {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showDrawerContents = true;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  AnimationController _controller;
  static final Animatable<Offset> _drawerDetailsTween = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: Offset.zero,
  ).chain(CurveTween(
    curve: Curves.fastOutSlowIn,
  ));
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _drawerContentsOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = _controller.drive(_drawerDetailsTween);
  }

  Widget header = MDrawerHeader(
      padding: EdgeInsets.only(top: 0),
      /* padding置为0 */
      child: Container(
        color: Colors.blue,
      )

      //  new Stack(children: <Widget>[
      //   /* 用stack来放背景图片 */
      //   new Image.asset(
      //     'images/dota.jpg',
      //     fit: BoxFit.fill,
      //     width: double.infinity,
      //   ),
      //   new Align(
      //     /* 先放置对齐 */
      //     alignment: FractionalOffset.bottomLeft,
      //     child: Container(
      //       height: 70.0,
      //       margin: EdgeInsets.only(left: 12.0, bottom: 12.0),
      //       child: new Row(
      //         mainAxisSize: MainAxisSize.min,
      //         /* 宽度只用包住子组件即可 */
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: <Widget>[
      //           new CircleAvatar(
      //             backgroundImage: AssetImage('images/login.jpg'),
      //             radius: 35.0,
      //           ),
      //           new Container(
      //             margin: EdgeInsets.only(left: 6.0),
      //             child: new Column(
      //               crossAxisAlignment: CrossAxisAlignment.start, // 水平方向左对齐
      //               mainAxisAlignment: MainAxisAlignment.center, // 竖直方向居中
      //               children: <Widget>[
      //                 new Text(
      //                   "Tom",
      //                   style: new TextStyle(
      //                       fontSize: 20.0,
      //                       fontWeight: FontWeight.w400,
      //                       color: Colors.white),
      //                 ),
      //                 new Text(
      //                   "What's up",
      //                   style: new TextStyle(fontSize: 14.0, color: Colors.white),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ]),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          children: <Widget>[
            ///自定义header
            // header,
            Semantics(
              child: MDrawerHeader(
                child: Container(
                  // color: AppTheme.of(context).brightness == Brightness.light
                  //     ? Colors.white
                  //     : Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          //背景图片
                          // Image.asset(
                          //   'images/drawerBG.jpg',
                          //   fit: BoxFit.fill,
                          //   // width: double.infinity,
                          //   // height: double.infinity,
                          // ),
                          Align(
                            alignment: FractionalOffset.bottomLeft,
                            child: Container(
                
                              height: 70,
                              margin: EdgeInsets.only(left: 12.0, bottom: 12.0),
                              child: Row(
                                //宽度包住子控件
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/login.jpg'),
                                    radius: 35.0,
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(left: 6.0),
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start, // 水平方向左对齐
                                      mainAxisAlignment:
                                          MainAxisAlignment.center, // 竖直方向居中
                                      children: <Widget>[
                                        new Text(
                                          "古月依稀",
                                          style: new TextStyle(
                                              fontFamily: 'IndieFlower',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ///
            ///系统自定义header 无法改变颜色
            // Container(
            //   color: AppTheme.of(context).brightness == Brightness.light
            // ? Colors.orange
            // : Colors.black,
            //   child:
            // UserAccountsDrawerHeader(
            //     accountName: Container(
            //       padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            //       child: Text(
            //         '古月依稀',
            //         style: new TextStyle(
            //           fontFamily: 'IndieFlower',
            //           fontSize: 20,
            //         ),
            //       ),
            //     ),
            //     accountEmail: null,
            //     // accountEmail: Text('testtest',style: new TextStyle(
            //     //       fontFamily: 'IndieFlower',
            //     //       // fontSize: 30,
            //     //     ),),
            //     currentAccountPicture: CircleAvatar(
            //       backgroundImage: AssetImage(
            //         'images/login.jpg',
            //         // package: _kGalleryAssetsPackage,
            //       ),
            //     ),
            //     // otherAccountsPictures: <Widget>[

            //     // ],
            //     margin: EdgeInsets.zero,
            //     // onDetailsPressed: () {
            //     //   _showDrawerContents = !_showDrawerContents;
            //     //   if (_showDrawerContents) {
            //     //     _controller.reverse();
            //     //   } else {
            //     //     _controller.forward();
            //     //   }
            //     // },
            //   ),
            // ),

            MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: Expanded(
                child: ListView(
                  dragStartBehavior: DragStartBehavior.down,
                  padding: EdgeInsets.only(top: 8.0),
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        FadeTransition(
                          opacity: _drawerContentsOpacity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  '系统设置',
                                  style: TextStyle(
                                      // color: AppTheme.of(context).brightness ==
                                      //         Brightness.light
                                      //     ? Colors.black
                                      //     : Colors.white
                                      ),
                                ),
                                leading: CircleAvatar(
                                    child: new Icon(Icons.settings)),
                                onTap: () {
                                  // Navigator.pop(context);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SettingsPage();
                                  }));
                                },
                              ),
                            ],

                            // _drawerContents.map<Widget>((String id) {
                            //   return ListTile(
                            //     leading: CircleAvatar(
                            //       child: Text(id),
                            //     ),
                            //     title: Text('Drawer item $id'),
                            //     onTap: () {
                            //     },
                            //   );
                            // }).toList(),
                          ),
                        ),
                        SlideTransition(
                          position: _drawerDetailsPosition,
                          child: FadeTransition(
                            opacity: ReverseAnimation(_drawerContentsOpacity),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.add),
                                  title: Text('Add account'),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text('Manager account'),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const double _kDrawerHeaderHeight = 160.0 + 1.0; // bottom edge

class MDrawerHeader extends StatelessWidget {
  /// Creates a material design drawer header.
  ///
  /// Requires one of its ancestors to be a [Material] widget.
  const MDrawerHeader({
    Key key,
    this.decoration,
    this.margin = const EdgeInsets.only(bottom: 8.0),
    this.padding = const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.fastOutSlowIn,
    @required this.child,
  }) : super(key: key);

  /// Decoration for the main drawer header [Container]; useful for applying
  /// backgrounds.
  ///
  /// This decoration will extend under the system status bar.
  ///
  /// If this is changed, it will be animated according to [duration] and [curve].
  final Decoration decoration;

  /// The padding by which to inset [child].
  ///
  /// The [DrawerHeader] additionally offsets the child by the height of the
  /// system status bar.
  ///
  /// If the child is null, the padding has no effect.
  final EdgeInsetsGeometry padding;

  /// The margin around the drawer header.
  final EdgeInsetsGeometry margin;

  /// The duration for animations of the [decoration].
  final Duration duration;

  /// The curve for animations of the [decoration].
  final Curve curve;

  /// A widget to be placed inside the drawer header, inset by the [padding].
  ///
  /// This widget will be sized to the size of the header. To position the child
  /// precisely, consider using an [Align] or [Center] widget.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: statusBarHeight + _kDrawerHeaderHeight,
      margin: margin,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context),
        ),
      ),
      child: AnimatedContainer(
        // color: AppTheme.of(context).brightness == Brightness.light
        //     ? Colors.white
        //     : Colors.black,
        padding: padding.add(EdgeInsets.only(top: statusBarHeight)),
        decoration: decoration,
        duration: duration,
        curve: curve,
        child: child == null
            ? null
            : DefaultTextStyle(
                style: theme.textTheme.body2,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: false,
                  child: child,
                ),
              ),
      ),
    );
  }
}
