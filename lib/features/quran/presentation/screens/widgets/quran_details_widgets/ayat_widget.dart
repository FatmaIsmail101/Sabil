import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/states/states.dart';
import '../../../../../../core/assets/app_assets.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../view_model/quran_state.dart';
import '../../../view_model/quran_view_model.dart';

class AyatWidget extends StatelessWidget {
  AyatWidget({
    super.key,
    required this.index,
    required this.state,
    required this.suraNumber,
  });

  int index;
  final int suraNumber; // لازم نبعت رقم السورة من برا
  final QuranState state;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuranViewModel>();
    final isSelected = viewModel.selectedAyahIndex == index;

    return InkWell(
      hoverColor: AppColors.primaryColor,
      onTap: () {
        viewModel.selectAyah(index);
        viewModel.getTafseer(
          tafseerId: 2, // التفسير الميسر
          suraNumber: suraNumber,
          ayahNumber: index + 1,
        );
        // نغير الحالة في الـ ViewModel
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.secondaryColor, // لون خلفية شيك
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          builder: (modalContext) => ChangeNotifierProvider.value(
            value: viewModel,
            child: _buildTafseerSheet(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        alignment: .center,
        // height: 20.h,  <-- ممنوع تحديد ارتفاع ثابت هنا
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primaryColor, width: 1),
        ),
        child: Row(
          textDirection: .ltr,
          spacing: 10.w,

          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: .center,
              children: [
                Image.asset(AppAssets.quranSuraListIcon),
                Text(
                  textDirection: .rtl,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  "${index + 1}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.selectedWhiteColor,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                state.quranDetails![index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected
                      ? AppColors.secondaryColor
                      : AppColors.primaryColor,
                  fontSize: 18.sp,
                  height: 1.5, // لترك مسافة بين الأسطر
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ودجت منفصلة لعرض التفسير عشان نراقب الـ Loading والـ Success
  Widget _buildTafseerSheet() {
    return Consumer<QuranViewModel>(
      builder: (context, vm, child) {
        if (vm.state.tafserState == RequestState.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (vm.state.tafserState == RequestState.error) {
          return Center(
            child: Text(
              vm.state.tafeerErrorMessage ?? "Error",
              style: TextStyle(color: AppColors.primaryColor),
            ),
          );
        }

        final tafseerText = vm.state.tafseer?.first.text ?? "لا يوجد تفسير";
        return Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Text(
              tafseerText,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 18.sp, color: AppColors.primaryColor),
            ),
          ),
        );
      },
    );
  }
}
