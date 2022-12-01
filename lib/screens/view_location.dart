

import 'package:flutter/material.dart';
import '../config/palette.dart';
import 'package:provider/provider.dart';
import '../providers/locationsData.dart';

import '../models/location.dart';

class ViewLocation extends StatelessWidget {

  ViewLocation();

  //final Location location =  HTTPService().getLocation("628fd5cab7dcc66ceba53deb") as Location;
  

  @override
  Widget build(BuildContext context) {
  final ProviderLocations provider = Provider.of<ProviderLocations>(context);

    Location location = provider.currentLocation;


    //print(location.map);
    return Scaffold(
      extendBodyBehindAppBar: true,
     // appBar: AppBar(backgroundColor: Color.fromARGB(0, 27, 57, 106), elevation: 0.0,),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Palette.tecBlue,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(location.images[0], fit: BoxFit.cover,),
              ),
              expandedHeight: (MediaQuery.of(context).size.height * 0.3),
              pinned: true,
          ),
          SliverList(delegate: SliverChildListDelegate(
            [   
              const SizedBox(height: 10.0,),
                Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           //   Text(location.category, style: const TextStyle(color: Palette.tecBlue, fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5.0,),
              Text(location.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
             Text("Horario: " + location.horario, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 77, 77, 77)),),
              const SizedBox(height: 5.0,),  
          ],
          ),
        ),
        
        Container(
          //padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child:Column(
            children: [
              const Icon(Icons.place, color: Palette.tecBlue, size: 28.0,),
              const Text("Estás aquí", style:  TextStyle(color: Palette.tecBlue, fontSize: 18.0, fontWeight: FontWeight.bold),),     
              const SizedBox(height: 10.0,),
              FadeInImage.assetNetwork(
              placeholder: 'assets/images/ImagePlaceholder.jpg',
              image: location.map,
),
            ],
          )

        ),

        Container(
             padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
               const Text("Descripción:", style:  TextStyle(color: Palette.tecBlue, fontSize: 22.0, fontWeight: FontWeight.bold), ),
             Text(location.description + "\n", style: const TextStyle(color: Palette.tecGrey, fontSize: 18.0, fontWeight: FontWeight.normal),),

            //   Text(location.body, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),),
          
              const SizedBox(height: 20.0),
         

            location.name == "Edificio Q" ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                     const Text("Clases:", style:  TextStyle(color: Palette.tecBlue, fontSize: 22.0, fontWeight: FontWeight.bold), ),

              const SizedBox(height: 10.0,),
              const Text("10:00am - 11:00am", style: TextStyle(fontSize: 20.0, color: Palette.tecBlue),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Aula 1 - Programación de Dispositivos Móviles", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 2 - Taller de Base de Datos", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 3 - Redes", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 4 - Programacion Orientada a Objetos", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 5 - Fundamentos de Telecomunicaciones", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                ],
              ),


      const SizedBox(height: 10.0,),
              const Text("11:00am - 12:00pm", style: TextStyle(fontSize: 20.0, color: Palette.tecBlue),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Aula 1 - Fundamentos de Programación", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 2 - Ecuaciones Diferenciales", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 3 - Administración de Redes", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 4 - Lenguajes y Automatas", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 5 - Taller de Sistemas Operativos", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                ],
              )
,

      const SizedBox(height: 10.0,),
              const Text("12:00pm - 01:00pm", style: TextStyle(fontSize: 20.0, color: Palette.tecBlue),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Aula 1 - Programación Web", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 2 - Ingeniería de Software", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 3 - Redes", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 4 - Cálculo Vectorial", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                  Text("Aula 5 - Contabilidad", style: TextStyle(color: Color.fromARGB(255, 93, 93, 95), fontSize: 18.0, fontWeight: FontWeight.normal)),
                ],
              )
              ],
            ) : SizedBox(height: 10,)

            
            ],
          )
        ),
              const SizedBox(height: 20.0),


        
        
              const SizedBox(height: 50.0,)

            ]
          ))
        ],
      )// newMethod(context),
    );
  }


}