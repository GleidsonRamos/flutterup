class Project {
  String desc;
  String name;
  String link;
  int datesubmit;
  List<String> photo;
  String userid;
  String key;

  Project(
      {this.desc,
        this.name,
        this.link,
        this.datesubmit,
        this.photo,
        this.userid,
        this.key});

  Project.fromJson(Map<dynamic, dynamic> json, String _key) {
    desc = json['desc'];
    name = json['name'];
    link = json['link'];
    datesubmit = json['datesubmit'];
    photo = json['photo'].cast<String>();
    userid = json['userid'];
    key = _key;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['name'] = this.name;
    data['link'] = this.link;
    data['datesubmit'] = this.datesubmit;
    data['photo'] = this.photo;
    data['userid'] = this.userid;
    data['key'] = this.key;
    return data;
  }
}