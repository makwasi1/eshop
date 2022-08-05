import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TopSnackBar extends StatelessWidget {
  String message;
  String infoType;
   TopSnackBar({ Key key, this.infoType, this.message }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBounceContainer(
                    onTap: () {
                      showTopSnackBar(
                        context,
                        CustomSnackBar.success(
                          message:
                              message,
                        ),
                      );
                    }, child: null,
                    
                  )
    );
  }
}