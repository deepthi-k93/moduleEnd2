import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:input_quantity/input_quantity.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:module2_end_assignment/custom_app_bar.dart';
import 'package:module2_end_assignment/models/cart_product_model.dart';
import 'package:module2_end_assignment/models/product_model.dart';
import 'package:module2_end_assignment/providers/cart_provider.dart';
import 'package:module2_end_assignment/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductScreenState();
}

double count = 0;

class _ProductScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = context.watch<ProductsProvider>();
    ProductModel? product = productsProvider.productDetails;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              product?.name ?? "Product Name",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontFamily: "TenorSans",
              ),
            ),
            Image.asset(product?.image ?? "", fit: BoxFit.cover),
            Text(
              product?.description ?? "",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontFamily: "TenorSans",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InputQty(
                  decoration: QtyDecorationProps(width: 20),
                  // ignore: deprecated_member_use
                  maxVal: double.maxFinite, //max val to go
                  initVal: 0, //min starting val
                  onQtyChanged: (val) {
                    //on value changed we may set the value
                    count = val;
                    setState(() {});
                    //setstate could be called
                  },
                ),
                // ElevatedButton(onPressed: (){}, child: Icon(Icons.minimize)),
                // Text("   0   ",key: Key("count"),style: TextStyle(fontSize: 40,),),
                // ElevatedButton(onPressed: (){}, child: Icon(Icons.add)),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    var data = "";
                    if (count > 0) {
                      CartProductModel prod = CartProductModel(
                        id: product?.id,
                        name: product?.name,
                        image: product?.image,
                        description: product?.description,
                        price: product?.price,
                        count: count,
                      );
                      context.read<CartProvider>().addToCartItems(prod);
                      data = "Added";
                    } else {
                      data = "Set count";
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          data,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.h,
                      fontStyle: FontStyle.normal,
                    ),
                    minimumSize: Size(180.w, 45.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),

                  //  ButtonStyle(backgroundColor: ,
                  // Set fixed size: width = 200, height = 60
                  // fixedSize: WidgetStateProperty.all(Size(180, 60)),
                  // side: WidgetStateProperty.all(
                  // BorderSide(color: Colors.blue),
                  // ), // Outline color
                  // ),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 15),
                      Text("Add to cart"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
