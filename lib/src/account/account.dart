// import 'package:eshop/src/about/about.dart';
// import 'package:eshop/src/account/favorites_list.dart';
// import 'package:eshop/src/call_center/call_center.dart';
// import 'package:eshop/src/constants.dart';
// import 'package:eshop/src/notifications/notification_list.dart';
// import 'package:eshop/src/orders/map.dart';
// import 'package:eshop/src/orders/track_map.dart';
// import 'package:eshop/src/orders/track_orders.dart';
// import 'package:eshop/src/payments/payment_details.dart';
// import 'package:eshop/src/settings/settings.dart';
// import 'package:eshop/src/vendor/live_video.dart';
// import 'package:eshop/src/widgets/message.dart';
// import 'package:eshop/src/widgets/video_stream.dart';
// import 'package:flutter/material.dart';

// class Account extends StatefulWidget {
//   Account({Key key}) : super(key: key);

//   @override
//   _AccountState createState() => _AccountState();
// }

// class _AccountState extends State<Account> {
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: kWhiteColor,
//       body: Column(
//         children: [
//           Stack(
//             clipBehavior: Clip.none, alignment: Alignment.center,
//             children: [
//               Container(
//                 height: 150.0,
//                 color: kPrimaryColor,
//                 // child: Image(
//                 //   image: AssetImage(bg),
//                 //   fit: BoxFit.cover,
//                 // ),
//               ),
//               Positioned(
//                 bottom: -60.0,
//                 child: Container(
//                   height: 125.0,
//                   width: 125.0,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100.0),
//                     border: Border.all(
//                       color: kDarkColor,
//                       width: kLess,
//                     ),
//                     image: const DecorationImage(
//                       image: AssetImage(profile),
//                     ),
//                   ),
//                 ),
//               ),
//               const Positioned(
//                 bottom: -88.0,
//                 child: Text(
//                   'Username',
//                   style: kDarkTextStyle,
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.only(top: 88.0),
//               itemCount: labels.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                     // dense: true,
//                     leading: Icon(
//                       icons[index],
//                       color: kPrimaryColor,
//                     ),
//                     title: Text(labels[index]),
//                     onTap: () => Navigator.of(context)
//                             .push(MaterialPageRoute(builder: (context) {
//                           switch (labels[index]) {
//                             case 'Profile':
//                               return const ProfilePage1();
//                             case 'Orders':
//                               return TrackOrder();
//                             case 'Downloadable Products':
//                               return PaymentDetails();
//                             case 'Wishlist':
//                               return WishListPage(true);
//                             case 'Live Streaming':
//                               return const LiveStreaming();
//                             case 'Live Tracking':
//                               return  const SimpleMap();
//                               break;
//                             case 'Settings':
//                               return  Setting();
//                               break;
//                             default:
//                               return null;
//                           }
//                         }))
                  
//                     );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   snackBarMsg(BuildContext context, String msg) {
//     var sb = SnackBar(
//       elevation: kRadius,
//       content: Text(msg),
//       duration: const Duration(seconds: 2),
//       action: SnackBarAction(
//         // textColor: kWhiteColor,
//         label: 'OK',
//         onPressed: () {},
//       ),
//     );
//     scaffoldKey.currentState.showSnackBar(sb);
//   }
// }


import 'package:eshop/src/about/about.dart';
import 'package:eshop/src/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eshop/src/orders/track_map.dart';
import 'package:eshop/src/orders/track_orders.dart';
import 'package:eshop/src/services/auth_repo.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/video_stream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../../constants2.dart';
import '../constants.dart';
import '../orders/orders.dart';
import 'favorites_list.dart';

class SettingsPage2 extends StatefulWidget {
  const SettingsPage2({Key key}) : super(key: key);

  @override
  State<SettingsPage2> createState() => _SettingsPage2State();
}

class _SettingsPage2State extends State<SettingsPage2> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(
        title: 'SETTINGS',
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              const _SingleSection(
                title: "General",
                children: [
                  // _CustomListTile(
                  //     title: "Dark Mode",
                  //     icon: Icons.dark_mode_outlined,
                  //     trailing: Switch(
                  //         value: _isDark,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _isDark = value;
                  //           });
                  //         })),
                  _CustomListTile(
                      title: "Notifications",
                      icon: Icons.notifications_none_rounded),
                  _CustomListTile(
                      title: "Security Status",
                      icon: CupertinoIcons.lock_shield),
                ],
              ),
              const Divider(),
               _SingleSection(
                title: "User Profile",
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) =>  const ProfilePage1()), (route) => false);
                    },
                    child: const _CustomListTile(
                        title: "Profile", icon: Icons.person_outline_rounded),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => WishListPage(true)));
                    },
                    child: const _CustomListTile(
                        title: "Wishlist", icon: Icons.message_outlined),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Orders()));
                    },
                    child: const _CustomListTile(
                        title: "Orders", icon: Icons.phone_outlined),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const LiveStreaming())),
                    child: const _CustomListTile(
                        title: "Livestream", icon: Icons.contacts_outlined),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const SimpleMap())),
                    child: const _CustomListTile(
                        title: "Live Tracking", icon: Icons.contacts_outlined),
                  ),
                  
                ],
              ),
              const Divider(),
               _SingleSection(
                children: [
                  GestureDetector(
                    child: const _CustomListTile(
                        title: "Help & Feedback",
                        icon: Icons.help_outline_rounded),
                  ),
                  const _CustomListTile(
                      title: "About", icon: Icons.info_outline_rounded),
                  GestureDetector(
                    onTap: () {
                     setState(() {
                       return signOutDrawer(context);
                     }); 
                    },
                    child: const _CustomListTile(
                        title: "Sign out", icon: Icons.exit_to_app_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget trailing;
  
  const _CustomListTile(
      {Key key, @required this.title, @required this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing,
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key key,
    this.title,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}

void signOutDrawer(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          color: kPrimaryColor,
          height: 150.0,
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Are you sure you want Logout ?',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: kWhiteColor,
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: (){
                        AuthRepository().logout();
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  BottomNavBar(0),
                      ));
                      } 
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: kWhiteColor),
                        primary: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      // color: kPrimaryColor,
                      // highlightedBorderColor: kWhiteColor,
                      // borderSide: BorderSide(color: kWhiteColor),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
