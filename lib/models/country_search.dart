import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../screens/register_page_2.dart';


class CountrySearch extends SearchDelegate{

  List<String>ListCountry=['afghanistan',' albania', ' algeria',' andorra',' angola','antigua and barbuda',' argentina',
    'armenia','australia','austria','austrian Empire',' azerbaijan','baden',' bahamas', 'bahrain','bangladesh',' barbados'
    ,'bavaria',' belarus','belgium','belize','benin ', 'bolivia','bosnia and Herzegovina','botswana',' brazil','brunei'
    ,' brunswick and Lüneburg',' bulgaria','burkina Faso ','burma','burundi', 'cabonVerde',' cambodia',' cameroon'
    ,' canada',' cayman Islands','central African Republic',' central American Federation*',' chad',' chile', 'china',' colombia',
    'comoros',' congo Free State','costa Rica', 'cote d’Ivoire ',' croatia','cuba','cyprus','czechia','czechoslovakia'
  ];

  

  @override
  List<Widget>? buildActions(BuildContext context) {
    //Action for TextFromField
    return [
      IconButton(
        onPressed: ()
          {
          query="";
          },
        icon:const Icon(
            Icons.clear
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Icon before Text
    return IconButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return RegisterPage2();
              }));
        },
        icon:const  Icon(
            Icons.arrow_back
        )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Results Search
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when search
     var ListSearch=query.isEmpty?ListCountry:ListCountry.where((element) => element.startsWith(query),).toList();
    return ListView.builder(itemCount:  ListSearch.length,
                   itemBuilder: (context,index)
                   {
                       return Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ListTile(
                              leading:const  Icon(Icons.location_city),
                              title:Text(
                              ListSearch[index],
                                   ),

                                onTap: (){
                                     query=ListSearch[index];
                                     showResults(context);
                                          },

                                    )
                              );
                           }
                         );
  }
}