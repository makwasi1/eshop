import 'package:flutter/material.dart';

class VendorFeedList extends StatelessWidget {
  const VendorFeedList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class VideoDetails extends StatelessWidget {
  const VideoDetails({
    Key key,
    @required this.title,
    @required this.description,
    @required this.vendorName,
    @required this.publishDate,
  }) : super(key: key);

  final String title;
  final String description;
  final String vendorName;
  final String publishDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 2.0, top: 2.0)),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            )),
        const Padding(padding: EdgeInsets.only(top: 20.0)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vendorName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 2.0, top: 2.0)),
            Text(
              publishDate,
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ],
        ))
      ],
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key key,
    @required this.title,
    @required this.description,
    @required this.vendorName,
    @required this.publishDate,
    @required this.video,
  }) : super(key: key);

  final Widget video;
  final String title;
  final String description;
  final String vendorName;
  final String publishDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: video,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
              child: VideoDetails(
                  title: title,
                  description: description,
                  vendorName: vendorName,
                  publishDate: publishDate),
            ))
          ],
        ),
      ),
    );
  }
}
