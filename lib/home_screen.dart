import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<int> futureFunction()async
  {
    await Future.delayed(Duration(seconds: 3));
    return 13;
  }
  // Future<DateTime> futureFunction() async {
  //   await Future.delayed(Duration(seconds: 3));
  //
  //   return DateTime.now();
  // }
  // Future<bool> futureFunction() async {
  //   await Future.delayed(Duration(seconds: 3));
  //
  //   return true;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('future builder'),
      ),
     body: Column(
       children: [
         TextButton(onPressed: (){
           futureFunction();
           setState(() {

           });
         }, child: Text('click')),
         FutureBuilder(
           future: futureFunction(),
             builder: (context, snapshot)
         {
           if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
           }
          else if (snapshot.connectionState==ConnectionState.done
               ||snapshot.connectionState==ConnectionState.active){
             if(snapshot.hasError)
               {
                 return Text(snapshot.error.toString());
               }
             else if(snapshot.hasData){
               return Text(snapshot.data.toString());
             }
             else {
               return Text('exception handelling');
             }
           }
          else{
            return Text(snapshot.connectionState.toString());
           }

         }),
       ],
     ),
    );
  }
}
