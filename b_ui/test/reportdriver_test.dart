import 'package:b_ui/controllers/finedriver_controller.dart';
import 'package:b_ui/controllers/reportpage_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';


void main(){
  ReportPageController controller = Get.put(ReportPageController());

  test("empty ID returns error",(){
    var result = controller.validateID('');
    expect(result, "please Insert the ID");
  });
  test("empty Licence returns error",(){
    var result = controller.validateLicence('');
    expect(result, "please Insert Licence");
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
    var result3 = controller.validateLicence('123');
    expect({result,result2,result3}, {null,"please Insert the ID",null});
  });

  test("empty Licence other other valid inputs",(){
    var result = controller.validateReason('because i wanted to');
    var result2 = controller.validateID('123');
    var result3 = controller.validateLicence('');
    expect({result,result2,result3}, {null,null,"please Insert Licence"});
  });


}