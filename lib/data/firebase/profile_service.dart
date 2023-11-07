import 'package:book_reader/model/universal_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  Future<UniversalData> updateUserName({required String username}) async {
    try {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(username);
      return UniversalData(data: 'Updated!');
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> updateUserImg({required String imagePath})async{
    try{
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(imagePath);
      return UniversalData(data: "Updated!");
    }on FirebaseAuthException catch(e){
      return UniversalData(error: e.code);
    }catch (error){
      return UniversalData(error: error.toString());
    }
  }
  
  Future<UniversalData> updateUserPassword({required String newPassword})async{
    try{
      await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
      return UniversalData(data: "Updated!");
    }on FirebaseAuthException catch(e){
      return UniversalData(error: e.code);
    }catch (error){
      return UniversalData(error: error.toString());
    }
  }
}
