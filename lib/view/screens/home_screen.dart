import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/view/components/widgets/text_custom.dart';
import 'package:store_app/view_model/bloc/store/store_cubit.dart';
import 'package:store_app/view_model/utils/colors.dart';
import '../../view_model/utils/navigation.dart';
import '../components/widgets/category_widget.dart';
import '../components/widgets/product_widget.dart';
import 'category_products_screen.dart';

class HomeScreen extends StatelessWidget {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: StoreCubit.get(context)
        ..getAllCategories()
        ..getAllProducts(),
      child: BlocConsumer<StoreCubit, StoreState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  const TextCustom(
                    text: "Categories",
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 70,
                    child: BlocBuilder<StoreCubit, StoreState>(
                      builder: (context, state) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryWidget(
                              category:
                                  StoreCubit.get(context).categories[index],
                              onTap: () {
                                StoreCubit.get(context).selectCategory(index);
                                Navigation.push(context, CategoryProductsScreen());
                              },
                              isSelected: StoreCubit.get(context).selectedCategoryIndex==index,
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                          itemCount: StoreCubit.get(context).categories.length,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const TextCustom(
                    text: "Products",
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      StoreCubit.get(context).products.length,
                      (index) => ProductWidget(
                        product: StoreCubit.get(context).products[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
