import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:w_phonics/models/app_users.dart';

class AuthRepository {
  SupabaseClient supabase = Supabase.instance.client;

  Future<AppUsers?> signIn({required String email, required String password}) async {
    try {
      AuthResponse response = await supabase.auth.signInWithPassword(email: email, password: password);

// feetch user record
      Map<String, dynamic> userData = await supabase.from('users').select().eq('uid', response.user!.id).single();

      var appUsers = AppUsers.fromJson(userData);

      return appUsers;
    } on AuthApiException catch (e){
      if(e.code == "email_not_confirmed"){
        throw "Please confirm your email";
      }else{
        throw "An error occured";
      }
    } catch (e) {
      print(e);

      throw Exception("An error occurred while signing in");
    }
  }

  Future<AppUsers> signUp({required String email, required String password}) async {
    try{
      var response = await supabase.auth.signUp(email: email, password: password);

      var user = AppUsers(
        uid: response.user!.id, 
        email: email,
      );

      // save the user record to supabase
      await supabase.from('users').insert(user.toJson());

      return user;
      
    }catch(e){
      print(e);

      throw Exception("An error occured while creating user account");
    }
  }

  Future<AppUsers> updateUserProfile({required AppUsers user}) async {
    try{
      await supabase.from('users').update(user.toJson()).eq('uid', user.uid);

      return user;
    }catch(e){
      print(e);

      throw Exception("An error occured while updating user profile");
    }
  }
}
