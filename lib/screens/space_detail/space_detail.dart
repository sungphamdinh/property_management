import 'package:flutter/material.dart';
import 'package:property_management/providers/spaces.dart';
import 'package:property_management/screens/space_detail/widgets/carousel_with_indicator.dart';
import 'package:property_management/shared/widgets/rate_star.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class SpaceDetailScreen extends StatelessWidget {
  static const routeName = "/space-detail";

  @override
  Widget build(BuildContext context) {
    final spaceId = ModalRoute.of(context).settings.arguments;
    final space = Provider.of<Spaces>(context).spaceWithId(spaceId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Place detail"),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(headline4: TextStyle(color: Colors.black)),
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kDefaultMargin,
              ),
              CarouselWithIndicator(imageUrls: space.imageUrls, id: spaceId),
              SizedBox(
                height: kDefaultMargin,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          space.postTitle,
                          style: TextStyle(
                              fontSize: kDefaultLargeFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        RateStar(
                          starNum: 4.8,
                          textSize: kDefaultMediumFontSize,
                        )
                      ],
                    ),
                    SizedBox(
                      height: kDefaultMargin / 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.pin_drop,
                          color: kTextLightColor,
                        ),
                        SizedBox(
                          width: kDefaultMargin / 2,
                        ),
                        Text(
                          space.address.readableAddress,
                          style: TextStyle(fontSize: kDefaultMediumFontSize),
                        )
                      ],
                    ),
                    SizedBox(
                      height: kDefaultMargin,
                    ),
                    Text(
                      "\$${space.price.toInt()}/month",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: kDefaultMediumFontSize),
                    ),
                    SizedBox(
                      height: kDefaultMargin * 2,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
