import 'package:sr_edu_care/core/constants/export.dart';

TextField customTextField({
  required TextEditingController controller,
  required String hintText,
  required IconData prefixIcon,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
    ),
  );
}
