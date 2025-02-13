import 'package:delizia/core/constants/app_colors.dart';
import 'package:delizia/core/constants/app_defaults.dart';
import 'package:delizia/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceAndQuantityRow extends StatefulWidget {
  const PriceAndQuantityRow({
    super.key,
    required this.currentPrice,
    required this.orginalPrice,
    required this.quantity,
  });

  final double currentPrice;
  final double orginalPrice;
  final int quantity;

  @override
  State<PriceAndQuantityRow> createState() => _PriceAndQuantityRowState();
}

class _PriceAndQuantityRowState extends State<PriceAndQuantityRow> {
  int quantity = 1;

  onQuantityIncrease() {
    quantity++;
    setState(() {});
  }

  onQuantityDecrease() {
    if (quantity > 1) {
      quantity--;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /* <---- Price -----> */
        Text(
          'Bs. ${widget.orginalPrice}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
              ),
        ),
        const SizedBox(width: AppDefaults.padding),
        Text(
          'Bs. ${widget.currentPrice}',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
        const Spacer(),

        /* <---- Quantity -----> */
        Row(
          children: [
            IconButton(
              onPressed: onQuantityIncrease,
              icon: SvgPicture.asset(AppIcons.addQuantity),
              constraints: const BoxConstraints(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$quantity',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
            IconButton(
              onPressed: onQuantityDecrease,
              icon: SvgPicture.asset(AppIcons.removeQuantity),
              constraints: const BoxConstraints(),
            ),
          ],
        )
      ],
    );
  }
}
