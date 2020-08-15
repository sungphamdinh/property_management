import 'package:flutter/material.dart';
import 'package:property_management/widgets/space_item.dart';
import 'package:provider/provider.dart';

import '../providers/spaces.dart';
import '../screens/add_space_screen.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/search_text_box.dart';

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

  void _onSearchTerm(value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Consumer<Spaces>(
              builder: (ctx, spacesProvider, child) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.builder(
                        itemCount: spacesProvider.spaces.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8),
                        itemBuilder: (ctx, index) {
                          final space = spacesProvider.spaces[index];
                          return SpaceItem(
                              id: space.id,
                              title: space.postTitle,
                              address: space.address.readableAddress,
                              price: space.price,
                              featureImageUrl: space.imageUrls[0]);
                        }));
              },
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
