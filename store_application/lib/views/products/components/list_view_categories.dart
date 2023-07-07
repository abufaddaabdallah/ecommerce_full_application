import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_application/shared/constant.dart';
import '../../../model/category.dart';

SizedBox listViewCategories(List<Category>? categories) {
  return SizedBox(
    height: 100,
    width: double.infinity,
    child: ListView.separated(
      itemCount: categories!.length,
      separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.categoriesPage,
                arguments: {
                  'categories': categories,
                  'id': categories[index]
                }
                  // categories[index].id
                // MaterialPageRoute(
                //   builder: (context) => CategoryView(
                //      categories[index].id,  categories),
                // ),
              );
            },
            child: Card(
              child: SizedBox(
                height: 70,
                width: 70,
                child: Row(
                  children: [
                    SizedBox(
                      width: 70,
                      child: Column(
                        children: [
                          SvgPicture.network(
                            categories[index].icon,
                            fit: BoxFit.fill,
                            height: 50,
                            width: 50,

                            color:DefaultSelectionStyle.of(context).cursorColor,
                          ),
                          Text(categories[index].name,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    ),
  );
}
