import 'package:flutter/material.dart';
import 'package:uts_feelty/gnavbar.dart';

import 'nutrition2.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  String selectedCategory = 'Easy';
  String selectedFoodDrink = 'Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'Nutrition',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.water_drop, color: Colors.black),
              onPressed: () {
                debugPrint("Water drop icon clicked");
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {
                debugPrint("Notifications icon clicked");
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Date selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: index == 2 ? Colors.deepOrange : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: index == 2 ? Colors.deepOrange : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      (16 + index).toString(),
                      style: TextStyle(
                        color: index == 2 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
            ),
            // Search bar with button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        debugPrint("Search query: $value");
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint("Add button clicked");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Categories below search bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    _buildCategoryFilter('Easy'),
                    _buildCategoryFilter('Meal'),
                    _buildCategoryFilter('Asian'),
                    _buildCategoryFilter('Vegan'),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            // Food and Drink category
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFoodDrinkButton('Food'),
                  _buildFoodDrinkButton('Drink'),
                ],
              ),
            ),
            // List of meals
            _buildMealSection('Breakfast', [
              {
                'name': 'Oat and Pear Porridge',
                'onTap': () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const RecipeDetailApp(),
                      ),
                  );
                },
              },
              {
                'name': 'Tofu Scrambled',
                'onTap': null,
              },
            ]),
            _buildMealSection('Lunch', [
              {'name': 'Curry Rice', 'onTap': null},
              {'name': 'Rice with Spinach', 'onTap': null},
            ]),
            _buildMealSection('Dinner', [
              {'name': 'Special Fried Rice', 'onTap': null},
              {'name': 'Chinese Noodles', 'onTap': null},
            ]),
            _buildMealSection('Snack', [
              {'name': 'Vegan Choco Cookies', 'onTap': null},
              {'name': 'Apple Sponge Cake', 'onTap': null},
            ]),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }

  Widget _buildCategoryFilter(String text) {
    bool isSelected = selectedCategory == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
          debugPrint("Selected category: $selectedCategory");
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.deepOrange : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFoodDrinkButton(String text) {
    bool isSelected = selectedFoodDrink == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFoodDrink = text;
          debugPrint("Selected Food/Drink: $selectedFoodDrink");
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.deepOrange : Colors.grey.shade300,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildMealSection(String title, List<Map<String, dynamic>> meals) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: meals.map((meal) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/oat.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  meal['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: meal['onTap'] as void Function()?,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
