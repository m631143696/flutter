import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:m_demo/redux_demo/ui/material/silding_transformer.dart';
import 'package:m_demo/redux_demo/ui/material/sliding_item.dart';
import 'package:m_demo/redux_demo/data/model/slidingboxdata.dart';

class SlidingPage extends StatefulWidget {

  @override
  SlidingPageState createState() => SlidingPageState();
}

class SlidingPageState extends State<SlidingPage> {

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: Slidingtransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  return SlidingPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
