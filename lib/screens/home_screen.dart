import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/spaces.dart';
import '../screens/add_space_screen.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/space_item.dart';
import '../widgets/search_text_box.dart';

class HomeScreen extends StatelessWidget {
  void _onSearchTerm(value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    final properties = Provider.of<Properties>(context).properties;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: DrawerMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          SearchTextBox(_onSearchTerm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.my_location),
                  label: Text('Near your location')),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list),
                  label: Text('More filters'))
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                  itemCount: properties.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemBuilder: (ctx, index) {
                    final property = properties[index];
                    return SpaceItem(
                        property.id,
                        property.title,
                        property.address,
                        property.price,
                        property.imageUrls[0]);
                  }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddSpaceScreen.routeName);
        },
      ),
    );
  }
}
