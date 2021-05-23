

import 'package:app_for_fluuter/common/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'progress_hud.dart';

// ignore: slash_for_doc_comments
/***************************** empty view start *************************************/
mixin CanShowEmptyWidgetMixin<T extends StatefulWidget> on State<T> {

  GlobalObjectKey<EmptyWidgetState> get emptyWidgetKey;

  void showLoadingEmptyWidget({Widget loading}) {
    judgeHasEmptyWidgetValue();
    emptyWidgetKey.currentState.showLoadingEmptyWidget(loading: loading);
  }

  void showEmptyWidget({Text title, Text subTitle, Image placeHoledImage, MaterialButton button}) {
    judgeHasEmptyWidgetValue();
    emptyWidgetKey.currentState.showEmptyWidget(
        title: title,
        subTitle: subTitle,
        placeHoledImage: placeHoledImage,
        button: button
    );
  }

  void showCustomEmptyWidget(Widget customWidget) {
    judgeHasEmptyWidgetValue();
    emptyWidgetKey.currentState.showCustomEmptyWidget(customWidget);
  }

  void hiddenEmptyWidget() {
    judgeHasEmptyWidgetValue();
    emptyWidgetKey.currentState.dismissEmptyWidget();
  }

  void judgeHasEmptyWidgetValue() {
    if(emptyWidgetKey == null){
      throw Exception("you must create [progressHudKey]");
    }
    if(emptyWidgetKey.currentState == null){
      throw Exception("ProgressHud must have a [key]。and the key should be [progressHudKey]");
    }
  }

}
/***************************** empty view end *************************************/


// ignore: slash_for_doc_comments
/***************************** progress start *************************************/
mixin CanShowProgressHudWidgetMixin<T extends StatefulWidget> on State<T> {

  GlobalObjectKey<ProgressHudState> get progressHudKey;

  Future showHintProgressHud(String hint) {
    judgeHasProgressHudValue();
    return progressHudKey.currentState.showHint(hint: hint);
  }

  Future showSuccessProgressHud({String msg}) {
    judgeHasProgressHudValue();
    return progressHudKey.currentState.showSuccess(text: msg);
  }

  Future showErrorProgressHud({String msg}) {
    judgeHasProgressHudValue();
    return progressHudKey.currentState.showError(text: msg);
  }


  void showMsgProgressHud(String msg) {
    judgeHasProgressHudValue();
    progressHudKey.currentState.showLoading(text: msg);
  }

  void hiddenProgressHud() {
    judgeHasProgressHudValue();
    progressHudKey.currentState.dismiss();
  }

  void judgeHasProgressHudValue() {
    if(progressHudKey == null){
      throw Exception("you must create [progressHudKey]");
    }
    if(progressHudKey.currentState == null){
      throw Exception("ProgressHud must have a [key]。and the key should be [progressHudKey]");
    }
  }
}
/***************************** progress  end *************************************/







