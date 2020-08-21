import 'package:flutter/material.dart';
import 'package:property_management/models/space.dart';
import 'package:property_management/screens/space_detail/space_detail.dart';

class SearchResultItems extends StatelessWidget {
  final List<Space> data;
  SearchResultItems({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: this.data.length * 5.0,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          final space = this.data[index];
          return ListTile(
            title: Text(space.postTitle),
            subtitle: Text(space.address.readableAddress),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(SpaceDetailScreen.routeName, arguments: space.id);
            },
          );
        },
        itemCount: this.data.length,
      ),
    );
  }
}
