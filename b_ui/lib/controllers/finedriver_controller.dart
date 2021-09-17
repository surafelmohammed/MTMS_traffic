class FineDriverController{
  String validateID(value){

    if(value.isEmpty||value==null){
      return "please Insert the ID";
    }else{
      return null;
    }
  }

  String validateAmount(value){

    if(value.isEmpty||value==null){
      return "please Insert Amount";
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