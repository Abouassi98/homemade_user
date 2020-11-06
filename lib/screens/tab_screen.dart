import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homemade_user/screens/home_screen.dart';
import 'package:homemade_user/screens/meals_overview_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
   List<Map<String,Object>> _pages;



  int _pageIndex =0;

  @override
  void initState() {
    _pages= [
      {'page':HomeScreen(),
        'title':'Category'
      },
      {'page':MealsOverviewScreen(),
        'title':'Your Favorites'
      },

    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onTap(int index){
      setState(() {
        _pageIndex = index;
      });
    }

    return Scaffold(
      
    
      
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.listAlt),
            label: 'Category'

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
  label: ''           
          ),

        ],
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _pageIndex,
        onTap: _onTap,

      ),
    );
  }
}

