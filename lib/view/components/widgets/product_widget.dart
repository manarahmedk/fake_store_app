import 'package:flutter/material.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/view/components/widgets/text_custom.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final void Function()? onTap;

  const ProductWidget({required this.product, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[100],
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 4,
                child: Image.network(
                  product.image ?? "",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextCustom(
                              text: product.title ?? "",
                              maxLines: 2,
                            ),
                          ),
                          TextCustom(
                            text: product.rating?.rate.toString()??"",
                            color: Colors.grey[600],
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextCustom(text: '${product.price} EGP'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
