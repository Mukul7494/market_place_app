import 'package:appwrite/appwrite.dart';
import 'package:flutter/services.dart';

import 'package:logger/logger.dart';

import '../appwrite.dart';

Future<String> signUp({
  required String email,
  required String password,
  required String name,
  required String userId,
  required String phone,
}) async {
  try {
    try {
      final user = await ApiClient.account.create(
        email: email,
        password: password,
        name: name,
        userId: userId,
      );
      if (user.$id.isNotEmpty) {
        await ApiClient.account.createEmailSession(
          email: email,
          password: password,
        );
        HapticFeedback.lightImpact();
        await ApiClient.account.updatePrefs(prefs: {"userType": "vipUser"});

        if (phone.isNotEmpty) {
          Logger().v("phone $phone");
          // updateUserPhone(phone, password);
        }
      }
      Logger().v(user.toMap());
    } on AppwriteException catch (e) {
      return e.message ?? "Error Occurred";
    }
    return "";
  } on AppwriteException catch (error) {
    Logger().e(error);
    return "$error";
  }
}

/// SIGN IN METHOD
Future<String> signIn({required String email, required String password}) async {
  try {
    final result = await ApiClient.account.createEmailSession(
      email: email,
      password: password,
    );
    print(result.toMap());
    return result.$id;
  } on AppwriteException catch (error) {
    Logger().v(error);
    print(error.message);
    return "$error";
  }
}

/// SIGN OUT METHOD
Future signOut() async {
  try {
    await ApiClient.account.deleteSession(
      sessionId: 'current',
    );
  } on AppwriteException catch (e) {
    Logger().e(e);
  }
}

/// GET CURRENT USER
Future getCurrentUser() async {
  try {
    final result = await ApiClient.account.get();
    Logger().v(result.toMap());

    return result;
  } on AppwriteException catch (error) {
    Logger().e(error);
    return null;
  }
}
