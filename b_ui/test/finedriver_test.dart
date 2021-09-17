import 'package:b_ui/controllers/finedriver_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';


void main(){
  FineDriverController controller = Get.put(FineDriverController());

  test("empty ID returns error",(){
    var result = controller.validateID('');
    expect(result, "please Insert the ID");
  });
  test("empty Amount returns error",(){
    var result = controller.validateAmount('');
    expect(result, "please Insert Amount");
  });
  test("empty Reason returns error",(){
    var result = controller.validateReason('');
    expect(result, "please Insert a Reason");
  });

  test("empty Reason other valid id",(){
    var result = controller.validateReason('');
    var result2 = controller.validateID('123');
    expect({result,result2}, {"please Insert a Reason",null});
  });

  test("empty ID other other valid inputs",(){
    var result = controller.validateReason('because i wanted to');
    var result2 = controller.validateID('');
    var result3 = controller.validateAmount('123');
    expect({result,result2,result3}, {null,"please Insert the ID",null});
  });

  test("empty Amount other other valid inputs",(){
    var result = controller.validateReason('because i wanted to');
    var result2 = controller.validateID('123');
    var result3 = controller.validateAmount('');
    expect({result,result2,result3}, {null,null,"please Insert Amount"});
  });


}