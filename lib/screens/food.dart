import 'package:flutter/material.dart';

import '../components/menu_item_tile.dart';
import '../models/item.dart';

class Food extends StatelessWidget {
  const Food({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

     List<Item> items = [
       Item(name: "Sandwich", desc: "", price: "\$25.00", image: "https://assets3.thrillist.com/v1/image/1202445/414x310/crop;webp=auto;jpeg_quality=60;progressive.jpg"),
       Item(name: "Pizza", desc: "", price: "\$35.00", image: "https://media.timeout.com/images/105704960/750/422/image.jpg"),
       Item(name: "Hamburguesa", desc: "", price: "\$25.00", image: "https://www.simplyrecipes.com/thmb/-ZTbwleU4oL-l3zjeDsA9WyyGrs=/3900x2194/smart/filters:no_upscale()/Simply-Recipes-Jims-Famous-Hamburger-LEAD-04-2d75aae0974b47c8a9c5472450c37f65.jpg"),
       Item(name: "Tacos", desc: "", price: "\$25.00", image: "https://www.comedera.com/wp-content/uploads/2017/08/tacos-al-pastor-receta.jpg"),
       Item(name: "Hot-dogs", desc: "", price: "\$25.00", image: "https://www.wikihow.com/images/0/09/Boil-a-Hot-Dog-Step-13-Version-3.jpg"),
     ];

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: 
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.fastfood, color: Colors.green, size: 54.0,),
                SizedBox(width: 30.0,),
                Text("TuCafé", style: TextStyle(color: Colors.green, fontSize: 54.0, fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 30.0,),
                Text("Categorías", style: TextStyle(color: Color.fromARGB(255, 49, 172, 0), fontSize: 30.0, fontWeight: FontWeight.bold),),
                SizedBox(height: 10.0,),
            
            Row(
              children: [
      
                              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.green,
                    width: MediaQuery.of(context).size.width * .26,
                    height: MediaQuery.of(context).size.height * .18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                
                        Icon(Icons.local_pizza, color: Colors.white, size: 48.0,),
                        Text("Platillos", style: TextStyle(fontSize: 25.0, color: Colors.white),)
                      ],
                    ),
                  
                  ),
                ),
                              SizedBox(width: 10.0,),
    
                              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.green,
                    width: MediaQuery.of(context).size.width * .26,
                    height: MediaQuery.of(context).size.height * .18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                
                        Icon(Icons.local_drink, color: Colors.white, size: 48.0,),
                        Text("Bebidas", style: TextStyle(fontSize: 25.0, color: Colors.white),)
                      ],
                    ),
                  
                  ),
                ),
    
                SizedBox(width: 10.0,),
                
                              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.green,
                    width: MediaQuery.of(context).size.width * .26,
                    height: MediaQuery.of(context).size.height * .18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                
                        Icon(Icons.cookie, color: Colors.white, size: 48.0,),
                        Text("Botanas", style: TextStyle(fontSize: 25.0, color: Colors.white),)
                      ],
                    ),
                  
                  ),
                ),
    
                
                
              ],
            ),


SizedBox(height: 30.0,),
Container(
  height: 420,
  child:   ListView.builder(
  
            
  
                   
  
                   
  
                   itemCount: items.length,
  
                   itemBuilder: (BuildContext context, int index) {
  
                    // Article _article = articles.elementAt(index);
  
            
  
              return ItemTile(item: items[index]);
  
                   },
  
                 ),
),
          


          ],
        ),
      ),
    );
  }
}