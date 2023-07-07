import 'package:flutter/material.dart';
import '../product_details.dart';

LayoutBuilder gridViewProducts(products, context) {
  int getColumnCount(BoxConstraints constraints) {
    double screenWidth = constraints.maxWidth;
    int columnCount = (screenWidth / 200).floor();
    return columnCount > 2 ? columnCount : 1;
  }

  double getAspectRatio(BoxConstraints constraints) {
    double screenWidth = constraints.maxWidth;
    double aspectRatio;

    if (screenWidth <= 100) {
      return aspectRatio = 0.9;
    } else if (screenWidth <= 200) {
      return aspectRatio = 0.8;
    } else if (screenWidth <= 300) {
      return aspectRatio = 0.7;
    } else if (screenWidth <= 400) {
      return aspectRatio = 0.6;
    } else if (screenWidth <= 500) {
      return aspectRatio = 0.5;
    } else if (screenWidth <= 600) {
      return aspectRatio = 0.4;
    } else  {
      return aspectRatio = 0.3;
    }
  }

  return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: getAspectRatio(constraints),
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (BuildContext context, int index) {
        final color = products[index].color;
        final colorValue = _getColorFromName(color);
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  product: products[index],
                ),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                        child: Image.network(
                          products[index].image,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            products[index].size,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: colorValue,
                              // Colors.products[index].color
                              //     .toString()
                              //     .toLowerCase()
                              //     .toColor,
                              // style: TextStyle(
                              //   fontSize: 16,
                              //   color: Colors.grey[600],
                              // ),
                              radius: 12,
                            ),
                            Text(" ${products[index].color} "),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$${products[index].price.toStringAsFixed(2).toString()}",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: DefaultSelectionStyle.of(context).cursorColor,
                    ),
                  ),
                  // const SizedBox(height: 10.0),
                  // Center(
                  //   child: ElevatedButton(
                  //       onPressed: () {
                  //         // context.read<ProductsBloc>().add(GetCategoryNameEvent(index));
                  //         // context.read<ProductsBloc>().id = categories.id;
                  //         handleViewProduct(context, products[index]);
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 50, vertical: 10),
                  //       ),
                  //       child: const Text(
                  //         'SELECT',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       )),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  });
}

Color _getColorFromName(String colorName) {
  switch (colorName.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;
    case 'pink':
      return Colors.pink;
    case 'grey':
      return Colors.grey;
    case 'white':
      return Colors.white;
    case 'black':
      return Colors.black;
    // Add more cases for other colors as needed
    default:
      return Colors.black;
  }
}
