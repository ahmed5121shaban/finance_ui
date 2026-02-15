import 'package:finance_ui/core/styling/app-assets.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItemsWidget extends StatefulWidget {
  final Color color;
  final String cardName;
  final String balance;
  final String cardNumber;
  final String expiryDate;
  const CardItemsWidget({
    super.key,
    required this.color,
    required this.cardName,
    required this.balance,
    required this.cardNumber,
    required this.expiryDate,
  });

  @override
  State<CardItemsWidget> createState() => _CardItemsWidgetState();
}

class _CardItemsWidgetState extends State<CardItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return _carousalCardContainer(
      widget.color,
      widget.cardName,
      widget.balance,
      widget.cardNumber,
      widget.expiryDate,
    );
  }
}

Container _carousalCardContainer(
  Color color,
  String cardName,
  String balance,
  String cardNumber,
  String expiryDate,
) {
  return Container(
    height: 263.h,
    width: 207.w,
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: _carousalCard(
      cardName: cardName,
      balance: balance,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
    ),
  );
}

Widget _carousalCard({
  required String cardName,
  required String balance,
  required String cardNumber,
  required String expiryDate,
}) {
  return Stack(
    children: [
      Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: 0.h,
          top: 0.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cardName, style: AppStyles.white12w700),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Balance", style: AppStyles.cardBody),
                Text(balance, style: AppStyles.cardTitle),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cardNumber, style: AppStyles.white16w500),
                Text(expiryDate, style: AppStyles.white16w500),
              ],
            ),
          ],
        ),
      ),

      Positioned(
        bottom: 0,
        child: Image.asset(
          AppAssets.layer1,
          fit: BoxFit.fill,
          width: 100.w,
          height: 110.h,
        ),
      ),
      Positioned(
        bottom: 0,
        child: Image.asset(
          AppAssets.layer2,
          fit: BoxFit.fill,
          width: 160.w,
          height: 170.h,
        ),
      ),
    ],
  );
}
