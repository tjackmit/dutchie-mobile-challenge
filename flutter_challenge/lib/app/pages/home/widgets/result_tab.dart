import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/pages/product/product_models.dart';
import 'package:flutter_challenge/app/pages/product/product_details_page.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// ignore: must_be_immutable
class ResultTab extends StatelessWidget {
  final GraphQLClient client = Get.find();

  ResultTab({Key? key}) : super(key: key);

  String queryString = '''
    query ProductList {
      allProducts {
        id,
        Name,
        strainType,
        Image,
        Prices,
        THCContent,
        CBDContent,
        brandName,
      }
    }
  ''';

  @override
  Widget build(BuildContext context) => Container(
    child: Query(
      options: QueryOptions(
        document: gql(queryString),
      ),
      builder: (QueryResult result, {
        fetchMore,
          refetch}) {
        if (result.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // ignore: always_specify_types
        List dataList = result.data!['allProducts'];
        List<ProductModel> productList = [];

        for(int i = 0; i < dataList.length; i++) {
          // ignore: always_specify_types
          var dataObject = dataList[i];
          ProductModel productModel = ProductModel(
            id: dataObject['id'] ?? '',
            name: dataObject['Name'] ?? '',
            brandName: dataObject['brandName'] ?? '',
            strainType: dataObject['strainType'] ?? '',
            image: dataObject['Image'] ?? '',
            // ignore: always_specify_types
            // prices: [0.0],
            price: dataObject['Prices'][0].toStringAsFixed(2),
            thcContent: dataObject['THCContent'] ?? 0,
            cbdContent: dataObject['CBDContent'] ?? 0,
          );
          productList.add(productModel);
        }

        return Container(
          child: ProductList(productModelList: productList,),
        );
      },
    ),

  );
}

class ProductBox extends StatelessWidget { 

  final int cbdContent;
  final int thcContent;
  final String strainType;
  final String brandName;
  final String name; 
  final String price;  
  final String image;

  ProductBox(
    this.cbdContent,
    this.thcContent,
    this.strainType,
    this.brandName,
    this.name,
    this.price,
    this.image,
  );

  @override
  Widget build(BuildContext context)
    => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(image,
          height: 250,
          width: 250,
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                child: Text(r'$''$price', textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                    ),
                ),
              ),
            ],
          ),
          if (name.isNotEmpty) Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                child:
                Text('$name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          if (brandName.isNotEmpty) Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                child: Text('$brandName',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('$strainType'r' • ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text('THC: $thcContent'r' • ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text('CBD: $cbdContent',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

}

class ProductList extends StatelessWidget {

  final List<ProductModel> productModelList;
  ProductList({Key? key, required this.productModelList}) : super(key: key);

  @override
  Widget build(BuildContext context)
    => MaterialApp(
      home: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          children: List<Widget>.generate(productModelList.length, (int index) {
            ProductModel currentProductModel = productModelList[index];
            return Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    // ignore: always_specify_types
                    MaterialPageRoute(builder: (context) => ProductDetailPage(id: currentProductModel.getId())),
                  );
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: ProductBox(
                    currentProductModel.getCBDContent(),
                    currentProductModel.getTHCContent(),
                    currentProductModel.getStrainType(),
                    currentProductModel.getBrandName(),
                    currentProductModel.getName(),
                    currentProductModel.getPrice(),
                    currentProductModel.getImage())
                  )
              ),
            );
          }
          ),
        ),
      ),
    );
  }
