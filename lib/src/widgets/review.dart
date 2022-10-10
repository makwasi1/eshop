import 'package:eshop/src/constants.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/default_back_button.dart';
import 'package:eshop/src/widgets/review_ui.dart';
import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';


class ReviewsScreen extends StatefulWidget {
  ReviewsScreen({Key key}) : super(key: key);

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  bool isMore = false;
  List<double> ratings = [0.1, 0.3, 0.5, 0.7, 0.9];

  @override
  Widget build(BuildContext context) {
    var reviewList;
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const DefaultAppBar(
        title: "Reviews",
        child: DefaultBackButton(),
      ),
      body: Column(
        children: [
          Container(
            color: kAccentColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "4.5",
                            style: TextStyle(fontSize: 48.0),
                          ),
                          TextSpan(
                            text: "/5",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: kLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SmoothStarRating(
                    //   starCount: 5,
                    //   rating: 4.5,
                    //   size: 28.0,
                    //   color: Colors.orange,
                    //   borderColor: Colors.orange,
                    // ),
                    SizedBox(height: 16.0),
                    Text(
                      "${reviewList.length} Reviews",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kLightColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 200.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            "${index + 1}",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(width: 4.0),
                          Icon(Icons.star, color: Colors.orange),
                          SizedBox(width: 8.0),
                          // LinearPercentIndicator(
                          //   lineHeight: 6.0,
                          //   // linearStrokeCap: LinearStrokeCap.roundAll,
                          //   width: MediaQuery.of(context).size.width / 2.8,
                          //   animation: true,
                          //   animationDuration: 2500,
                          //   percent: ratings[index],
                          //   progressColor: Colors.orange,
                          // ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
              itemCount: reviewList.length,
              itemBuilder: (context, index) {
                return ReviewUI(
                  image: reviewList[index].image,
                  name: reviewList[index].name,
                  date: reviewList[index].date,
                  comment: reviewList[index].comment,
                  rating: reviewList[index].rating,
                  onPressed: () => print("More Action $index"),
                  onTap: () => setState(() {
                    isMore = !isMore;
                  }),
                  isLess: isMore,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 2.0,
                  color: kAccentColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
