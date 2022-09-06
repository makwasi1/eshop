import 'package:eshop/src/about/about.dart';
import 'package:eshop/src/call_center/call_center.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/notifications/notification_list.dart';
import 'package:eshop/src/orders/map.dart';
import 'package:eshop/src/orders/track_map.dart';
import 'package:eshop/src/orders/track_orders.dart';
import 'package:eshop/src/payments/payment_details.dart';
import 'package:eshop/src/settings/settings.dart';
import 'package:eshop/src/vendor/live_video.dart';
import 'package:eshop/src/widgets/message.dart';
import 'package:eshop/src/widgets/video_stream.dart';
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
            clipBehavior: Clip.none, alignment: Alignment.center,
            children: [
              Container(
                height: 150.0,
                color: kPrimaryColor,
                // child: Image(
                //   image: AssetImage(bg),
                //   fit: BoxFit.cover,
                // ),
              ),
              Positioned(
                bottom: -60.0,
                child: Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: kDarkColor,
                      width: kLess,
                    ),
                    image: const DecorationImage(
                      image: AssetImage(profile),
                    ),
                  ),
                ),
              ),
              const Positioned(
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
              padding: const EdgeInsets.only(top: 88.0),
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
                            case 'Profile':
                              return About();
                            case 'Orders':
                              return TrackOrder();
                            case 'Downloadable Products':
                              return PaymentDetails();
                            case 'Wishlist':
                              return About();
                            case 'Compare':
                              return About();
                            case 'Reviews':
                              return About();
                            case 'Live Streaming':
                              return  const LiveStreaming();
                            case 'Live Tracking':
                              return  const SimpleMap();
                              break;
                            case 'Settings':
                              return  Setting();
                              break;
                            default:
                              return null;
                          }
                        }))
                  
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
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        // textColor: kWhiteColor,
        label: 'OK',
        onPressed: () {},
      ),
    );
    scaffoldKey.currentState.showSnackBar(sb);
  }
}
