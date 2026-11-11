import 'package:e_commerce_app/busnis_logic/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/reposatory/reposatory_product.dart';
import '../../../data/wep_service/product_dio.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All";

  IconData getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case "all":
        return Icons.grid_view_rounded;
      case "beauty":
        return Icons.science_outlined;
      case "fragrances":
        return Icons.spa_outlined;
      case "furniture":
        return Icons.weekend_outlined;
      case "groceries":
        return Icons.shopping_cart_outlined;
      default:
        return Icons.category_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) =>
          ProductsCubit(ProductRepository(ProductDio()))..getProducts(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F4F6),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset("assets/image/background.svg"),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "ShopX",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Welcome
                Row(
                  children: [
                    const Text(
                      "Hi, Ziad",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 6),
                    SvgPicture.asset("assets/images/container.svg"),
                  ],
                ),

                const SizedBox(height: 8),

                const Text("What are you looking for?"),

                const SizedBox(height: 16),

                // Products and Categories
                Expanded(
                  child: BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is ProductError) {
                        return Center(child: Text(state.error));
                      }

                      if (state is ProductSuccess) {
                        final products = state.products;

                        final categories = [
                          "All",
                          ...products
                              .map((product) => product.category)
                              .toSet(),
                        ];

                        final filteredProducts = selectedCategory == "All"
                            ? products
                            : products
                                  .where(
                                    (product) =>
                                        product.category == selectedCategory,
                                  )
                                  .toList();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top Product Image
                            SizedBox(
                              width: double.infinity,
                              height: 180,
                              child: Image.network(
                                products.last.thumbnail,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image_not_supported);
                                },
                              ),
                            ),

                            const SizedBox(height: 15),

                            // Categories Title
                            const Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF111827),
                              ),
                            ),

                            const SizedBox(height: 12),

                            // Categories List
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  final category = categories[index];

                                  final isSelected =
                                      selectedCategory == category;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = category;
                                      });
                                    },
                                    child: SizedBox(
                                      width: 75,
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundColor: isSelected
                                                ? const Color(0xFF10B981)
                                                : const Color(0xFFEFF6FF),
                                            child: Icon(
                                              getCategoryIcon(category),
                                              color: isSelected
                                                  ? Colors.white
                                                  : const Color(0xFF64748B),
                                              size: 25,
                                            ),
                                          ),

                                          const SizedBox(height: 8),

                                          Text(
                                            category,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: isSelected
                                                  ? const Color(0xFF10B981)
                                                  : const Color(0xFF64748B),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Popular Products Title
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Popular Products",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory = "All";
                                    });
                                  },
                                  child: const Text(
                                    "See All",
                                    style: TextStyle(color: Color(0xFF10B981)),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            // Filtered Products Grid
                            Expanded(
                              child: GridView.builder(
                                itemCount: filteredProducts.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      childAspectRatio: 0.72,
                                    ),
                                itemBuilder: (context, index) {
                                  final product = filteredProducts[index];

                                  return Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: const Color(0xFFE5E7EB),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Image.network(
                                              product.thumbnail,
                                              fit: BoxFit.contain,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                    return const Icon(
                                                      Icons.image_not_supported,
                                                    );
                                                  },
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        Text(
                                          product.title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                        ),

                                        const SizedBox(height: 6),

                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 17,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              product.rating.toString(),
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 8),

                                        Text(
                                          "\$${product.price}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
