import 'package:flutter/material.dart';
import 'package:traveler/shared/style/icon_broken.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 15.0,
          ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 TextButton(
                   onPressed: (){},
                   child: Text(
                     'Recommended',
                     style: TextStyle(
                       color: Colors.black,
                     ),
                   ),
                 ),
                 const SizedBox(
                   width: 15.0,
                 ),
                 TextButton(
                   onPressed: (){},
                   child: Text(
                     'The Nearest',
                     style: TextStyle(
                       color: Colors.black,
                     ),
                   ),
                 ),
               ],
             ),
             InkWell(
               onTap: (){},
               child: Stack(
                 alignment: AlignmentDirectional.bottomStart,
                 children: [
                   Container(
                     height: 250.0,
                    width: 220.0,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://img.freepik.com/premium-photo/lovely-entrance-mortuary-temple-hatshepsut-luxor-egypt_242111-3822.jpg?w=740',
                          ),
                        fit: BoxFit.cover,

                      ),
                      borderRadius: BorderRadiusDirectional.circular(20.0),
                    ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Hatshepsut temple',
                           style: Theme.of(context).textTheme.bodyText2!.copyWith(
                             color: Colors.white,
                             fontSize: 16.0,
                               shadows: const [
                                  Shadow(
                                   // bottomLeft
                                     offset: Offset(-1, -1),
                                     color: Colors.black
                                 ),
                                 Shadow(// bottomRight
                                     offset: Offset(1, -1),
                                     color: Colors.black
                                 ),
                                 Shadow( // topRight
                                     offset: Offset(1, 1),
                                     color: Colors.black
                                 ),
                                 Shadow( // topLeft
                                     offset: Offset(-1, 1),
                                     color: Colors.black
                                 ),
                               ]
                           ),
                         ),
                         Row(
                           children: [
                             const Icon(
                               IconBroken.Location,
                               color: Colors.white,
                               size: 18.0,
                               shadows:  [
                                 Shadow(
                                   // bottomLeft
                                     offset: Offset(-1, -1),
                                     color: Colors.black
                                 ),
                                 Shadow(// bottomRight
                                     offset: Offset(1, -1),
                                     color: Colors.black
                                 ),
                                 Shadow( // topRight
                                     offset: Offset(1, 1),
                                     color: Colors.black
                                 ),
                                 Shadow( // topLeft
                                     offset: Offset(-1, 1),
                                     color: Colors.black
                                 ),
                               ],
                             ),
                             Text(
                               '1600 km',
                               style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                   color: Colors.white,
                                   fontSize: 16.0,
                                   shadows: const [
                                     Shadow(
                                       // bottomLeft
                                         offset: Offset(-1, -1),
                                         color: Colors.black
                                     ),
                                     Shadow(// bottomRight
                                         offset: Offset(1, -1),
                                         color: Colors.black
                                     ),
                                     Shadow( // topRight
                                         offset: Offset(1, 1),
                                         color: Colors.black
                                     ),
                                     Shadow( // topLeft
                                         offset: Offset(-1, 1),
                                         color: Colors.black
                                     ),
                                   ],
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
        ],
      ),
    );
  }
}
