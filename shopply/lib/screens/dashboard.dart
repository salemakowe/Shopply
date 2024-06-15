import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopply/constants/mycolors.dart';
import 'package:shopply/constants/mydecoration.dart';
import 'package:shopply/constants/myfunctions.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/main.dart';
import 'package:shopply/screens/login.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController searchController = TextEditingController();
  bool _isSearching = false;
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    // final node = FocusScope.of(context);
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: PopScope(
        canPop: true,
        child: GestureDetector(
          onTap: () {
            if (_isSearching) {
              _hideSearch();
            }
          },
          child: Scaffold(
            //AppBar
            appBar: AppBar(
              centerTitle: true,
              title: GestureDetector(
                onTap: () {},
                child: _isSearching
                    ? TextFormField(
                        controller: searchController,
                        autofocus: true,
                        decoration: MyDecor().form(
                          context: context,
                          hinttext: "Search...",
                          borderColor: MyColors.mainColor,
                        ),
                      )
                    : Text(
                        "Shopply",
                        style: MyDecor().textstyle(
                          fontcolor: MyColors.mainColor,
                          fontweight: FontWeight.bold,
                          letterspace: 2,
                        ),
                      ),
              ),

              //search and avatar icon
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                      if (!_isSearching) {
                        searchController.clear();
                      }
                    });
                  },
                  icon: Icon(
                    _isSearching ? Icons.close_outlined : Icons.search_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: MyColors.mainColor.withOpacity(.7),
                    child: const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            //Drawer

            drawer: dashboardDrawer(),

            //Body
            body: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                padding: const EdgeInsets.all(0),
                textScaler: TextScaler.linear(textScale),
              ),
              child: Padding(
                padding: internalPadding(context),

                //start your widget from here
                child: Column(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        searchController.clear();
      }
    });
  }

  _hideSearch() {
    setState(() {
      _isSearching = false;
      searchController.clear();
    });
  }

  dashboardDrawer() {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: const DividerThemeData(
          space: 0,
          thickness: 0,
        ),
      ),
      child: Drawer(
        child: ListView(
          padding: internalPadding(context),
          children: [
            //Drawer Header
            DrawerHeader(
              margin: const EdgeInsets.only(bottom: 0),
              child: Text(
                "Shopply",
                style: MyDecor().textstyle(
                  fontcolor: MyColors.mainColor,
                  fontweight: FontWeight.bold,
                  letterspace: 2,
                  fontsize: Sizes.w20,
                ),
              ),
            ),

            SizedBox(),

            //Contents

            //Profile
            drawerItems(
              BuildContext,
              onTap: () {},
              icon: Icons.account_circle_outlined,
              optionName: 'Profile',
            ),

            //Notifications
            drawerItems(
              BuildContext,
              onTap: () {},
              icon: Icons.notifications_outlined,
              optionName: 'Notifications',
            ),

            //Settings
            drawerItems(
              BuildContext,
              onTap: () {},
              icon: Icons.settings_outlined,
              optionName: 'Settings',
            ),

            //Logout
            drawerItems(
              BuildContext,
              onTap: userSignOut,
              icon: Icons.logout_outlined,
              optionName: 'Logout',
            ),
          ],
        ),
      ),
    );
  }

  drawerItems(
    BuildContext, {
    required IconData icon,
    required String optionName,
    required VoidCallback? onTap,
    Color iconColor = MyColors.mainColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor,
        ),
        title: Text(optionName),
      ),
    );
  }

  userSignOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
