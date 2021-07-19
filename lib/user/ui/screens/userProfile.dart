import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.amber.shade100])),
            child: Container(
              width: double.infinity,
              height: 275.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.google.com/url?sa=i&url=https%3A%2F%2Ficon-library.com%2Ficon%2Fgeneric-user-icon-24.html&psig=AOvVaw0Kx7Xk8-JOLczx5iJ-51AU&ust=1626793584890000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLjxrsG07_ECFQAAAAAdAAAAABAD"),
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Alice James",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RatingBarIndicator(
                      rating: 2.75,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    )
                  ],
                ),
              ),
            )),
        Container(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Trabajos Previos".toUpperCase(),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
