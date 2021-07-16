import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/pages/product/product_models.dart';
import 'package:flutter_challenge/app/theme/app_theme.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class PriceOptionColumn extends StatelessWidget { 

  final List<num> prices;
  final List<String> options;

  PriceOptionColumn(
    this.options,
    this.prices,
  );

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: EdgeInsets.zero,
    physics: ClampingScrollPhysics(),
    shrinkWrap: true,
    itemCount: prices.length,
    itemBuilder: (BuildContext context, int index)
      => Row(
        children: <Widget>[
          Text(r'$'+prices[index].toString(),
            style: TextStyle(
              color: AppTheme.green[65],
              fontSize: 18,
              fontFamily: 'Times',
            ),
          ),
          Text(' '+options[index],
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontFamily: 'Times',
            ),
          ),
        ],
      )
  );
}

class ProductDetailCard extends StatelessWidget {

  final String image;
  final String name;
  final String brandName;
  final String type;
  final List<num> prices;
  final List<String> options;
  final String strainType;
  final String thcContent;
  final String cbdContent;
  final List<String> flavors;

  ProductDetailCard(
    this.flavors,
    this.cbdContent,
    this.thcContent,
    this.strainType,
    this.prices,
    this.options,
    this.type,
    this.brandName,
    this.name,
    this.image,
  );

  String getEmojiforFlavor(String effect) {
    if (effect.toLowerCase() == 'chocolate') {
      return '🍫';
    }
    else {
      return '⚠️';
    }
  }

  @override
  Widget build(BuildContext context)
    => Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(image),
                  SizedBox(height: 10),
                  Text(type,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontFamily: 'Times',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(name,
                    style: TextStyle(
                      color: AppTheme.primaryGreen,
                      fontSize: 18,
                      fontFamily: 'Times',
                    ),
                  ),
                  if (brandName.isNotEmpty) Text(brandName,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Times',
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                    child: PriceOptionColumn(options, prices),
                  ),
                  Row(
                    children: <Widget>[
                      Text('THC: $thcContent'r' • ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: 'Times',
                        ),
                      ),
                      Text('CBD: $cbdContent',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: 'Times',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  if (flavors.isNotEmpty && flavors[0].isNotEmpty) Center(
                    child: Text('List of Flavors:',
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Helvetica',
                      ),
                    ),
                  ),
                  if (flavors.isNotEmpty && flavors[0].isNotEmpty) Center(
                    child:GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.0,
                      ),
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: flavors.length,
                      itemBuilder: (BuildContext context, int index)
                        => Column(
                            children: <Widget>[
                              Text(getEmojiforFlavor(flavors[index]),
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              Text(r' • '+flavors[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Courier',
                                ),
                              ),
                            ],
                        ),
                    ),
                  ),
                  Center(
                    child: Text('👇',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
}

class ProductDetailBody extends StatelessWidget { 

  final Map<String, num> effects;
  final String description;

  ProductDetailBody(
    this.description,
    this.effects,
  );

  String getEmojiforEffect(String effect) {
    if (effect.toLowerCase() == 'calm') {
      return ' 😊 ';
    }
    if (effect.toLowerCase() == 'energetic') {
      return ' 😃 ';
    }
    if (effect.toLowerCase() == 'happy') {
      return '😁';
    }
    if (effect.toLowerCase() == 'relaxed') {
      return '😌';
    }
    if (effect.toLowerCase() == 'pain-relief') {
      return '🤕';
    }
    if (effect.toLowerCase() == 'creative') {
      return '🧐';
    }
    if (effect.toLowerCase() == 'focused') {
      return '🤓';
    }
    if (effect.toLowerCase() == 'inspired') {
      return '🤯';
    }
    else {
      return '⚠️';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> effectsList = effects.keys.toList();
    return  Scaffold(
      body: Column(
      children: <Widget>[
        Center(
          child: Text('☝️',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: 60),
        Text('Product Description',
          style: TextStyle(
            color: AppTheme.primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: 'Times',
          ),
        ),
        Text(description,
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontSize: 12,
            fontFamily: 'Georgia',
          ),
        ),
        Text('Strain effects',
          style: TextStyle(
            color: AppTheme.primaryGreen,
            fontSize: 18,
            fontFamily: 'Times',
          ),
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
          ),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: effectsList.length,
          itemBuilder: (BuildContext context, int index)
            => Column(
              children: <Widget>[
                Text(getEmojiforEffect(effectsList[index]),
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(effectsList[index],
                  style: TextStyle(
                    color:  Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'Georgia',
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(125, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                      ),
                    ]
                  ),
                ),
              ],
            ),
        ),
      ],
    )
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String id;

  ProductDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    String queryString = '''
      query ProductDetails {
        Product(id:$id) {
          id,
          Name,
          Options,
          type,
          strainType,
          Image,
          Prices,
          flavors,
          effects,
          Description,
          THCContent,
          CBDContent,
          brandName,
        }
      }
    ''';

    return Query(
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
        Map dataObject = result.data!['Product'];

        DetailedProductModel detailedProduct = DetailedProductModel(
          id: dataObject['id'] ?? '',
          name: dataObject['Name'] ?? '',
          brandName: dataObject['brandName'] ?? '',
          // ignore: always_specify_types
          options: dataObject['Options'] == null ? [''] : List<String>.from(dataObject['Options'].map((x) => x)),
          type: dataObject['type'] ?? '',
          strainType: dataObject['strainType'] ?? '',
          image: dataObject['Image'] ?? '',
          prices: List<num>.from(dataObject['Prices']),
          // ignore: always_specify_types
          flavors: dataObject['flavors'] == null ? [''] : List<String>.from(dataObject['flavors'].map((x) => x)),
          effects: Map<String, num>.from(dataObject['effects']),
          description: dataObject['Description'] ?? '',
          thcContent: dataObject['THCContent'] == null ? '' : dataObject['THCContent'].toString(),
          cbdContent: dataObject['CBDContent'] == null ? '' : dataObject['CBDContent'].toString(),
        );
        
        return PageView(
          scrollDirection: Axis.vertical,
          controller: controller,
          children: <Widget> [
            ProductDetailCard(
              detailedProduct.getFlavors(),
              detailedProduct.getCBDContent(),
              detailedProduct.getTHCContent(),
              detailedProduct.getStrainType(),
              detailedProduct.getPrices(),
              detailedProduct.getOPtions(),
              detailedProduct.getype(),
              detailedProduct.getBrandName(),
              detailedProduct.getName(),
              detailedProduct.getImage()
            ),
            ProductDetailBody(
              detailedProduct.getDescription(),
              detailedProduct.getEffects(),
            ),
          ],
        );
      },
    );
  }
}
