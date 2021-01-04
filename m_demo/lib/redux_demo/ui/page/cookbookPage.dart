import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:m_demo/redux_demo/data/model/cooks.dart';
import 'package:m_demo/redux_demo/theme/appTheme.dart';

class CookHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CookbookPage(cooks: kCooksTest);
  }
}

ThemeData _cookTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.teal,
  accentColor: Colors.red,
);
const double _cookSliverAppBarHeight = 128.0;
const double _cookSliverFabHalfSize =
    28.0; // TODO(mpcomplete): needs to adapt to screen size
const double _cookPageMaxWidth = 500.0;
final Set<Cooks> _favoriteCooks = <Cooks>{};

class CookbookPage extends StatefulWidget {
  const CookbookPage({Key key, this.cooks}) : super(key: key);
  final List<Cooks> cooks;
  @override
  CookbookPageState createState() => CookbookPageState();
}

class CookbookPageState extends State<CookbookPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Theme(
      data: _cookTheme.copyWith(platform: Theme.of(context).platform),
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () {
            scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text('Not supported'),
              ),
            );
          },
        ),
        body: CustomScrollView(
          semanticChildCount: widget.cooks.length,
          slivers: <Widget>[
            _buildSliverAppBar(context, statusBarHeight),
            _buildSliverBody(context, statusBarHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context, double statusBarHeight) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: _cookSliverAppBarHeight,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: '搜索',
          onPressed: () {
            scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text('Not supported'),
              ),
            );
          },
        )
      ],
      // backgroundColor: AppTheme.of(context).brightness == Brightness.light ? Colors.teal : Colors.black,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final Size size = constraints.biggest;
        final double appBarHeight = size.height - statusBarHeight;
        final double t = (appBarHeight - kToolbarHeight) /
            (_cookSliverAppBarHeight - kToolbarHeight);
        final double extraPadding =
            Tween<double>(begin: 10.0, end: 24.0).transform(t);
        final double logoHeight = appBarHeight - 1.5 * extraPadding;
        return Padding(
          padding: EdgeInsets.only(
            top: statusBarHeight + 0.5 * extraPadding,
            bottom: extraPadding,
          ),
          child: Center(
            child: CookLogo(height: logoHeight, t: t.clamp(0.0, 1.0)),
          ),
        );
      }),
    );
  }

  Widget _buildSliverBody(BuildContext context, double statusBarHeight) {
    final EdgeInsets mediaPadding = MediaQuery.of(context).padding;
    final EdgeInsets padding = EdgeInsets.only(
      top: 8.0,
      left: 8.0 + mediaPadding.left,
      right: 8.0 + mediaPadding.right,
      bottom: 8.0,
    );
    return SliverPadding(
      padding: padding,
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _cookPageMaxWidth,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final Cooks cooks = widget.cooks[index];
            return CookCard(
              cooks: cooks,
              onTap: () {
                showCookPage(context, cooks);
              },
            );
          },
          childCount: widget.cooks.length,
        ),
      ),
    );
  }

  void showCookPage(BuildContext context, Cooks cooks) {
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Theme(
          data: _cookTheme.copyWith(platform: Theme.of(context).platform),
          child: CookPage(cooks: cooks),
        );
      },
    ));
  }
}

class CookLogo extends StatefulWidget {
  const CookLogo({this.height, this.t});

  final double height;
  final double t;

  @override
  CookLogoState createState() => CookLogoState();
}



class CookLogoState extends State<CookLogo> {
// Native sizes for logo and its image/text components.
  static const double kLogoHeight = 162.0;
  static const double kLogoWidth = 220.0;
  static const double kImageHeight = 108.0;
  static const double kTextHeight = 48.0;

  final TextStyle titleStyle = const CookStyle(
      fontSize: kTextHeight,
      fontWeight: FontWeight.w900,
      color: Colors.white,
      letterSpacing: 3.0);
  final RectTween _textRectTween = RectTween(
    begin: Rect.fromLTWH(0.0, kLogoHeight, kLogoWidth, kTextHeight),
    end: Rect.fromLTWH(0.0, kImageHeight, kLogoWidth, kTextHeight),
  );
  final Curve _textOpacity = const Interval(0.4, 1.0, curve: Curves.easeInOut);
  final RectTween _imageRectTween = RectTween(
    begin: Rect.fromLTWH(0.0, 0.0, kLogoWidth, kLogoHeight),
    end: Rect.fromLTWH(0.0, 0.0, kLogoWidth, kImageHeight),
  );
  @override
  Widget build(BuildContext context) {
    return Semantics(
      namesRoute: true,
      child: Transform(
        transform: Matrix4.identity()..scale(widget.height / kLogoHeight),
        alignment: Alignment.topCenter,
        child:  SizedBox(
          width: kLogoWidth,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned.fromRect(
                rect: _imageRectTween.lerp(widget.t),
                child: Image.asset(
                  'images/icons/icon2.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned.fromRect(
                rect: _textRectTween.lerp(widget.t),
                child: Opacity(
                  opacity: _textOpacity.transform(widget.t),
                  child: Text('CookBook',
                      style: titleStyle, textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CookCard extends StatelessWidget {
  const CookCard({Key key, this.cooks, this.onTap}) : super(key: key);
  final Cooks cooks;
  final VoidCallback onTap;
  TextStyle get titleStyle =>
      const CookStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'images/foods/${cooks.imagePath}',
              child: AspectRatio(
                aspectRatio: 4.0 / 3.0,
                child: Image.asset(
                  cooks.imagePath,
                  package: cooks.imagePackage,
                  fit: BoxFit.cover,
                  semanticLabel: cooks.name,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      cooks.typeImagePath,
                      width: 48.0,
                      height: 48.0,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(cooks.name,
                            style: titleStyle,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CookPage extends StatefulWidget {
  const CookPage({this.cooks});
  final Cooks cooks;

  @override
  CookPageState createState() => CookPageState();
}

class CookPageState extends State<CookPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextStyle menuItemStyle = const CookStyle(
      fontSize: 15.0, color: Colors.black54, height: 24.0 / 15.0);

  double _getAppBarHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.3;

  PopupMenuItem<String> _buildMenuItem(                                                                                                                                        IconData icon, String label) {
    return PopupMenuItem<String>(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(icon, color: Colors.black54),
          ),
          Text(label, style: menuItemStyle),
        ],
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_favoriteCooks.contains(widget.cooks))
        _favoriteCooks.remove(widget.cooks);
      else
        _favoriteCooks.add(widget.cooks);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = _getAppBarHeight(context);
    final Size screenSize = MediaQuery.of(context).size;
    final bool fullWidth = screenSize.width < _cookPageMaxWidth;
    final bool isFavorite = _favoriteCooks.contains(widget.cooks);
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: appBarHeight + _cookSliverFabHalfSize,
            child: Hero(
              tag: '${widget.cooks.imagePath}',
              child: Image.asset(
                widget.cooks.imagePath,
                package: widget.cooks.imagePackage,
                fit: fullWidth ? BoxFit.fitWidth : BoxFit.cover,
              ),
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: appBarHeight - _cookSliverFabHalfSize,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  PopupMenuButton<String>(
                    onSelected: (String item) {},
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<String>>[
                          _buildMenuItem(Icons.share, 'Tweet recipe'),
                          _buildMenuItem(Icons.email, 'Email recipe'),
                          _buildMenuItem(Icons.message, 'Message recipe'),
                          _buildMenuItem(Icons.people, 'Share on Facebook'),
                        ],
                  ),
                ],
                flexibleSpace: const FlexibleSpaceBar(
                  background: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, -0.2),
                        colors: <Color>[Color(0x60000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding:
                          const EdgeInsets.only(top: _cookSliverFabHalfSize),
                      width: fullWidth ? null : _cookPageMaxWidth,
                      child: CooksSheet(cook: widget.cooks),
                    ),
                    Positioned(
                      right: 16.0,
                      child: FloatingActionButton(
                        child: Icon(isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border),
                        onPressed: _toggleFavorite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Displays the recipe's name and instructions.
class CooksSheet extends StatelessWidget {
  CooksSheet({Key key, this.cook}) : super(key: key);

  final TextStyle titleStyle = const CookStyle(fontSize: 34.0);
  final TextStyle descriptionStyle = const CookStyle(
      fontSize: 15.0, color: Colors.black54, height: 24.0 / 15.0);
  final TextStyle itemStyle =
      const CookStyle(fontSize: 15.0, height: 24.0 / 15.0);
  final TextStyle itemAmountStyle = CookStyle(
      fontSize: 15.0, color: _cookTheme.primaryColor, height: 24.0 / 15.0);
  final TextStyle headingStyle = const CookStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0 / 15.0);

  final Cooks cook;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(64.0),
            },
            children: <TableRow>[
              TableRow(children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Image.asset(
                    cook.typeImagePath,
                    // package: cook.typeImagePackage,
                    width: 32.0,
                    height: 32.0,
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(cook.name, style: titleStyle),
                ),
              ]),
              TableRow(children: <Widget>[
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Text(cook.description, style: descriptionStyle),
                ),
              ]),
              TableRow(children: <Widget>[
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
                  child: Text('Ingredients', style: headingStyle),
                ),
              ]),
            ]
              ..addAll(
                  cook.ingredients.map<TableRow>((FoodIngredient ingredient) {
                return _buildItemRow(
                    ingredient.amount, ingredient.ingredientName);
              }))
              ..add(TableRow(children: <Widget>[
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
                  child: Text('Steps', style: headingStyle),
                ),
              ]))
              ..addAll(cook.steps.map<TableRow>((CookStep step) {
                return _buildItemRow(step.duration ?? '', step.description);
              })),
          ),
        ),
      ),
    );
  }

  TableRow _buildItemRow(String left, String right) {
    return TableRow(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(left, style: itemAmountStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(right, style: itemStyle),
        ),
      ],
    );
  }
}
