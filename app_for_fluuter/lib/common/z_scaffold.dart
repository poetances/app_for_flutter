

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'empty_widget.dart';
import 'progress_hud.dart';

/// hud method - start
Future<void> showHintProgressHud(BuildContext context, String hint) {
  return ZScaffold.of(context).showHintProgressHud(hint);
}

Future<void> showSuccessProgressHud(BuildContext context, {String text}) {
  return ZScaffold.of(context).showSuccessProgressHud(text: text);
}

Future<void> showErrorProgressHud(BuildContext context, {String text}) {
  return ZScaffold.of(context).showErrorProgressHud(text: text);
}


void showLoadingProgressHud(BuildContext context, {String text}) {
  ZScaffold.of(context).showLoadingProgressHud(text: text);
}

void dismissProgressHud(BuildContext context) {
  ZScaffold.of(context).dismissProgressHud();
}
/// hud method - end

/// empty widget method - start
void showLoadingEmptyWidget(BuildContext context, {Widget loading}) {
  ZScaffold.of(context).showLoadingEmptyWidget(loading: loading);
}

void showEmptyWidget(BuildContext context, {Text title, Text subTitle, Image placeHoledImage, MaterialButton button}) {
  ZScaffold.of(context).showEmptyWidget(
      title: title,
      subTitle: subTitle,
      placeHoledImage: placeHoledImage,
      button: button
  );
}

void showCustomEmptyWidget(BuildContext context, Widget customWidget) {
  ZScaffold.of(context).showCustomEmptyWidget(customWidget);
}

void dismissEmptyWidget(BuildContext context) {
  ZScaffold.of(context).dismissEmptyWidget();
}
/// empty widget method - end

class ZScaffold extends StatefulWidget {
  
  ZScaffold({
    Key key,
    this.appBar,
    this.body,
    this.hasEmptyWidget,
    this.hasProgressHud,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
  }) : assert(primary != null),
        assert(extendBody != null),
        assert(extendBodyBehindAppBar != null),
        assert(drawerDragStartBehavior != null),
        super(key: key);

  final bool hasProgressHud;
  final bool hasEmptyWidget;
  
  /// If true, and [bottomNavigationBar] or [persistentFooterButtons]
  /// is specified, then the [body] extends to the bottom of the Scaffold,
  final bool extendBody;

  /// If true, and an [appBar] is specified, then the height of the [body] is
  /// extended to include the height of the app bar and the top of the body
  /// is aligned with the top of the app bar.
  final bool extendBodyBehindAppBar;

  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget appBar;

  /// The primary content of the scaffold.
  final Widget body;

  /// A button displayed floating above [body], in the bottom right corner.
  ///
  /// Typically a [FloatingActionButton].
  final Widget floatingActionButton;

  /// Responsible for determining where the [floatingActionButton] should go.
  ///
  /// If null, the [ScaffoldState] will use the default location, [FloatingActionButtonLocation.endFloat].
  final FloatingActionButtonLocation floatingActionButtonLocation;

  /// Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation].
  ///
  /// If null, the [ScaffoldState] will use the default animator, [FloatingActionButtonAnimator.scaling].
  final FloatingActionButtonAnimator floatingActionButtonAnimator;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  ///
  /// Typically this is a list of [FlatButton] widgets. These buttons are
  /// persistently visible, even if the [body] of the scaffold scrolls.
  ///
  /// These widgets will be wrapped in a [ButtonBar].
  ///
  /// The [persistentFooterButtons] are rendered above the
  /// [bottomNavigationBar] but below the [body].
  final List<Widget> persistentFooterButtons;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from either left-to-right ([TextDirection.ltr]) or
  /// right-to-left ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openDrawer] function.
  ///
  /// To close the drawer, use [Navigator.pop].
  ///
  /// {@tool dartpad --template=stateful_widget_material}
  /// To disable the drawer edge swipe, set the
  /// [Scaffold.drawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openDrawer] to open the drawer and [Navigator.pop] to close
  /// it.
  ///
  /// ```dart
  /// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ///
  /// void _openDrawer() {
  ///   _scaffoldKey.currentState.openDrawer();
  /// }
  ///
  /// void _closeDrawer() {
  ///   Navigator.of(context).pop();
  /// }
  ///
  /// @override
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     key: _scaffoldKey,
  ///     appBar: AppBar(title: const Text('Drawer Demo')),
  ///     body: Center(
  ///       child: RaisedButton(
  ///         onPressed: _openDrawer,
  ///         child: const Text('Open Drawer'),
  ///       ),
  ///     ),
  ///     drawer: Drawer(
  ///       child: Center(
  ///         child: Column(
  ///           mainAxisAlignment: MainAxisAlignment.center,
  ///           children: <Widget>[
  ///             const Text('This is the Drawer'),
  ///             RaisedButton(
  ///               onPressed: _closeDrawer,
  ///               child: const Text('Close Drawer'),
  ///             ),
  ///           ],
  ///         ),
  ///       ),
  ///     ),
  ///     // Disable opening the drawer with a swipe gesture.
  ///     drawerEnableOpenDragGesture: false,
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  final Widget drawer;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from right-to-left ([TextDirection.ltr]) or
  /// left-to-right ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openEndDrawer] function.
  ///
  /// To close the drawer, use [Navigator.pop].
  ///
  /// {@tool dartpad --template=stateful_widget_material}
  /// To disable the drawer edge swipe, set the
  /// [Scaffold.endDrawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openEndDrawer] to open the drawer and [Navigator.pop] to
  /// close it.
  ///
  /// ```dart
  /// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ///
  /// void _openEndDrawer() {
  ///   _scaffoldKey.currentState.openEndDrawer();
  /// }
  ///
  /// void _closeEndDrawer() {
  ///   Navigator.of(context).pop();
  /// }
  ///
  /// @override
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     key: _scaffoldKey,
  ///     appBar: AppBar(title: Text('Drawer Demo')),
  ///     body: Center(
  ///       child: RaisedButton(
  ///         onPressed: _openEndDrawer,
  ///         child: Text('Open End Drawer'),
  ///       ),
  ///     ),
  ///     endDrawer: Drawer(
  ///       child: Center(
  ///         child: Column(
  ///           mainAxisAlignment: MainAxisAlignment.center,
  ///           children: <Widget>[
  ///             const Text('This is the Drawer'),
  ///             RaisedButton(
  ///               onPressed: _closeEndDrawer,
  ///               child: const Text('Close Drawer'),
  ///             ),
  ///           ],
  ///         ),
  ///       ),
  ///     ),
  ///     // Disable opening the end drawer with a swipe gesture.
  ///     endDrawerEnableOpenDragGesture: false,
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  final Widget endDrawer;

  /// The color to use for the scrim that obscures primary content while a drawer is open.
  ///
  /// By default, the color is [Colors.black54]
  final Color drawerScrimColor;

  /// The color of the [Material] widget that underlies the entire Scaffold.
  ///
  /// The theme's [ThemeData.scaffoldBackgroundColor] by default.
  final Color backgroundColor;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Snack bars slide from underneath the bottom navigation bar while bottom
  /// sheets are stacked on top.
  ///
  /// The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
  /// and the [body].
  final Widget bottomNavigationBar;

  /// The persistent bottom sheet to display.
  final Widget bottomSheet;
  

  /// If true the [body] and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true.
  final bool resizeToAvoidBottomInset;

  /// Whether this scaffold is being displayed at the top of the screen.
  ///
  /// If true then the height of the [appBar] will be extended by the height
  /// of the screen's status bar, i.e. the top padding for [MediaQuery].
  ///
  /// The default value of this property, like the default value of
  /// [AppBar.primary], is true.
  final bool primary;

  /// {@macro flutter.material.drawer.dragStartBehavior}
  final DragStartBehavior drawerDragStartBehavior;

  /// The width of the area within which a horizontal swipe will open the
  /// drawer.
  ///
  /// By default, the value used is 20.0 added to the padding edge of
  /// `MediaQuery.of(context).padding` that corresponds to [alignment].
  /// This ensures that the drag area for notched devices is not obscured. For
  /// example, if `TextDirection.of(context)` is set to [TextDirection.ltr],
  /// 20.0 will be added to `MediaQuery.of(context).padding.left`.
  final double drawerEdgeDragWidth;

  /// Determines if the [Scaffold.drawer] can be opened with a drag
  /// gesture.
  ///
  /// By default, the drag gesture is enabled.
  final bool drawerEnableOpenDragGesture;

  /// Determines if the [Scaffold.endDrawer] can be opened with a
  /// drag gesture.
  ///
  /// By default, the drag gesture is enabled.
  final bool endDrawerEnableOpenDragGesture;
  
  @override
  ZScaffoldState createState() => ZScaffoldState();

  static ZScaffoldState of(BuildContext context) {
    final ZScaffoldState result = context.findAncestorStateOfType<ZScaffoldState>();
    if(result != null) return result;
    throw FlutterError('ZScaffoldState.of() called with a context that does not contain a ZScaffoldState.');
  }
}

class ZScaffoldState extends State<ZScaffold> {

  GlobalKey<ProgressHudState> _hudKey = GlobalKey();
  GlobalKey<EmptyWidgetState> _emptyWidgetKey = GlobalKey();

  /// hud method - start
  Future<void> showHintProgressHud(String hint) {
    return _hudKey.currentState.showHint(hint: hint);
  }

  Future<void> showSuccessProgressHud({String text}) {
    return _hudKey.currentState.showSuccess(text: text);
  }

  Future<void> showErrorProgressHud({String text}) {
    return _hudKey.currentState.showError(text: text);
  }


  void showLoadingProgressHud({String text}) {
    _hudKey.currentState.showLoading(text: text);
  }

  void dismissProgressHud() {
    _hudKey.currentState.dismiss();
  }
  /// hud method - end

  /// empty widget method - start
  void showLoadingEmptyWidget({Widget loading}) {
    _emptyWidgetKey.currentState.showLoadingEmptyWidget(loading: loading);
  }

  void showEmptyWidget({Text title, Text subTitle, Image placeHoledImage, MaterialButton button}) {
    _emptyWidgetKey.currentState.showEmptyWidget(
        title: title,
        subTitle: subTitle,
        placeHoledImage: placeHoledImage,
        button: button
    );
  }

  void showCustomEmptyWidget(Widget customWidget) {
    _emptyWidgetKey.currentState.showCustomEmptyWidget(customWidget);
  }

  void dismissEmptyWidget() {
    _emptyWidgetKey.currentState.dismissEmptyWidget();
  }
  /// empty widget method - end


  @override
  Widget build(BuildContext context) {

    Widget body = widget.body;
    if(widget.hasEmptyWidget) {
      body = EmptyWidget(
        key: _emptyWidgetKey,
        child: body,
      );
    }

    if(widget.hasProgressHud) {
      body = ProgressHud(
        key: _hudKey,
        child: body,
      );
    }

    return Scaffold(
      appBar: widget.appBar,
      body: body,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      persistentFooterButtons: widget.persistentFooterButtons,
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      bottomNavigationBar: widget.bottomNavigationBar,
      bottomSheet: widget.bottomSheet,
      backgroundColor: widget.backgroundColor,
      primary: widget.primary,
      drawerDragStartBehavior: widget.drawerDragStartBehavior,
      extendBody: widget.extendBody,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      drawerScrimColor: widget.drawerScrimColor,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
    );
  }

}

