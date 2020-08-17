import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/space_item.dart';
import '../providers/spaces.dart';
import '../screens/add_space_screen.dart';
import '../widgets/drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isFirsTimeOpen = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirsTimeOpen) {
      Provider.of<Spaces>(context).getPlaces();
      _isFirsTimeOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: DrawerMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Consumer<Spaces>(
            builder: (ctx, spacesProvider, child) {
              return Container(
                  height: 330,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: spacesProvider.spaces.length,
                      itemBuilder: (ctx, index) {
                        final space = spacesProvider.spaces[index];
                        return SpaceItem(
                          title: space.postTitle,
                          address: space.address.readableAddress,
                          imageUrl: space.imageUrls[0],
                          price: space.price,
                        );
                      }));
            },
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
