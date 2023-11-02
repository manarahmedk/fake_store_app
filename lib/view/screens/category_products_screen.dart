import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/view/components/widgets/product_widget.dart';
import 'package:store_app/view/components/widgets/text_custom.dart';
import 'package:store_app/view_model/bloc/store/store_cubit.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: StoreCubit.get(context)
        ..getCategoryProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: TextCustom(text: StoreCubit
              .get(context)
              .categories[StoreCubit
              .get(context)
              .selectedCategoryIndex],),
        ),
        body: SafeArea(
          child: BlocConsumer<StoreCubit, StoreState>(
            listener: (context, state) {},
            builder: (context, state) {
              return GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(12),
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
                children: List.generate(
                  StoreCubit.get(context).categoryProducts.length,
                      (index) => ProductWidget(
                        product: StoreCubit.get(context).categoryProducts[index],
                      ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
