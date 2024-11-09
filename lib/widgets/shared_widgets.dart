import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider_controller.dart';
import '../shared/constant.dart';

Widget rowItem({
  required String labelText,
  required int index,
  required BuildContext context,
}) {
  final provider = Provider.of<LoanSummaryProvider>(context);
  return GestureDetector(
    onTap: () {
      provider.changeProductIndex(index);
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            labelText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: provider.productIndex == index ? Colors.black : Colors.grey),
          ),
        ),
        SizedBox(width: 10),
        if (index != items.length - 1)
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 20,
          ),
      ],
    ),
  );
}