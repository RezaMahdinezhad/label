import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:label/presentation/artist_screen/artist_screen.dart';
import 'package:label/presentation/profile/profile.dart';
import 'package:label/presentation/statics/statics.dart';
import 'package:label/presentation/upload/upload.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedBottomNavigationItem = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffFF0055),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedBottomNavigationItem,
        onTap: (int index) {
          setState(() {
            _selectedBottomNavigationItem = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Navigationbar/IconHome.svg',
              color: Colors.black,
            ),
            activeIcon: SvgPicture.asset(
              'assets/Navigationbar/IconHome.svg',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Navigationbar/IconStatics.svg'),
            activeIcon: SvgPicture.asset(
              'assets/Navigationbar/IconStatics.svg',
              color: Color(0xffFF0055),
            ),
            label: 'Statics',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Navigationbar/IconUpload.svg'),
            activeIcon: SvgPicture.asset(
              'assets/Navigationbar/IconUpload.svg',
              color: Color(0xffFF0055),
            ),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Navigationbar/IconProfile.svg'),
            activeIcon: SvgPicture.asset(
              'assets/Navigationbar/IconProfile.svg',
              color: Color(0xffFF0055),
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      ArtistScreen(),
      StaticsScreen(),
      UploadScreen(),
      ProfileScreen(),
    ];
  }
}
