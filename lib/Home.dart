import 'package:flutter/material.dart';
import 'FoodDetails.dart';
import 'Models/FetchCategories.dart';
import 'Models/categories.dart';
import 'Models/fetchFoods.dart';
import 'Models/foods.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> address=["Filters","Hygenic","Live Tracking","Contact","Fast Foods"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            child: Expanded(
              child: Column(
                children: [
                   buildFirstRow(Icons.menu,Colors.red),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(text:const TextSpan(children: [
                      TextSpan(text: 'Food\n',style: TextStyle(fontSize: 17,color: Colors.grey)),
                      TextSpan(text: 'At Your DoorStep',style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold)),
                    ] )),
                  ),
                  const SizedBox(height: 8),
                  buildFutureBuilderCategory(),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: address.length,
                        itemBuilder: (ctx,index){
                          return Container(
                            margin:const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            width: 100,
                            height: 40,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11)
                              ),
                              child:Center(child: Text(address[index],textAlign: TextAlign.center,style:const TextStyle(color: Colors.grey),)),
                            ),
                          );
                        }),
                  ),
                 buildAlignText('Popular'),
                  buildFutureBuilderFood(),
              ],
              ),
            ),
          ),
      ),
    );
  }

  Align buildAlignText(String text) {
    return  Align(
                  alignment: Alignment.centerLeft,
                  child: Text(text,style: const TextStyle(fontSize: 25),),);
  }

  Row buildFirstRow(IconData icon,Color col) {
    return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Icon(icon),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: col,
                      )
                    ],
                  );
  }

  FutureBuilder<List<Foods>> buildFutureBuilderFood() {
    return FutureBuilder<List<Foods>>(
                  future: fetchFoods(),
                  builder:(ctx,snapShot){
                    if(snapShot.connectionState==ConnectionState.waiting){
                      return const CircularProgressIndicator();
                    }else{
                      return SizedBox(
                          height: 300,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount:snapShot.data!.length ,
                              itemBuilder: (ctx,index){
                                return  GestureDetector(
                                  onTap: (){
                                     Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx)=>FoodDetails(id: snapShot.data![index].id!,)));
                                  },
                                  child: SizedBox(
                                    //width: 130,
                                    height: 135,
                                    child: Card(
                                      elevation: 6,
                                      margin:const EdgeInsets.all(4),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(11),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(12,8,12,8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(snapShot.data![index].title!,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                                                const SizedBox(height: 2),
                                                Text(snapShot.data![index].type!,style:const TextStyle(fontSize: 12,color: Colors.grey),),
                                                const SizedBox(height: 2),
                                                Row(
                                                  children:const [
                                                    Icon(Icons.star),
                                                    Icon(Icons.star),
                                                    Icon(Icons.star),
                                                    Icon(Icons.star),
                                                    Icon(Icons.star),
                                                  ],
                                                ),
                                                const SizedBox(height: 2),
                                                Container(
                                                  width: 70,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(width: 1,color: Colors.grey),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children:const [
                                                      Text('ADD',style: TextStyle(fontSize: 10),),
                                                      Icon(Icons.add,color: Colors.orangeAccent,size: 20,)
                                                    ],),
                                                ),
                                                // OutlinedButton(onPressed: (){}, child: Row(children: [Text('ADD'),SizedBox(width: 4,),Icon(Icons.add)],))
                                              ],
                                            ),
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: NetworkImage(snapShot.data![index].image!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                      );
                    }

                  } ,);
  }

  FutureBuilder<List<Categories>> buildFutureBuilderCategory() {
    return FutureBuilder<List<Categories>>(
                  future: fetchCategories(),
                    builder: (ctx,snapShot){
                    if(snapShot.connectionState==ConnectionState.waiting){
                     return const CircularProgressIndicator();
                    }else{
                      return SizedBox(
                        width: double.infinity,
                        height: 105,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapShot.data!.length,
                            itemBuilder: (ctx,index){
                              return Container(
                                margin:const EdgeInsets.fromLTRB(0, 15, 10, 10),
                                width: 120,
                                height: 105,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11)
                                  ),
                                  color: Colors.grey,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:const Alignment(0,-2),
                                        child: SizedBox(
                                          width: 70,
                                          height: 40,
                                          child: Image.network(snapShot.data![index].image!,fit: BoxFit.contain,),
                                        ),
                                      ),
                                      Align(
                                          alignment:const Alignment(0,.55) ,
                                          child: Text(snapShot.data![index].title!)),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                    }
                );
  }
}