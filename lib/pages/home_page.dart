import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_page.dart';
import 'package:weather/providers/weather_provider.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});

    WeatherModel? weather ;
  @override
  Widget build(BuildContext context) {

       weather = Provider.of<WeatherProvider>(context).weatherData ;
    return  Scaffold(

      appBar: AppBar(
         title: const Text('Weather'),
          actions:[
         IconButton(
           icon: const Icon(
           Icons.search,
         color: Colors.white,
          ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){

             return SarchePage() ;
        }) );
        // do something
      },
    )
  ],
      ),
          
         body: weather == null ?
          Center(
           child: Column(
             mainAxisSize: MainAxisSize.min,
             
            children: const [
             Text(' there is no weather 🙂 start ' ,
             style: TextStyle(
              fontSize: 30 ,
              color: Colors.black,
             ),
             ),
             Text('Searching now 🔍' ,
             style: TextStyle(
              fontSize: 30 ,
              color: Colors.black,
             ),
             )
         
            
           ]),
         ) : Container(
              color:const Color.fromARGB(255, 255, 189, 90) ,
             child: Center(
               child: Padding(
                padding:const EdgeInsets.only(top: 140),
                 child: Column(


                  children: [
                  Text(
                    Provider.of<WeatherProvider >(context).cityName! ,
                   textAlign: TextAlign.center,
                   style:const TextStyle(
                    fontSize: 30 , 
                    fontWeight: FontWeight.bold
                    
                     ) , 
                  
                  ),
               
                  Padding(
                    padding:const EdgeInsets.only(top: 10),
                    child: Text(weather!.date,
                     textAlign: TextAlign.center,
                     
                     style:const TextStyle(
                      fontSize: 20 , 
                      color: Colors.black
                      
                      
                       ) , 
                    
                    ),
                  ),
               
                  Padding(
                    padding:const EdgeInsets.only(top: 80),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Image.asset('images/final-1.png' ,
                          height: 100,
                         width: 100,
                         ),
                  
                      Text(weather!.temp.toInt().toString() ,
                     textAlign: TextAlign.center,
                     
                     style: const TextStyle(
                    fontSize: 30 , 
                    fontWeight: FontWeight.bold
                    
                       ) ) ,
                  
                       Column(
                        
                        children: [
                  
                          Padding(
                            padding: const EdgeInsets.only(bottom:5 ),
                            child: Text('Max Temp : ${weather!.maxTemp.toInt()}')) ,
                            Text('Min Temp : ${weather!.minTemp.toInt()}') ,
                        ],
                       )
                  
                  
                    
                    
                      ],
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: 
                      Text(weather!.weatherStateName ,
                       textAlign: TextAlign.center,
                      style: const TextStyle(
                      fontSize: 30 , 
                      fontWeight: FontWeight.bold)
                      ),
                    )
                   
                 ]),
               ),
               
             ),

               
            



         ),
            

       
    );
  }
}