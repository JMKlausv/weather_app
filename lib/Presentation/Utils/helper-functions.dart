import 'package:flutter/material.dart';

import '../../Data/Data Providers/colors.dart';

class HelperFunctions {
  static showErrorToast(BuildContext context, String errorMessage,
      TextTheme _textTheme, bool? isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        backgroundColor: isSuccess != null && isSuccess
            ? Colors.green
            : ColorResources.errorText,
        content: Center(
          child: Text(
            errorMessage,
            style: _textTheme.titleSmall?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
