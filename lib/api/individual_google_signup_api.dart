import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noobz/api/api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/utils/string.dart';

class GoogleSignUpApi {
  Future<Map<String, dynamic>> signUpWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    if (googleSignInAccount == null) {
      return {'error': true, 'message': 'Google Sign Up canceled by user'};
    }

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final String accessToken = googleSignInAuthentication.accessToken!;
    final String idToken = googleSignInAuthentication.idToken!;
    final String userEmail = googleSignInAccount.email;
    final String userName = googleSignInAccount.displayName ?? '';

    final String loginType = 'google';
    final String accountType = 'Individual';

    GetStorage box = GetStorage();
    box.write('name', userName);
    box.write('email', userEmail);
    box.write('id_token', idToken);

    var url = BASE_URL + 'register';
    print(url);

    var data;

    data = {
      'access_token': accessToken,
      'id_token': idToken,
      'email': userEmail.toString(),
      'name': userName.toString(),
      'login_type': loginType.toString(),
      'account_type': accountType.toString(),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );

    if (response['error']) {
      return {'error': true, 'message': 'Sign up failed'};
    } else {
      User user = User.fromJson(response['user']);
      box.write('api_token', user.api_token);
      box.write('user_id', user.id);
      print(box.read('name'));

      return {'error': false, 'message': 'Sign up successful'};
    }
  }
}
