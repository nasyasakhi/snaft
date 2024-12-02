import 'package:flutter/material.dart';
import 'package:snaft/const.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> categories = [
    "All",
    "Vegetables",
    "Fruits",
    "Bakery",
    "Snack",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rekomendasi dan View All
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Recommendation",
              style: subTitle
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "View All",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        // Daftar Kategori
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: 45, // Atur tinggi agar tidak terlalu besar
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => _buildCategoryCard(index),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 2),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadiusSizeMine),
          border: Border.all(
            color: primaryColor,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            categories[index],
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: isSelected ? Colors.white : primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}