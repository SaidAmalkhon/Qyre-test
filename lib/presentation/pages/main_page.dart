import 'package:flutter/material.dart';
import 'package:qyre_test/constants/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
      
        child: Column(
          children: [ 
            SizedBox( 
              height: 140,
              child: ListView.builder(  
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3, 
                
                itemBuilder: (BuildContext context, int index) {
                  return Container( 
                    padding: const EdgeInsets.all(16), 
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Apptheme.gray), 
                    child: Column( 
                      children: [ 
                        Text('Complete your profile tooptimize your exposure in job searches.', style: Theme.of(context).textTheme.headline1),  
                        const SizedBox(height: 18),
                        
                                              ],
                    ),
                  ) ;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}