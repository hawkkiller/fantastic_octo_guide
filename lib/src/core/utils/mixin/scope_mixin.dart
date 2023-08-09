import 'package:flutter/material.dart';

/// A mixin which provides some useful methods for working with inherited widgets.
/// If you need to get a scope from the context, use [scopeMaybeOf] or [scopeOf].
/// Also, use this Mixin if you want to provide a scope to descendants.
mixin ScopeMixin<T extends Widget> on Widget {
  /// Get scope from context
  static T? scopeMaybeOf<T extends InheritedWidget>(
    BuildContext context, {
    bool listen = true,
  }) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<T>()
          : context.getInheritedWidgetOfExactType<T>();

  /// Get scope from context
  static T scopeOf<T extends InheritedWidget>(
    BuildContext context, {
    bool listen = true,
  }) =>
      scopeMaybeOf<T>(context, listen: listen) ??
      notFoundInheritedWidgetOfExactType<T>();

  /// Throw an error if the scope is not found
  static Never
      notFoundInheritedWidgetOfExactType<T extends InheritedWidget>() =>
          throw ArgumentError(
            'Out of scope, not found inherited widget '
                'a $T of the exact type',
            'out_of_scope',
          );
}
