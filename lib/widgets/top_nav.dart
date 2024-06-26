import 'package:flutter/material.dart';
import 'package:web_dashboard/constants/style.dart';
import 'package:web_dashboard/helpers/responsiveness.dart';
import 'package:web_dashboard/widgets/custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28,
                  ),
                )
              ],
            )
          : IconButton(
              onPressed: () {
                key.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
      elevation: 0,
      title: Row(
        children: [
          const Visibility(
            child: CustomText(
                color: lightGrey,
                size: 20,
                weight: FontWeight.bold,
                text: 'Dash'),
          ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: dark.withOpacity(0.7),
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: dark.withOpacity(0.7),
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: active,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: light,
                      width: 2,
                    ),
                  ),
                ),
              )
            ],
          ),

          // A line divider
          Container(
            width: 1,
            height: 22,
            color: lightGrey,
          ),

          // Space
          const SizedBox(
            width: 24,
          ),

          // CustomText Widget
          const CustomText(
            text: 'Larry Stahil',
            color: lightGrey,
            size: 16,
            weight: FontWeight.normal,
          ),

          // Space
          const SizedBox(
            width: 16,
          ),

          //
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),

            // Avatar Icon
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: const CircleAvatar(
                backgroundColor: light,
                child: Icon(
                  Icons.person_outline,
                  color: dark,
                ),
              ),
            ),
          )
        ],
      ),
      iconTheme: const IconThemeData(color: dark),
      backgroundColor: Colors.transparent,
    );
