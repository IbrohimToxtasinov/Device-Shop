// import 'package:device_shop/data/model/category_model.dart';
// import 'package:device_shop/view_model/categories_view_model.dart';
// import 'package:device_shop/view_model/products_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home"),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 200,
//             child: Consumer<CategoriesViewModel>(
//         builder: ((context, categoryViewModel, child) {
//                   List<CategoryModel> categories = categoryViewModel.categories;
//                   return ListView(
//                     children: [
//                       ListTile(
//                         title: Text("All"),
//                         onTap: () {
//                           Provider.of<ProductViewModel>(
//                             context,
//                             listen: false,
//                           ).listenProducts("");
//                         },
//                       ),
//                       ...List.generate(
//                         categories.length,
//                         (index) => ListTile(
//                           subtitle: Image(image: NetworkImage(categories[index].imageUrl), width: 50, height: 50,),
//                           title: Text(categories[index].categoryName),
//                           onTap: () {
//                             Provider.of<ProductViewModel>(
//                               context,
//                               listen: false,
//                             ).listenProducts(categories[index].categoryId);
//                           },
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//             ),
//           )),
//           Expanded(child: Consumer<ProductViewModel>(
//             builder: (context, productViewModel, child) {
//               return ListView(
//                 children:
//                     List.generate(productViewModel.products.length, (index) {
//                   var product = productViewModel.products[index];
//                   return ListTile(
//                     title: Text(product.productName),
//                     subtitle: Image(image: NetworkImage(product.productImages[0]), width: 50, height: 50,),
//                     onTap: () {},
//                   );
//                 }),
//               );
//             },
//           ))
//         ],
//       ),
//     );
//   }
// }

import 'package:device_shop/data/model/category_model.dart';
import 'package:device_shop/screens/home_page/widgets/choose_button.dart';
import 'package:device_shop/screens/home_page/widgets/products_item.dart';
import 'package:device_shop/utils/colors.dart';
import 'package:device_shop/utils/icon.dart';
import 'package:device_shop/utils/styles.dart';
import 'package:device_shop/view_model/categories_view_model.dart';
import 'package:device_shop/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.cE5E5E5,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 55, top: 68, right: 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(MyIcons.menu),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      width: 267,
                      height: 60,
                      decoration: BoxDecoration(
                          color: MyColors.cE5E5E5,
                          borderRadius: BorderRadius.circular(30),
                          border:
                          Border.all(width: 2, color: MyColors.cC9C9C9)),
                      child: Center(
                        child: Row(
                          children: [
                            SvgPicture.asset(MyIcons.search),
                            const SizedBox(width: 15),
                            Text(
                              "Search",
                              style: MyTextStyle.ralewaySemiBold.copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.c868686),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50, top: 55, bottom: 56),
              child: Text(
                "Order online collect in store",
                style: MyTextStyle.ralewayBold.copyWith(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.7,
                    color: MyColors.c000000),
              ),
            ),
            SizedBox(
                height: 35,
                child: Consumer<CategoriesViewModel>(
                  builder: ((context, categoryViewModel, child) {
                    List<CategoryModel> categories =
                        categoryViewModel.categories;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ChooseButton(
                          textname: categories[index].categoryName,
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            Provider.of<ProductViewModel>(
                              context,
                              listen: false,
                            ).listenProducts(categories[index].categoryId);
                          },
                        );
                      },
                    );
                  }),
                )),
            Expanded(child: Consumer<ProductViewModel>(
              builder: (context, productViewModel, child) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: 430,
                    width: double.infinity,
                    child: TabbarCreate(models: productViewModel.products),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
