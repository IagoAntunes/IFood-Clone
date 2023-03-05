import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/core/theme/app_typography.dart';

import '../../../models/restaurant.dart';

// ignore: must_be_immutable
class RestaurantItemComponent extends StatefulWidget {
  RestaurantItemComponent({
    super.key,
    required this.restaurant,
  });
  Restaurant restaurant;

  @override
  State<RestaurantItemComponent> createState() =>
      _RestaurantItemComponentState();
}

class _RestaurantItemComponentState extends State<RestaurantItemComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.restaurant.photoUrl,
                ),
                radius: 30,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.restaurant.name,
                    style: AppTypography.restaurantTitle(context),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const AppIcon(
                        icon: AppIcons.star,
                        size: Size(8, 8),
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.restaurant.rate.toString(),
                        style:
                            AppTypography.restaurantDetails(context).copyWith(
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const _Dot(),
                      const SizedBox(width: 4),
                      Text(
                        widget.restaurant.category,
                        style: AppTypography.restaurantDetails(context),
                      ),
                      const _Dot(),
                      const SizedBox(width: 4),
                      Text(
                        widget.restaurant.distance,
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.restaurant.time[0].toString(),
                        style: AppTypography.restaurantDetails(context),
                      ),
                      Text(
                        '-',
                        style: AppTypography.restaurantDetails(context),
                      ),
                      Text(
                        widget.restaurant.time[1].toString(),
                        style: AppTypography.restaurantDetails(context),
                      ),
                      const _Dot(),
                      Text(
                        widget.restaurant.deliveryTax,
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.restaurant = widget.restaurant
                    .copyWith(favorite: !widget.restaurant.favorite);
              });
            },
            child: AppIcon(
              icon:
                  widget.restaurant.favorite ? AppIcons.fav : AppIcons.favLine,
              size: const Size(18, 18),
              color: AppColors.grey7,
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Text(
      'º',
      style: TextStyle(
        fontSize: 8,
        color: AppColors.grey2,
      ),
    );
  }
}

List<Restaurant> restaurants = [
  Restaurant(
    category: 'Japonesa',
    deliveryTax: "R\$ 5,99",
    distance: "4,1 km",
    favorite: false,
    name: "Restaurante Japones",
    photoUrl:
        "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/sushi-bar-restaurant-logo-design-template-a917bf7521aa74b08179cad073df41c1_screen.jpg?ts=1597302425",
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTax: "R\$ 5,99",
    distance: "4,1 km",
    favorite: false,
    name: "Restaurante Japones",
    photoUrl:
        "https://i.pinimg.com/736x/58/ba/8b/58ba8bc8d560d03e5de064a222a52564.jpg",
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTax: "R\$ 5,99",
    distance: "4,1 km",
    favorite: false,
    name: "Restaurante Japones",
    photoUrl:
        "https://image.freepik.com/free-vector/vintage-restaurant-logo_23-2148459010.jpg",
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTax: "R\$ 5,99",
    distance: "4,1 km",
    favorite: false,
    name: "Restaurante Japones",
    photoUrl:
        "https://st2.depositphotos.com/7109552/11377/v/600/depositphotos_113775112-stock-illustration-vintage-restaurant-and-cafe-label.jpg",
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTax: "R\$ 5,99",
    distance: "4,1 km",
    favorite: false,
    name: "Restaurante Japones",
    photoUrl:
        "https://freedesignfile.com/upload/2016/10/Restaurant-logos-creative-design-vector-07.jpg",
    rate: 4.6,
    time: [60, 80],
  ),
  Restaurant(
    category: 'Japonesa',
    deliveryTax: "R\$ 5,99",
    distance: "4,1 km",
    favorite: false,
    name: "Restaurante Japones",
    photoUrl:
        "https://i.pinimg.com/originals/13/ea/97/13ea973cdc14d45e27d8285f2020c6bf.png",
    rate: 4.6,
    time: [60, 80],
  ),
];
