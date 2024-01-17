import 'package:academy_app/screens/course_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../constants.dart';
import '../widgets/star_display_widget.dart';
// import '../screens/course_detail_screen.dart';

class CourseListItem extends StatefulWidget {
  final int? id;
  final String? title;
  final String? thumbnail;
  final int? rating;
  final String? price;
  final String? instructor;
  final int? noOfRating;
  final String? product_id;

  const CourseListItem({
    Key? key,
    @required this.id,
    @required this.title,
    @required this.thumbnail,
    @required this.rating,
    @required this.price,
    @required this.instructor,
    @required this.noOfRating,
    @required this.product_id,
    
  }) : super(key: key);

  @override
  State<CourseListItem> createState() => _CourseListItemState();
}

class _CourseListItemState extends State<CourseListItem> {
    var price = '';
  @override
  void initState() {
    fetchPrice();
    super.initState();
  }

  fetchPrice() async {
    final products = await Purchases.getProducts(
      [widget.product_id!],
      productCategory: ProductCategory.nonSubscription,
      type: PurchaseType.inapp,
    );
    price = products.first.priceString;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(CourseDetailScreen.routeName, arguments: widget.id);
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading_animated.gif',
                    image: widget.thumbnail.toString(),
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      widget.title.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: kTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.instructor.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 80,
                          child: StarDisplayWidget(
                            value: widget.rating!,
                            filledStar: const Icon(
                              Icons.star,
                              color: kStarColor,
                              size: 15,
                            ),
                            unfilledStar: const Icon(
                              Icons.star_border,
                              color: kStarColor,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Text(
                            '( ${widget.rating}.0 )',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                          child: Text(
                            '( ${widget.noOfRating} )',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            price,
                            style: const TextStyle(
                              color: kTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
