import 'package:flutter/material.dart';
import 'package:restaurant/Models/foods.dart';
import 'Models/fetchMeal.dart';
class FoodDetails extends StatefulWidget {
 int id;
  FoodDetails({Key? key,required this.id}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  List<String> address=["Filters","Hygenic","Live Tracking","Contact","Fast Foods"];
  int counter=0;
  increment(){
    setState(() {
      counter++;
    });
  }
  decrement(){
    setState(() {
      counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                    children: [
                      buildPaddingFirstRow(context,Icons.arrow_back_ios_new_rounded,Colors.red),
                      buildFutureBuilderFoods(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,2,0,8),
                        child:  SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: address.length,
                              itemBuilder: (ctx,index){
                                return Container(
                                  margin:const EdgeInsets.fromLTRB(0, 15, 5, 10),
                                  width: 100,
                                  height: 60,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(11)
                                    ),
                                    child:Center(child: Text(address[index],textAlign: TextAlign.center,style:const TextStyle(color: Colors.grey),)),
                                  ),
                                );
                              }),
                        ),
                      ),
                      const SizedBox(height: 65,),
                    ],
                  ),
              FutureBuilder<Foods>(
                  future: fetchMeal(widget.id),
                  builder: (ctx,snapShot){
                    if(snapShot.connectionState==ConnectionState.waiting){
                      return const CircularProgressIndicator();
                    }
                    return  Container(
                      width: double.infinity,
                      height: 328,
                      decoration:const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40) ,topRight: Radius.circular(40)),
                          color: Colors.white
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Align(
                            alignment:const Alignment(-0.81,-2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Order Number 78812',style: TextStyle(fontSize: 17,color: Colors.grey,),),
                                const SizedBox(height: 4),
                                Text(snapShot.data!.title!,style:const TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 4),
                                Text(snapShot.data!.shop!,style:const TextStyle(fontSize: 12,color: Colors.grey)),
                                const SizedBox(height: 4),
                                const Text('Delivery Time 40 min',style: TextStyle(fontSize: 12,color: Colors.grey)),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0,-1.69),
                            child:CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(snapShot.data!.image!,),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Align(
                              alignment:const Alignment(0,.45),
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration:const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orangeAccent,
                                    ),
                                    child: Center(
                                      child: GestureDetector(onTap: (){increment();},child:const Icon(Icons.add,size: 20,color: Colors.white70,)),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text('$counter'),
                                  const SizedBox(width: 15),
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration:const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orangeAccent,
                                    ),
                                    child: Center(
                                      child: GestureDetector(onTap: (){decrement();},child:const Icon(Icons.remove,size: 20,color: Colors.white70,)),
                                    ),
                                  ),
                                  const SizedBox(width: 210),
                                  const Text('AED70',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18),),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:const EdgeInsets.only(bottom: 15),
                              width: 350,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.orangeAccent
                              ),
                              child:const Center(
                                child: Text('ADD TO CARD',style: TextStyle(fontSize: 20,color: Colors.white54),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
    );
  }

  FutureBuilder<Foods> buildFutureBuilderFoods() {
    return FutureBuilder<Foods>(
                      future:fetchMeal(widget.id),
                        builder:(ctx,snapShot){
                          if(snapShot.connectionState==ConnectionState.waiting){
                            return const CircularProgressIndicator();
                          }
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(15,8,0,0),
                          child: Align(
                          alignment: Alignment.centerLeft,
                          child:  RichText(
                          text: TextSpan(
                          children:[
                            const TextSpan(text: 'Order Details\n',style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.bold),),
                          // TextSpan(text: 'Food'),
                          TextSpan(text:'${snapShot.data!.title!}\n',style:const TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold)),
                          TextSpan(text: snapShot.data!.description!,style:const TextStyle(fontSize: 15,color: Colors.black)),
                          ] ),),
                    ),
  );
                        }
                    );
  }

  Padding buildPaddingFirstRow(BuildContext context,IconData icon,Color col) {
    return Padding(
                      padding: const EdgeInsets.fromLTRB(0,8,8,8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed:(){Navigator.of(context).pop();},icon: Icon(icon)),
                           CircleAvatar(
                            radius: 20,
                            backgroundColor: col,
                          )
                        ],
                      ),
                    );
  }
}
