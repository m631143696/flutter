// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m_demo/redux_demo/data/model/category.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({this.imageAspectRatio: 33 / 49, this.asset})
      : assert(imageAspectRatio == null || imageAspectRatio > 0);

  final double imageAspectRatio;
  final String asset;

  static final kTextBoxHeight = 65.0;

  @override
  Widget build(BuildContext context) {
    // final NumberFormat formatter = NumberFormat.simpleCurrency(
    //     decimalDigits: 0, locale: Localizations.localeOf(context).toString());
    // final ThemeData theme = Theme.of(context);

    final imageWidget = Image.asset(
      asset,
      fit: BoxFit.cover,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: imageAspectRatio,
          child: imageWidget,
        ),
        // SizedBox(
        //   height: kTextBoxHeight * MediaQuery.of(context).textScaleFactor,
        //   width: 121.0,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: <Widget>[

        //     ],
        //   ),
        // ),
      ],
    );
  }
}
