// import 'package:eshop/src/constants.dart';
// import 'package:eshop/src/signup/components/default_text_field.dart';
// import 'package:flutter/material.dart';

// class CenterTextfields extends StatelessWidget {
//   const CenterTextfields({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: const [
//           DefaultTextField(
//             hintText: 'Fullname',
//             icon: Icons.person,
//             keyboardType: TextInputType.text,
//             obscureText: false,
//           ),
//           SizedBox(height: kDefaultPadding),
//           DefaultTextField(
//             hintText: 'Email address',
//             icon: Icons.mail,
//             keyboardType: TextInputType.emailAddress,
//             obscureText: false,
//           ),
//           SizedBox(height: kDefaultPadding),
//           DefaultTextField(
//             hintText: 'Password',
//             icon: Icons.lock,
//             keyboardType: TextInputType.visiblePassword,
//             obscureText: true,
//           ),
//           SizedBox(height: kDefaultPadding),
//           DefaultTextField(
//             hintText: 'Confirm Password',
//             icon: Icons.lock,
//             keyboardType: TextInputType.visiblePassword,
//             obscureText: true,
//           ),
//         ],
    
//     );
//   }
// }