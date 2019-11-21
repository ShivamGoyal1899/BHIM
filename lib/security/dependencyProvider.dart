import 'package:flutter/material.dart';
import 'rsaHandling.dart';

class DependencyProvider extends InheritedWidget {
  static DependencyProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(DependencyProvider)
        as DependencyProvider);
  }

  DependencyProvider({
    Key key,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  RsaKeyHelper getRsaKeyHelper() {
    return RsaKeyHelper();
  }
}
