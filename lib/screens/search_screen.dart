import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homemade_user/models/family.dart';
import 'package:homemade_user/screens/family_details_screen.dart';
import 'package:homemade_user/widgets/meals_item.dart';
import 'package:provider/provider.dart';
import '../providers/families/families.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String item;
  Families provider;
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Families>(context, listen: true);
    List<Family> searchedFamily =
        item != null ? provider.searchedList(item.trim()) : null;

    var mediaQuery = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          leading: Container(),
          title: Container(
            height: mediaQuery.height * 0.06,
            width: double.infinity,
            child: TextField(
              controller: controller,
              onChanged: (value) {
                setState(() {
                  item = value.trim();
                });
                if (item.trim().isEmpty) {
                  item = null;
                }
              },
              textAlign: TextAlign.start,
              // textDirection: TextDirection.rtl,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'البحث',
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
                suffixIcon: Icon(
                  FontAwesomeIcons.search,
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ],
        ),
        body: (item != null && searchedFamily.isNotEmpty)
            ? ListView.builder(
                padding: EdgeInsets.only(
                  top: 2,
                  bottom: 3,
                ),
                itemCount: searchedFamily.length,
                itemBuilder: (ctx, i) => InkWell(
                  splashColor: Color(0xffFCE8E6),
                  onTap: () {
                    print('ss');
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => FamilyDetailsScreen(),
                        settings: RouteSettings(
                          name: 'name',
                          arguments: searchedFamily[i].name,
                        ),
                      ),
                    );
                  },
                  child: MealsItem(
                    shopLogo: searchedFamily[i].imageUrl,
                    title: searchedFamily[i].name,
                    category: searchedFamily[i].category,
                    orderCount: searchedFamily[i].orderCount,
                    directions: searchedFamily[i].distance,
                    rating: searchedFamily[i].rating,
                  ),
                ),
              )
            : Center(
                child: Text(
                  item == null
                      ? 'من فضلك أدخل اسم الأسرة المراد البحث عنها'
                      : searchedFamily.isEmpty
                          ? 'لم يتم العثور على الأسرة المنتجة يرجى التأكد من الاسم'
                          : '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
      ),
    );
  }
}
