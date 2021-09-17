import 'package:b_ui/controllers/signin_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main(){
  SignInController controller = Get.put(SignInController());
  
  test("empty password field returns error",(){
    
    var result = controller.validatePassword('');
    expect(result, "Please Insert valid and strong password");
  });

  test("weak password field returns error",(){

    var result = controller.validatePassword('sura');
    expect(result, "Please Insert valid and strong password");
  });

  test("Strong password returns null",(){

    var result = controller.validatePassword('Surafel1!');
    expect(result, null);
  });

}