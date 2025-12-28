import 'package:any_image_view/any_image_view.dart';
import 'package:sr_edu_care/core/constants/app_assets.dart';
import 'package:sr_edu_care/core/constants/export.dart';

Widget customNetworkImage({required String image, double height = 100.0}) {
  return AnyImageView(
    imagePath: image,
    height: height.h,
    width: double.infinity,
    fit: BoxFit.cover,
    borderRadius: BorderRadius.circular(8),
    errorWidget: Center(child: Icon(Icons.error, color: Colors.red)),
  );
}

///for eassy loading
Future<void> eassyLoading() {
  return EasyLoading.show(
    status: "loading....",
    indicator: AnyImageView(
      imagePath: whiteLogo,
      height: 25.h,
      width: 25.w,
      fit: BoxFit.fill,
      shape: BoxShape.circle,
    ),
  );
}
