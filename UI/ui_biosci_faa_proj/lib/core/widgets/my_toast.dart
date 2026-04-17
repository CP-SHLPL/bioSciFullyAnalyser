import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class MyToast {
  /// Base method that handles the actual toastification call.
  /// It accepts dynamic variables but enforces common styles.
  static ToastificationItem show({
    required BuildContext context,
    required String title,
    String? description,
    ToastificationType type = ToastificationType.info,
    Widget? icon,
    Duration? customDuration,
  }) {
    return toastification.show(
      context: context,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      description: description != null ? Text(description) : null,
      type: type,
      icon: icon,
      
      // ==========================================
      // COMMON PROPERTIES (Applied to every toast)
      // ==========================================
      style: ToastificationStyle.flatColored, // Always use flat style
      alignment: Alignment.bottomRight, // Always pop up at the bottom
      autoCloseDuration: customDuration ?? const Duration(seconds: 4), 
      showProgressBar: false, // Turn off progress bar globally
      borderRadius: BorderRadius.circular(100.0), // Standardized rounding
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      dragToClose: true,
      pauseOnHover: true,
    );
  }

  // --- Convenience Methods (Optional but highly recommended) ---

  static ToastificationItem success(
    BuildContext context, {
    required String title,
    String? description,
    int durationSeconds = 2,
  }) {
    return show(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.success,
      icon: const Icon(Icons.check_circle_sharp, color: Colors.green),
      customDuration: Duration(seconds: durationSeconds),
    );
  }

  static ToastificationItem error(
    BuildContext context, {
    required String title,
    String? description,
  }) {
    return show(
      context: context,
      title: title,
      description: description,
      type: ToastificationType.error,
      icon: const Icon(Icons.error_outline),
      customDuration: const Duration(seconds: 6), // Give users more time to read errors
    );
  }
}