import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/models/order_model.dart';
import 'package:eshop/src/orders/track_map.dart';
import 'package:eshop/src/services/orders_repo.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Orders extends StatefulWidget {
  Orders({Key key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  ScrollController controller = ScrollController();
  List<Order> ordersList = [];
  List<Order> tempList = [];
  bool isLoading = false;
  bool isallowed = false;

  bool isLoadingmore = true;

  @override
  void initState() {
    getOrders();
    startNotification();
    controller.addListener(_scrollListener);
    super.initState();
  }

  startNotification() async {
    bool isallowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isallowed) {
      //no permission of local notification
      AwesomeNotifications().requestPermissionToSendNotifications();
    } else {
      //show notification
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        //simgple notification
        id: 123,
        channelKey: 'basic', //set configuration wuth key "basic"
        title: 'Order Confirmed',
        body: 'Track Order In App Now!!',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: const GeneralAppBar(
          title: 'My Orders',
        ),
        body: SingleChildScrollView(
            controller: controller,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ordersList.isEmpty
                          ? const Center(
                              child: Text("No Orders"),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: ordersList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return (index == ordersList.length &&
                                        isLoadingmore)
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : orderItem(index);
                              },
                            )
                    ]))));
  }

  _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      if (mounted) {
        setState(() {
          isLoadingmore = true;

          getOrders();
        });
      }
    }
  }

  getOrders() async {
    tempList.clear();

    tempList = await OrdersRepository().getAllOrders();
    if (tempList.isNotEmpty) {
      setState(() {
        ordersList.addAll(tempList);
        isLoading = true;
      });
    }
  }

  orderItem(int index) {
    Order model = ordersList[index];
    Color back;

    if ((model.status) == 'pending') {
      back = Colors.orange;
    } else if ((model.status) == 'shipped') {
      back = Colors.green;
    } else if ((model.status) == 'canceled' || model.status == 'returned') {
      back = Colors.red;
    } else if ((model.status) == 'PROCESSED') {
      back = Colors.indigo;
    } else if (model.status == 'WAITING') {
      back = Colors.cyan;
    } else {
      back = Colors.cyan;
    }

    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Order No. ${model.id}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                              color: back,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0))),
                          child: Text(
                            (model.status).toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: Row(
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Icon(Icons.electric_bike, size: 18),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  model.shippingDescription,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // InkWell(
                        //   child: Row(
                        //     children: const [
                        //       Icon(
                        //         Icons.call,
                        //         size: 14,
                        //         color: Colors.green,
                        //       ),
                        //       Text(
                        //         //phone number
                        //         " ",
                        //         style: TextStyle(
                        //             color: Colors.green,
                        //             decoration: TextDecoration.underline),
                        //       ),
                        //     ],
                        //   ),
                        //   onTap: () {},
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.money, size: 18),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(model.paymentTitle,
                                    overflow: TextOverflow.clip,
                                    softWrap: true,
                                    maxLines: 2),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.payment, size: 18),
                              const SizedBox(width: 5),
                              Expanded(
                                //payment method
                                child: Text(model.formatedBaseGrandTotal,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    maxLines: 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: Row(
                      children: [
                        Icon(Icons.date_range, size: 14),
                        Text(
                            " Order on: ${DateFormat("dd-MM-yyyy").format(DateTime.parse((model.createdAt).toString()))}"),
                      ],
                    ),
                  )
                ])),
        onTap: () async {
          await Navigator.push(
            //view order details
            context,
            CupertinoPageRoute(
                // OrderDetail(model: orderList[index])
                builder: (context) =>
                    SimpleMap(orderId: (ordersList[index].id).toString())),
          );
          setState(() {
            // getUserDetail();
          });
        },
      ),
    );
  }
}
