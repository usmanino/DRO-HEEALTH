import 'package:dro/core/styles.dart';
import 'package:dro/ui/pharmacy/pharmacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    // bottomProvider.currentIndex = 0;
  }

  int pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    List pages = [
      const Center(
        child: Text('Coming Soon'),
      ),
      const Center(
        child: Text('Coming Soon'),
      ),
      const PharmacyScreen(),
      const Center(
        child: Text('Coming Soon'),
      ),
      const Center(
        child: Text('Coming Soon'),
      ),
    ];
    return AnnotatedRegion(
      value: SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.top,
          SystemUiOverlay.bottom,
        ],
      ),
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: SvgPicture.asset(
                  "assets/navbar/home.svg",
                  color: pageIndex == 0 ? kPrimaryColor : kSecondaryColor,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: SvgPicture.asset(
                  "assets/navbar/doctors.svg",
                  color: pageIndex == 1 ? kPrimaryColor : kSecondaryColor,
                ),
              ),
              label: 'Doctors',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: SvgPicture.asset(
                  "assets/navbar/pharmacy.svg",
                  color: pageIndex == 2 ? kPrimaryColor : kSecondaryColor,
                ),
              ),
              label: 'Pharmacy',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: SvgPicture.asset(
                  "assets/navbar/community.svg",
                  color: pageIndex == 3 ? kPrimaryColor : kSecondaryColor,
                ),
              ),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: SvgPicture.asset(
                  "assets/navbar/profile.svg",
                  color: pageIndex == 4 ? kPrimaryColor : kSecondaryColor,
                ),
              ),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          currentIndex: pageIndex,
          unselectedItemColor: kSecondaryColor,
          selectedItemColor: kPrimaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
        ),
      ),
    );
  }
}
