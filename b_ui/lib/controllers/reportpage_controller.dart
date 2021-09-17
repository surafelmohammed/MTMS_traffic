class ReportPageController{
  String validateID(value){

    if(value.isEmpty||value==null){
      return "please Insert the ID";
    }else{
      return null;
    }
  }

  String validateLicence(value){

    if(value.isEmpty||value==null){
      return "please Insert Licence";
    }else{
      return null;
    }
  }
  String validateReason(value){

    if(value.isEmpty||value==null){
      return "please Insert a Reason";
    }else{
      return null;
    }
  }
}