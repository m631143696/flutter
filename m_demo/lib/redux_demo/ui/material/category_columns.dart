
import 'package:flutter/material.dart';

import 'package:m_demo/redux_demo/data/model/category.dart';
import 'category_card.dart';

class TwoCategoryCardColumn extends StatelessWidget {
  TwoCategoryCardColumn({
    this.assetBottom,
    this.assetTop,
  }) : assert(assetBottom != null);

  final String assetBottom, assetTop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const spacerHeight = 44.0;

      double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
      double heightOfImages = heightOfCards - CategoryCard.kTextBoxHeight;
      double imageAspectRatio = constraints.biggest.width / heightOfImages;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(start: 28.0),
            child: assetTop != null
                ? CategoryCard(
                    imageAspectRatio: imageAspectRatio,
                    asset: assetTop,
                  )
                : SizedBox(
                    height: heightOfCards,
                  ),
          ),
          SizedBox(height: spacerHeight),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 28.0),
            child: CategoryCard(
              imageAspectRatio: imageAspectRatio,
              asset: assetBottom,
            ),
          ),
        ],
      );
    });
  }
}

class OneCategoryCardColumn extends StatelessWidget {
  OneCategoryCardColumn({this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    // TODO: Replace Column with a ListView (104)
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        CategoryCard(
          asset: asset,
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
