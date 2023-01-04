// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:conditional_builder/conditional_builder.dart';
import 'package:alhumiri_frist_project/Shared/componens/componens.dart';
import 'package:alhumiri_frist_project/Shared/stylses/steles.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/cubit.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/states.dart';
import 'package:alhumiri_frist_project/model/shope_app/categories_model.dart';
import 'package:alhumiri_frist_project/model/shope_app/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        builder: (context, stat) {
          return ConditionalBuilder(
              condition: ShopCubit.get(context).homeModel != null && ShopCubit.get(context).categoriesModel!=null,
              builder: (context) =>
                  buildprodects(ShopCubit.get(context).homeModel!,ShopCubit.get(context).categoriesModel!,context ),
              fallback: (context) =>
                  Center(child: CircularProgressIndicator()));
        },
        listener: (context, stat) {
          if(stat is ShopSuccessChangeFavoritesState){
           if(!stat.model.status){
             ShowTosast(masseg: stat.model.message, color: Colors.red);
           }

          }
        });
  }

  Widget buildprodects(HomeModel homeModel,CategoriesModel categmodel,context ) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: homeModel.data.banners
                    .map((e) => Image(
                          image: NetworkImage('${e.image}'),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 250,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  // height: 200,
                  // viewportFraction: 1.0,
                  // enlargeCenterPage: false,
                  // initialPage: 0,
                  // enableInfiniteScroll: true,
                  // reverse: false,
                  // autoPlay: true,
                  // autoPlayInterval: Duration(seconds: 3),
                  // autoPlayAnimationDuration: Duration(seconds: 1),
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  // scrollDirection: Axis.horizontal,
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                 Container(
                   height: 100.0,
                   child: ListView.separated(
                     physics: BouncingScrollPhysics(),
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context,index)=>buildCategoriesIteme(categmodel.data.data[index]),
                       separatorBuilder: (context,index)=>SizedBox(width: 10,),
                       itemCount: categmodel.data.data.length),
                 ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    ' Products',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.5,
                children: List.generate(
                  homeModel.data.products.length,
                  (index) => buildGridProduct(homeModel.data.products[index],context),
                ),
              ),
            ),
          ],
        ),
      );
  Widget buildGridProduct(ProductModel model,context) => Container(
        color: Colors.white,

        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage('${model.image}'),
                  width: double.infinity,
                  height: 200,
                ),
                if (model.discount != 0 && true)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    color: Colors.red,
                    child: Text(
                      'dicount',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price.round()}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: defultColor,
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0 && true)
                        Text(
                          '${model.oldPrice.round()}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            height: 1.3,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: ShopCubit.get(context).favorites![model.id]! ? defultColor[500]: Colors.grey[300],
                        child: IconButton(
                          onPressed: () {
                            ShopCubit.get(context).ChingFavorit(model.id);
                            print(model.id);
                          },
                          icon: Icon(
                            Icons.favorite_border_rounded,

                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  Widget buildCategoriesIteme(DataModel dataModel)=> Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image(
        image: NetworkImage(dataModel.image,),
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,
      ),
      Container(
        width: 100.0,
        color: Colors.black.withOpacity(0.8),
        child: Text(
          dataModel.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}
