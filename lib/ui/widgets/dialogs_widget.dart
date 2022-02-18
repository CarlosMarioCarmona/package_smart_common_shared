import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smart_common_shared/src/application/enum/platform_dialog_type.dart';
import 'dart:developer' as dev;

import 'package:smart_common_shared/src/application/map/platform_awesome_dialog.dart';

const String logName = 'smart_common_shared';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, String loadingMessage, GlobalKey key) async {
    return showDialog<void>(
        useRootNavigator: false,
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(key: key, children: <Widget>[
                Center(
                  child: Column(children: <Widget>[
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(loadingMessage)
                  ]),
                )
              ]));
        });
  }

  static Future<void> showPlatformDialog({required BuildContext context, required String title, required String content, required PlatformDialogType type, Function? function, dynamic functionParameter}) async {
    try
    {
      Duration? autoHideTime;
      if(type == PlatformDialogType.success)
      {
        autoHideTime = const Duration(seconds: 5);
      }else{
        autoHideTime = null;
      }
      Widget? btnCancel;
      if(type == PlatformDialogType.question)
      {
        btnCancel = TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        );
      }else{
        btnCancel = null;
      }
      double? dialogWidth;
      if(MediaQuery.of(context).size.width > 1024)
      {
        dialogWidth = MediaQuery.of(context).size.width * 0.4;
      }else{
        dialogWidth = null;
      }
      return AwesomeDialog(
        headerAnimationLoop: false,
        autoHide: autoHideTime,
        width: dialogWidth,
        context: context,
        btnCancel: btnCancel,
        btnOk: TextButton(
          onPressed: () {
            if(function != null && functionParameter != null){
              function(functionParameter);
            }
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
        useRootNavigator: false,
        dismissOnBackKeyPress: false,
        aligment: const Alignment(0,-0.8),//Alignment.topCenter,
        dialogBorderRadius: const BorderRadius.all(Radius.circular(2.0)),
        dialogType: dialogType[type]!,
        animType: AnimType.SCALE,
        title: title,
        desc: content,
        dismissOnTouchOutside: false,
      ).show();
    }catch(e){
      dev.log('Something went wrong', error: e, name: logName);
    }
  }


  static Future<void> showActionButtonsDialog({required BuildContext context, required List<ListTile> actionButtonsListTile}) async {
    try
    {
      double? dialogWidth;
      if(MediaQuery.of(context).size.width > 800)
      {
        dialogWidth = MediaQuery.of(context).size.width * 0.4;
      }else{
        dialogWidth = null;
      }
      Column _buildActionButtonsColumn(List<ListTile> listTile) {
        List<Widget> widgetsButton = <Widget>[];
        for(ListTile tile in listTile){
          widgetsButton.add(tile);
        }
        widgetsButton.add(ListTile(title: const Text('Cancel'),trailing: const Icon(Icons.clear), onTap: (){Navigator.pop(context);},));
        Column actionButtonsContent = Column(
          children: widgetsButton,
        );

        return actionButtonsContent;
      }
      return AwesomeDialog(
        body: _buildActionButtonsColumn(actionButtonsListTile),
        width: dialogWidth,
        padding: const EdgeInsets.all(20.0),
        context: context,
        useRootNavigator: false,
        dismissOnBackKeyPress: true,
        dismissOnTouchOutside: true,
        aligment: const Alignment(0,-0.8),//Alignment.topCenter,
        dialogBorderRadius: const BorderRadius.all(Radius.circular(2.0)),
        animType: AnimType.BOTTOMSLIDE,
        dialogType: DialogType.NO_HEADER,
      ).show();
    }catch(e){
      dev.log('Something went wrong', error: e, name: logName);
    }



  }





}