import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:livescore/resources/app_colors.dart';
import 'package:livescore/resources/app_dimens.dart';
import 'package:livescore/resources/app_font.dart';
import 'package:livescore/resources/sample_data.dart';

import '../../generated/assets.dart';

class DiscoveryView extends StatefulWidget {
  const DiscoveryView({super.key});

  @override
  State<DiscoveryView> createState() => _DiscoveryViewState();
}

class _DiscoveryViewState extends State<DiscoveryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(AppDimens.lPadding50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
              child: const CustomSearchFeild(),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Image.asset(
                      news[index].mgUrl,
                      fit: BoxFit.cover,
                    ),
                    title: LivescoreText(
                      text: news[index].headline,
                      overflow: TextOverflow.clip,
                      fontSize: AppDimens.lTextFieldFont,
                    ),
                    subtitle: LivescoreText(
                      text: news[index].date,
                      fontSize: AppDimens.lTextFieldFont1,
                      color: AppColors.lGrey10,
                    ),
                    trailing: Image.asset(
                      Assets.iconsBookmark,
                      height: 24.h,
                    ),
                  ),
                );
              }),
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 5.h,
                color: AppColors.lSecondaryColor,
              ),
              itemCount: news.length,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchFeild extends StatelessWidget {
  const CustomSearchFeild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: AppDimens.lPadding20.w,
              vertical: AppDimens.lPadding10.h),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.caption?.copyWith(
                color: AppColors.lGrey10,
              ),
          filled: true,
          fillColor: AppColors.lSecondaryColor,
          // prefix: Image.asset('name'),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppDimens.lAppBorderRadius))),
    );
  }
}
