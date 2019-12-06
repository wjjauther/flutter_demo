import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(new MaterialApp(
    title: "Shopping Cart",
    home: ShoppingList(
      products: <Product>[
        new Product(name: "Eggs"),
        new Product(name: "Flour"),
        new Product(name: "Chocolate chips"),
        new Product(name: "Apple"),
      ],
    )
  ));
}

// Model
class Product{
  const Product({this.name});
  final String name;
}

class ShoppingList extends StatefulWidget{

  List<Product> products = const <Product>[];

  ShoppingList({this.products}) ;

  @override
  State<StatefulWidget> createState() {
    return _ShoppingListState();
  }
}

class _ShoppingListState  extends State<ShoppingList> {

  Set<Product> _shoppingCart  = new Set<Product>();

  void _handleChangedCallBack(Product product, bool inCart){
    setState(() {
      print("执行了回调");
      if(inCart){
        _shoppingCart.add(product);
      }else{
        _shoppingCart.remove(product);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: new ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product){
            return new ShoppingListItem(
              product: product, 
              inCart: false, 
              callBack: _handleChangedCallBack,
              );
        }).toList(),
      ),
    );
  }
  
}

//相当于回调接口
typedef void CartChangeCallBack(Product product, bool inCart);

//相当于android ListView中的 Adapter
class ShoppingListItem extends StatelessWidget{

  final Product product;
  final bool inCart;
  final CartChangeCallBack callBack;

  ShoppingListItem({this.product, this.inCart, this.callBack});

  Color _getColor(BuildContext context){
      return inCart ? Colors.black54: Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
      if(!inCart) return null;
      return TextStyle(
          color: Colors.black54,
          decoration: TextDecoration.none
      );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ()=>{
        this.callBack(product, inCart),
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(this.product.name[0]),
      ),
      title: Text(this.product.name, style: _getTextStyle(context), ),
    );
  }
  
}




