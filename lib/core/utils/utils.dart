import 'dart:async';
import 'package:flutter/material.dart';

class Utils {
  // Debounce function for search
  static Timer? _debounceTimer;
  
  static void debounce(VoidCallback callback,
      {Duration duration = const Duration(milliseconds: 300)}) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(duration, callback);
  }

  // Check internet connectivity
  static Future<bool> isConnected() async {
    // Simplified connectivity check - can be enhanced with connectivity_plus package
    return true;
  }

  // Show loading dialog
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
        ),
      ),
    );
  }

  // Hide loading dialog
  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Show error snackbar
  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Show success snackbar
  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Format price
  static String formatPrice(double? price) {
    if (price == null) return "₺0";
    return "₺${price.toStringAsFixed(2)}";
  }

  // Get image placeholder
  static Widget getImagePlaceholder({double? width, double? height}) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade200,
      child: const Center(
        child: Icon(
          Icons.image,
          color: Colors.grey,
        ),
      ),
    );
  }

  // Get error image widget
  static Widget getErrorImageWidget({double? width, double? height}) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade200,
      child: const Center(
        child: Icon(
          Icons.error,
          color: Colors.grey,
        ),
      ),
    );
  }
}
