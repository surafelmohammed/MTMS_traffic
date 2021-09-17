import 'package:b_ui/controllers/signin_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

void main(){
SignInController controller = Get.put(SignInController());

  test("empty username returns error",(){
    var result = controller.validateUserName('');
    expect(result, "please Insert the valid username");
  });

test("input number username returns error",(){
  var result = controller.validateUserName('123');
  expect(result, "please Insert the valid username");
});
}