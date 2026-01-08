import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:module2_end_assignment/custom_app_bar.dart';
import 'package:module2_end_assignment/product_detail_screen.dart';
import 'package:module2_end_assignment/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

var logger = Logger();

class _WishlistScreenState extends State<WishlistScreen> {
  List wishlistItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SizedBox(height: 17.h),
            Expanded(
              child: Consumer<WishlistProvider>(
                builder: (context, value, child) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 165.w / 240.h,
                    ),
                    itemBuilder: (context, index) {
                      final product = value.wishlistItems[index];
                      wishlistItems = value.wishlistItems;
                      logger.i(wishlistItems.length.toString());
                      return GestureDetector(
                        onTap: () {
                          context.read<WishlistProvider>().setProductDetails(
                            product,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailScreen();
                              },
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Container(
                              height: 170.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(product.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                onPressed: () {
                                  if (wishlistItems.contains(product.id)) {
                                    wishlistItems.remove(product.id);
                                  } else {
                                    wishlistItems.add(product.id);
                                  }
                                  setState(() {});
                                },
                                icon: Icon(
                                  wishlistItems.contains(product.id)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),

                            SizedBox(height: 8.h),
                            Text(product.name),
                            Text(
                              product.description,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              '₹${product.price}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xffDD8560),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: value.wishlistItems.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      //  Text("Wishlist",style: TextStyle(color: Colors.purple),),
    );
  }
}
