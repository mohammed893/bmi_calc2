import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget def_button({
  double width = double.infinity,
  String title = "login",
  Color color = Colors.blue,
  double height = 40,
  bool upper = true,
  required Function func,
  double bor_radius = 0,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(bor_radius)),
      child: MaterialButton(
        onPressed: () {
          func();
        },
        child: Text(
          //
          upper ? title.toUpperCase() : title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget def_text_form(
        {required var Controller,
        bool showcurs = true,
        Function? on_sub,
        required Function? on_edit,
        String label = "label" , 
        IconData? preicon ,
        IconData ? sufficon  ,
        InputBorder Border = const OutlineInputBorder(),
        required String ? val_str,
        bool Obsecure_text = false, 
        Function? on_tab,

        }) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return val_str;
        }
        return null;
      },
      onTap: (){
        on_tab!();
      },cursorColor: Color.fromARGB(255, 88, 40, 246),
      showCursor: showcurs,
      controller: Controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: Obsecure_text,
      onFieldSubmitted: (String value) {
        on_sub!();
      },
      onChanged: (String value) {
        on_edit!();
      },
      decoration: InputDecoration(
        
        
        labelText: label,
        prefixIcon: Icon(
          preicon,
        ),
        suffixIcon: Icon(
          sufficon,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 40, 246, 109),width: 0.00
          ),
          
        ),border: const OutlineInputBorder(),

        
      ),
    );
   

Widget def_task (

) => Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(children: [
                CircleAvatar(backgroundColor: Colors.blue,radius: 25,),
                SizedBox(width: 25,),
                Text('Task name data')
              ],),
            ),
          );
   Widget NewsItem(
    {required String date,
    required String Title,
    required String body,
    required String urlimg,
    Cubit ,required context}) {
  return MaterialButton(
    onPressed: () {
    },
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
       
        height: 110,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
           color: Colors.grey.withOpacity(0.5),
           
           borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 100,
                  height: 98,
                  // decoration: BoxDecoration(
                  //   image:DecorationImage(fit: )
                  // ),

                  child: Image.network(
                    urlimg,
                    fit: BoxFit.cover,
                    scale: 7,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  date,
                  style: TextStyle(fontSize: 10),
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 110,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        Title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
void NavigateAndDestroy(context , Widget){
  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Widget)
  , (route) => false);

}
void NavigateTo(context , Widget){
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget),);
  

}
void ShopwToast({required String msg ,required ToastStates state}){
   Fluttertoast.showToast(
                msg: msg,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: SwtchToastClr(state),
                textColor: Colors.white,
                fontSize: 16.0);
}

enum ToastStates {SUCC , WARN , ERR}
Color SwtchToastClr (ToastStates stat)
{
  switch (stat) {
    case ToastStates.SUCC:return Colors.green; 
    case ToastStates.ERR:return Colors.red; 
    case ToastStates.WARN:return Colors.yellow; 
    default:return Colors.green;
  }
}