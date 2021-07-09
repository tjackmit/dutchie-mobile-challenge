import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:flutter_challenge/app/pages/product/product_details_page.dart';
import 'gridlist_demo.dart';


class ResultTab extends StatelessWidget {
  final GraphQLClient client = Get.find();

  ResultTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        // child: Text('Add Product Grid Here!'),
        child: ProductList(),
      );
}

class ProductList extends StatelessWidget {

  Product testProduct = Product('id','name',['options'],'type','strainType','image', ['prices'], ['flavors'], {'effectA':'A','effectB':'B','effectC':'C'},'destription','thcContent','cbdContent');

  // List productList = [];
  // int i = 0;
  // while( i <= 5 ){
  //   productList.add(testProduct);
  //   i++;
  // }

  // print('productList');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }),
        ),
      ),
    );
  }
}


// String getAllProducts() {
//     return """
//       query ProductList {
//         allProducts {
//           id,
//           Name,
//           Options,
//           type,
//           strainType,
//           Image,
//           Prices,
//           flavors,
//           effects,
//           Description,
//           descriptionHtml,
//           THCContent,
//           CBDContent,
//         }
//       }
//     """;
// }

// return Query(
//   options: QueryOptions(
//     document: gql(getAllProducts()), // this is the query string you just created
//     },
//   ),
//   // Just like in apollo refetch() could be used to manually trigger a refetch
//   // while fetchMore() can be used for pagination purpose
//   builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
//     if (result.hasException) {
//         return Text(result.exception.toString());
//     }

//     // if (result.isLoading) {
//     //   return Text('Loading');
//     // }

//     if (result.isLoading) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     // it can be either Map or List
//     List repositories = result.data['viewer']['repositories']['nodes'];

//     return ListView.builder(
//       itemCount: repositories.length,
//       itemBuilder: (context, index) {
//         final repository = repositories[index];

//         return Text(repository['name']);
//     });
//   },
// );