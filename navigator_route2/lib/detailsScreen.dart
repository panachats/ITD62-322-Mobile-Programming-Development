import 'package:flutter/material.dart';
import 'package:navigator_route2/module/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Details();
  }
}

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    var imgUrl = product.image;
    imgUrl ??=
        "https://icon-library.com/images/no-picture-available-icon/no-picture-available-icon-20.jpg";
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Dtails",
            style: TextStyle(color: Colors.black),
          )),
      body: ListView(
        children: [
          SizedBox(height: 10),
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(imgUrl),
          ),
          ListTile(
            title: Text(
              "${product.title}",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "\$ ${product.price}",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            title: Text(
              "Category",
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: Text(
              "${product.category}",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          ListTile(subtitle: Text("${product.description}")),
          ListTile(
            title: Text(
                "Rating : ${product.rating!.rate}/5 of ${product.rating!.count}"),
          ),
          RatingBar.builder(
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) => print(value),
            minRating: 0,
            itemCount: 5,
            allowHalfRating: true,
            direction: Axis.horizontal,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            initialRating: product.rating!.rate ?? 0,
          )
        ],
      ),
    );
  }
}
