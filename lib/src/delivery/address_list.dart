import 'package:badges/badges.dart';
import 'package:eshop/src/bloc/address/bloc/address_bloc.dart';
import 'package:eshop/src/cart/cart.dart';
import 'package:eshop/src/constants.dart';
import 'package:eshop/src/delivery/delivery.dart';
import 'package:eshop/src/models/address_model.dart';
import 'package:eshop/src/models/cart_model.dart';
import 'package:eshop/src/services/address_rep.dart';
import 'package:eshop/src/services/cart_repo.dart';
import 'package:eshop/src/signup/components/default_button.dart';
import 'package:eshop/src/widgets/default_app_bar.dart';
import 'package:eshop/src/widgets/header_label.dart';
import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/shipping_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryAddressList extends StatefulWidget {
  const DeliveryAddressList({Key key}) : super(key: key);

  @override
  State<DeliveryAddressList> createState() => _DeliveryAddressListState();
}

class _DeliveryAddressListState extends State<DeliveryAddressList> {
  @override
  void initState() {
    context.read<AddressBloc>().add(AddressStartedEvent());
    getAddresses();
    super.initState();
  }

  getAddresses() async {
    var addresses = await AddressRepository().getAddresses();
    // print(addresses);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: kRadius,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Address',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliveryAddress(),
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          padding: const EdgeInsets.only(left: kDefaultPadding),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CartScreen(), //search page
            ),
          ),
        ),
        title: const Text(
          'ADDRESS',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: kWhiteColor,
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state is AddressLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AddressLoadedState) {
            return ListView(
              children: [
                const HeaderLabel(
                  headerText: 'Where should your ordered items be shipped?',
                ),
                //wrap bloc listner here
                ListView.builder(
                  itemCount: state.addresses.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: ListOfAddresses(
                        address: state.addresses[index],
                      ),
                    );
                  },
                ),

                DefaultButton(
                  btnText: "ADD NEW ADDRESS",
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      // builder: (context) => SignIn(),
                      builder: (context) => const DeliveryAddress(),
                    ),
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              const HeaderLabel(
                headerText: 'Where are your ordered items shipped?',
              ),
              //wrap bloc listner here

              DefaultButton(
                  btnText: "ADD NEW ADDRESS",
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      setState(() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const DeliveryAddress()),
                            (route) => false);
                      });
                    });
                  }),
            ],
          );
        },
      ),
    );
  }
}

class ListOfAddresses extends StatefulWidget {
  const ListOfAddresses({
    Key key,
    @required this.address,
  }) : super(key: key);

  final Address address;

  @override
  State<ListOfAddresses> createState() => _ListOfAddressesState();
}

class _ListOfAddressesState extends State<ListOfAddresses> {
  CartRepository cartRepo = CartRepository();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          cartRepo.saveAddress(
              widget.address.city,
              widget.address.state,
              widget.address.country,
              widget.address.phone,
              widget.address.postcode,
              widget.address.id,
              );
          setState(() {});
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ShippingMethod(),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
          decoration: BoxDecoration(
            color: kWhiteColor,
            border: Border.all(
              width: 0.5,
              color: kLightColor,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              const Icon(Icons.home, size: 64.0, color: kPrimaryColor),
              const SizedBox(width: 32.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Delivery Address",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.address.city,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: kDarkColor.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    widget.address.state,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: kDarkColor.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      widget.address.phone,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: kDarkColor.withOpacity(0.5),
                      ),
                    ),
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

class AddAddress1 extends StatelessWidget {
  const AddAddress1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      iconSize: 35.0,
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const DeliveryAddress(), //search page
        ),
      ),
    );
  }
}
