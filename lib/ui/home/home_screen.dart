import 'package:flutter/material.dart';
import 'package:snaft/camera/camera_screen.dart';
import 'package:snaft/const.dart';
import 'package:snaft/models/recipes.dart';
import 'package:snaft/ui/favorite/favorite_screen.dart';
import 'package:snaft/ui/home/components/bottom_nav_bar.dart';
import 'package:snaft/ui/home/components/categories.dart';
import 'package:snaft/ui/profile/profile_screen.dart';
import 'package:snaft/ui/search/components/menu_card.dart';
import 'package:snaft/ui/search/search_screen.dart';

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
      const SearchScreen(),
      const CameraScreen(),
      const FavoriteScreen(),
      const ProfileScreen()
    ];
  }

  // function untuk aksi tap pada bottom navbar
  void _onItemTapped(int index) {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: defaultPadding * 3),
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
                      ),
                    ),
                    // PageView with dots indicator
                    SizedBox(
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
                    const SizedBox(height: defaultPadding * 2),
                    const Text(
                      "New Recipes",
                      style: subTitle,
                    ),
                    const SizedBox(height: defaultPadding),
                    SizedBox(
                      height: 240,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Recipes.recipes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final recipe = Recipes.recipes[index];
                          return MenuCard(
                            recipes: recipe, 
                            title: recipe.title, 
                            subtitle: recipe.subtitle, 
                            image: recipe.image
                          );
                        }
                      ),
                    ),
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