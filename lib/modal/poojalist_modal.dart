class PujaListModal {
  String? status;
  String? message;
  List<Data>? data;
  Pagination? pagination;

  PujaListModal({this.status, this.message, this.data, this.pagination});

  PujaListModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? image;
  String? pujaDate;
  String? title;
  String? subTitle;
  String? about;
  Mandir? mandir;

  Data(
      {this.id,
        this.image,
        this.pujaDate,
        this.title,
        this.subTitle,
        this.about,
        this.mandir, required List<dynamic> benifits});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    pujaDate = json['puja_date'];
    title = json['title'];
    subTitle = json['sub_title'];
    about = json['about'];
    mandir =
    json['mandir'] != null ? new Mandir.fromJson(json['mandir']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['puja_date'] = this.pujaDate;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['about'] = this.about;
    if (this.mandir != null) {
      data['mandir'] = this.mandir!.toJson();
    }
    return data;
  }
}

class Mandir {
  int? id;
  String? name;

  Mandir({this.id, this.name});

  Mandir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;

  Pagination({this.currentPage, this.lastPage, this.perPage, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    return data;
  }
}