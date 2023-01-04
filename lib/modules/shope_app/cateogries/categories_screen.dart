import 'package:alhumiri_frist_project/layout/shop_app/cubit/cubit.dart';
import 'package:alhumiri_frist_project/layout/shop_app/cubit/states.dart';
import 'package:alhumiri_frist_project/model/shope_app/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ListView.separated(
          itemBuilder: (context, index) => BuildItemCateg(ShopCubit.get(context).categoriesModel!.data.data[index]),
          separatorBuilder: (context, index) => Container(width: double.infinity,
            height: 2,
            color: Colors.grey,),
          itemCount: ShopCubit.get(context).categoriesModel!.data.data.length,
        );
      },
    );
  }

 Widget BuildItemCateg(DataModel dataModel)=>Padding(
   padding: const EdgeInsets.all(20.0),
   child: Row(
     children: [
       Image(
         image: NetworkImage(dataModel.image),
         height: 100.0,
         width: 100.0,
         fit: BoxFit.cover,
       ),
       SizedBox(width: 20,),
       Text(
        dataModel.name,
         textAlign: TextAlign.center,
         maxLines: 2,
         overflow: TextOverflow.ellipsis,
         style: TextStyle(
           fontSize:20 ,
           fontWeight: FontWeight.w500,
           color: Colors.black,
         ),
       ),
       Spacer(),
       IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))

     ],
   ),
 );
}