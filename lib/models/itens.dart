class Item {
  String title;
  bool done;

  Item({this.title, this.done});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['tile'];
    done = json['done'];
  }

  Map<String, dynamic> toJason() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['done'] = this.done;
    return data;
  }

  //json to dart no google
  //ou
  //https://javiercbk.github.io/json_to_dart/ site

  //{chave ; "valor" , chave : "valor"}
}
