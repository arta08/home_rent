// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_rent/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Jakarta';
  String isSidebarSelected = 'Home';

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: primaryTextStyle,
                  ),
                  Container(
                    child: DropdownButton(
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      value: dropdownValue,
                      icon: Container(
                        margin: EdgeInsets.only(
                          top: 5,
                        ),
                        child: Image.asset(
                          'assets/ic_arrow_down.png',
                          height: 16,
                          width: 16,
                        ),
                      ),
                      elevation: 15,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 25,
                        letterSpacing: 1.5,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Jakarta', 'Bandung', 'Lampung', 'Malang']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/ic_lonceng.png',
                    height: 24,
                    width: 24,
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/ic_reddot.png',
                    height: 8,
                    width: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget searchInput() {
      return Expanded(
        child: Container(
          height: 58,
          margin: EdgeInsets.only(
            right: 8,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorBackgroundInput,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/IC_Search.png',
                  width: 24,
                ),
                SizedBox(
                  width: 11,
                ),
                Expanded(
                  child: TextFormField(
                    style: primaryTextStyle.copyWith(
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      hintStyle: secondaryTextStyle,
                      hintText: 'Search address, or near you ',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget searchAndSettings() {
      return Builder(builder: (context) {
        return Container(
          margin: EdgeInsets.only(
            top: 22,
            right: defaultMargin,
            left: defaultMargin,
          ),
          child: Row(
            children: [
              searchInput(),
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer(); // Membuka drawer
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/IC_Filter.png'),
                ),
              ),
            ],
          ),
        );
      });
    }

    Widget categoriesButton(String isActive, String title) {
      return Container(
        height: 41,
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: isActive == 'active' ? primaryColor : colorBackgroundInput),
        child: Text(
          title,
          style: isActive == 'active'
              ? whiteTextStyle1.copyWith(fontWeight: medium)
              : secondaryTextStyle.copyWith(fontWeight: medium),
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: 18,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              categoriesButton('active', 'House'),
              categoriesButton('nonactive', 'Apartment'),
              categoriesButton('nonactive', 'Hotel'),
              categoriesButton('nonactive', 'Vila'),
              categoriesButton('nonactive', 'Kontrakan'),
            ],
          ),
        ),
      );
    }

    Widget nearFromYou() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: 27,
          right: defaultMargin + 10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Near from you',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Text(
              'See more...',
              style: primaryTextStyle,
            )
          ],
        ),
      );
    }

    Widget cardProduct(String titleProduct, String addressProduct) {
      return Container(
        width: 222,
        height: 272,
        margin: EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/house_1.png'),
            fit: BoxFit.cover,
            opacity: 10,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black, // Gradasi hitam dengan opasitas 0.6
              Colors.transparent, // Gradasi berlanjut ke transparan di sisi kanan
            ],
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: 222,
              height: 272,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent, // Gradasi berlanjut ke transparan di sisi kanan
                    Colors.black.withOpacity(0.7), // Gradasi hitam dengan opasitas 0.6
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                bottom: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleProduct,
                    style: whiteTextStyle1.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    addressProduct,
                    style: whiteTextStyle1.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget nearFromYouList() {
      return Container(
        margin: EdgeInsets.only(
          top: 24,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              cardProduct('Dreamsville House Oslo Sana', 'Jl. Sultan Iskandar Muda Hasibuan'),
              cardProduct('Ascot House', 'Jl. Cilandak Tengah'),
            ],
          ),
        ),
      );
    }

    Widget bestRecomended() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: 27,
          right: defaultMargin + 10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Best for you',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Text(
              'See more...',
              style: primaryTextStyle,
            )
          ],
        ),
      );
    }

    Widget cardProductListing(
      String title,
      String price,
      String period,
      int countBedroom,
      int countBathroom,
    ) {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Row(
          children: [
            Container(
              width: 74,
              height: 70,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/house_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  'Rp. ' + price + ' / ' + period,
                  style: priceTextStyle,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 19),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/IC_Bed.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$countBedroom Bedroom',
                            style: primaryTextStyle,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: defaultMargin),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/IC_Bath.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$countBathroom Bathroom',
                            style: primaryTextStyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bestRecomendedList() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
        ),
        child: Column(
          children: [
            cardProductListing('Orchad House', '2.500.000.000', 'Year', 3, 2),
            cardProductListing('The Hollies House', '2.000.000.000', 'Year', 5, 3),
            cardProductListing('The Hollies House', '2.000.000.000', 'Year', 5, 3),
            cardProductListing('The Hollies House', '2.000.000.000', 'Year', 5, 3),
          ],
        ),
      );
    }

    Widget sidebarSparator() {
      return Container(
        color: colorWhite1,
        margin: EdgeInsets.only(right: 60, top: 15, bottom: 15),
        height: 1,
      );
    }

    Widget sidebarItem(title, icon) {
      return Container(
        margin: EdgeInsets.only(right: 60),
        child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            selectedColor: primaryColor,
            textColor: colorWhite1,
            selectedTileColor: colorWhite1,
            selected: isSidebarSelected == title ? true : false,
            titleTextStyle: sidebarTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            title: Text(title),
            leading: Image.asset(
              icon,
              width: 24,
              height: 24,
              color: isSidebarSelected == title ? primaryColor : colorWhite1,
            ),
            onTap: () {
              setState(() {
                isSidebarSelected = title;
              });
            }),
      );
    }

    return Scaffold(
      // backgroundColor: colorWhite1,
      body: ListView(
        children: [
          header(),
          searchAndSettings(),
          categories(),
          nearFromYou(),
          nearFromYouList(),
          bestRecomended(),
          bestRecomendedList(),
        ],
      ),
      drawer: Drawer(
        backgroundColor: primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader(
            //   child: Text('NavigationDrawer'),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            // ),
            SizedBox(
              height: 130,
            ),
            sidebarItem('Home', 'assets/IC_Home.png'),
            sidebarItem('Profile', 'assets/IC_Profile.png'),
            sidebarItem('Nearby', 'assets/IC_Location.png'),
            sidebarSparator(),
            sidebarItem('Bookmark', 'assets/IC_Bookmark.png'),
            sidebarItem('Notification', 'assets/IC_Notification.png'),
            sidebarItem('Message', 'assets/IC_Message.png'),
            sidebarSparator(),
            sidebarItem('Setting', 'assets/IC_Filter.png'),
          ],
        ),
      ),
    );
  }
}
