import 'package:frontend/core/constants/api_endpoints.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/services/api_service.dart';
import '../models/user.dart';

@injectable
class AuthDatasource {
  var api = ApiService();

  Future<UserModel?> signIn(String email, String password) async {
    var res = await api.post(ApiEndpoints.login, {
      'email': email,
      'password': password,
    });
    if (res.isSuccess) {
      var user = UserModel.fromJson(res.body['data']);
      return user;
    }
    return null;
  }

  Future<void> register(String email, String password) async {}

  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }
      final response = await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      print("error occured : $e");
      return null;
    }
  }
}
