

class ShopLogin 
{
  bool ?status;
  String ?message;
  UserData ?data;
  ShopLogin.
  
  fromJSON (Map<String , dynamic>json)
  {
    status = json['status'];
    message = json['message'];
    data = json["data"]!= null ? UserData(data:json['data']) : null;

  }


}

class UserData{
  int ? id;
  String? name;
  String ?email;
  String ?phone;
  String ?image;
  String ?token;
  int? points;
  int ?credit;
  UserData({
   required Map<String , dynamic>data
   })
  {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
    token = data['token'];
    points = data['points'];
    credit = data['credit'];
  }

}