import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:web_dashboard/constants/controllers.dart';
import 'package:web_dashboard/constants/style.dart';
import 'package:web_dashboard/widgets/custom_text.dart';

class HorizonatalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const HorizonatalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap(),
      onHover:(value) {
        value ? 
        menuController.onHover(itemName) : 
        menuController.onHover('not hovering');
      },
      child: Obx(() => Container(
        color: menuController.isHovering(itemName) ?
        lightGrey.withOpacity(.1) : 
        Colors.transparent,
        child: Row(
          children: [
            Visibility(visible: menuController.isHovering(itemName) || menuController.isActive(itemName),
            maintainSize: true, maintainState: true, maintainAnimation: true,
            child: Container(width: 6, height: 40, color: dark,),
            ),
            SizedBox(width: _width/80),

            Padding(padding: EdgeInsets.all(16),
            child: menuController.returnIconFor(itemName),
            ),

            if(!menuController.isActive(itemName))
            Flexible(child: CustomText(text: itemName, color: menuController.isHovering(itemName) ? dark : lightGrey, size: 6, weight: FontWeight.w400,),)
            else
            Flexible(child: CustomText(text: itemName, size: 18, color: dark, weight: FontWeight.bold))
          ],
        ),
      )),
    );
  }
}
