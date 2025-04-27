import 'package:flutter/widgets.dart';

// get width screen device
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

// get height screen device
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;
