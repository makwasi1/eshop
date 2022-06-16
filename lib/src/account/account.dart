import 'package:eshop/src/about/about.dart';
import 'package:eshop/src/call_center/call_center.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/notifications/notification_list.dart';
import 'package:eshop/src/orders/track_map.dart';
import 'package:eshop/src/orders/track_orders.dart';
import 'package:eshop/src/payments/payment_details.dart';
import 'package:eshop/src/settings/settings.dart';
import 'package:eshop/src/widgets/message.dart';
import 'package:flutter/material.dart';


class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: [
              Container(
                height: 250.0,
                child: Image(
                  image: AssetImage(bg),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -60.0,
                child: Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: kWhiteColor,
                      width: kLess,
                    ),
                    image: DecorationImage(
                      image: AssetImage(profile),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -88.0,
                child: Text(
                  'Username',
                  style: kDarkTextStyle,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 88.0),
              itemCount: labels.length,
              itemBuilder: (context, index) {
                return ListTile(
                    // dense: true,
                    leading: Icon(
                      icons[index],
                      color: kPrimaryColor,
                    ),
                    title: Text(labels[index]),
                    onTap: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          switch (labels[index]) {
                            case 'Notifications':
                              return NotificationList();
                              break;
                            case 'Payments':
                              return PaymentDetails();
                              break;
                            case 'Message':
                              return Message();
                              break;
                            case 'My Orders':
                              return TrackOrder();
                              break;
                            case 'Live Tracking':
                              return  SimpleMap();
                              break;
                            case 'Setting Account':
                              return Setting();
                              break;
                            case 'Call Center':
                              return CallCenter();
                            case 'About Application':
                              return About();
                              break;
                            default:
                              return null;
                          }
                        }))
                    // onTap: () => this.setState(
                    //   () {
                    //     switch (labels[index]) {
                    //       case 'Notifications':
                    //         return snackBarMsg(context, 'Notifications');
                    //         break;
                    //       case 'Payments':
                    //         return snackBarMsg(context, 'Payments');
                    //         break;
                    //       case 'Message':
                    //         return snackBarMsg(context, 'Message');
                    //         break;
                    //       case 'My Orders':
                    //         return snackBarMsg(context, 'My Orders');
                    //         break;
                    //       case 'Setting Account':
                    //         return snackBarMsg(context, 'Setting Account');
                    //         break;
                    //       case 'Call Center':
                    //         return snackBarMsg(context, 'Call Center');
                    //         break;
                    //       case 'About Application':
                    //         return snackBarMsg(context, 'About Application');
                    //         break;
                    //       default:
                    //         return snackBarMsg(context, 'Notifications');
                    //         break;
                    //     }
                    //   },
                    // ),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }

  snackBarMsg(BuildContext context, String msg) {
    var sb = SnackBar(
      elevation: kRadius,
      content: Text(msg),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        // textColor: kWhiteColor,
        label: 'OK',
        onPressed: () {},
      ),
    );
    scaffoldKey.currentState.showSnackBar(sb);
  }
}
