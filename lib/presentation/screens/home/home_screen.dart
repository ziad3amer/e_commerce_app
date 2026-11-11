import 'package:e_commerce_app/busnis_logic/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/reposatory/reposatory_product.dart';
import '../../../data/wep_service/product_dio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is ProductError) {
                      return Text(state.error);
                    }
                    if (state is ProductSuccess) {
                      return SizedBox(
                        width: double.infinity,
                        height: 180,
                        child: Image.network(
                          state.products.first.thumbnail,
                          fit: BoxFit.contain,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
