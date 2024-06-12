import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopply/constants/mycolors.dart';
import 'package:shopply/constants/mydecoration.dart';
import 'package:shopply/constants/myfunctions.dart';
import 'package:shopply/constants/mysizes.dart';
import 'package:shopply/main.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController searchController = TextEditingController();
  bool _isSearching = false;
  String searchText = "";
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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

            //Bottom Nav Bar
            bottomNavigationBar: bottomNavBar(
              items: [
                bottomNavBarItems(icon: Icons.home_outlined, label: 'Home'),
                bottomNavBarItems(
                    icon: Icons.search_outlined, label: 'Explore'),
                bottomNavBarItems(
                    icon: Icons.shopping_cart_outlined, label: 'Cart'),
                bottomNavBarItems(icon: Icons.sell_outlined, label: 'Offer'),
                bottomNavBarItems(icon: Icons.person_outline, label: 'Account'),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: MyColors.mainColor,
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

  //Dashboard Drawer
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
              icon: Icons.account_circle_outlined,
              optionName: 'Profile',
            ),

            //Notifications
            drawerItems(
              BuildContext,
              icon: Icons.notifications_outlined,
              optionName: 'Notifications',
            ),

            //Settings
            drawerItems(
              BuildContext,
              icon: Icons.settings_outlined,
              optionName: 'Settings',
            ),

            //Logout
            drawerItems(
              BuildContext,
              icon: Icons.logout_outlined,
              optionName: 'Logout',
            ),
          ],
        ),
      ),
    );
  }

  //Drawer Items
  drawerItems(
    BuildContext, {
    required IconData icon,
    required String optionName,
    Color iconColor = MyColors.mainColor,
  }) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor,
        ),
        title: Text(optionName),
      ),
    );
  }

  // Bottom Nav Bar
  bottomNavBar({
    required List<BottomNavigationBarItem> items,
    required ValueChanged<int> onTap,
    int currentIndex = 0,
    Color selectedItemColor = MyColors.mainColor,
  }) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      selectedItemColor: selectedItemColor,
      onTap: onTap,
      unselectedItemColor: Colors.grey,
    );
  }

// Bottom Nav Bar Items
  bottomNavBarItems({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
