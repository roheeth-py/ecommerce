import 'package:ecommerce/config/assets/app_images.dart';
import 'package:ecommerce/config/theme/app_colors.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce/config/assets/app_vectors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeCubit sl = GetIt.instance<HomeCubit>();
  final items = ["add"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage(AppImages.profile),
        ),
        leadingWidth: 40.w,
        title: GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: 40.h,
            width: 85.w,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.sp)),
            child: DropdownButton(
              value: items.first,
              items: items.map(
                (e) {
                  return DropdownMenuItem(child: Text(e));
                },
              ).toList(),
              onChanged: (value) {},
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColors.secondBackground, shape: BoxShape.circle),
            child: SvgPicture.asset(AppVectors.bag),
          ),
        ],
      ),
    );
  }
}

// BlocBuilder<HomeCubit, HomeState>(
// bloc: sl..getData(),
// builder: (context, state) {
// if (state is HomeSuccess) {
// return Text("${state.productModel.first.name}");
// } else if (state is HomeInitial) {
// return const Center(
// child: CircularProgressIndicator(),
// );
// } else {
// return const Text("data");
// }
// },
// ),
