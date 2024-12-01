import 'package:flutter/material.dart';
import 'package:snaft/camera/camera_screen.dart';
import 'package:snaft/const.dart';
import 'package:snaft/ui/favorite/favorite_screen.dart';
import 'package:snaft/ui/home/components/bottom_nav_bar.dart';
import 'package:snaft/ui/home/components/categories.dart';
import 'package:snaft/ui/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> headerImages = [
    {"image": "assets/images/banner/banner_1.png"},
    {"image": "assets/images/banner/banner_2.png"},
    {"image": "assets/images/banner/banner_1.png"},
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _selectedIndex = 0;

  List<Widget> get _widgetOptions{
    return [
      const HomeScreen(),
      const SearchBar(),
      const CameraScreen(),
      const FavoriteScreen(),
      const ProfileScreen()
    ];
  }

  // function untuk aksi tap pada bottom navbar
  void _onItemTapped(int index) {
    // menyatakan bahwa inisial action untuk objek (bottom nav) pada index ke-0
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
      ? Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Hello ShikShakShok,",
                style: mainTitle,
              ),
              const Text(
                'Find, track and eat healthy food.',
                style: subMainTitle,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: defaultPadding,
                        right: defaultPadding,
                        left: defaultPadding,
                      ),
                    ),
                    // PageView with dots indicator
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: SizedBox(
                        height: 200,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemCount: headerImages.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  headerImages[index]['image']!,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        headerImages.length,
                        (index) => _dotsIndicator(index: index),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        right: defaultPadding,
                        left: defaultPadding,
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    const Categories(),
                    const SizedBox(height: defaultPadding),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
      :  _widgetOptions[_selectedIndex], 
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _currentPage == index ? secondaryColor : secondaryColorThin,
      ),
      width: _currentPage == index ? 20 : 14,
      height: 10,
      duration: animationDuration,
    );
  }
}