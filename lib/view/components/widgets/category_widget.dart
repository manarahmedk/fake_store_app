import 'package:flutter/material.dart';
import 'package:store_app/view/components/widgets/text_custom.dart';
import 'package:store_app/view_model/utils/colors.dart';

class CategoryWidget extends StatelessWidget {
  final void Function()? onTap;
  final String category;
  final bool isSelected;
  const CategoryWidget({required this.category ,this.onTap ,required this.isSelected,super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? Colors.orange:Colors.blue[100],
      borderRadius:BorderRadius.circular(12) ,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(isSelected?16:12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: TextCustom(
              text: category,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
