import 'package:checkingapi/modal/poojalist_modal.dart';

class PujaDetails {
  String status;
  String message;
  Data data;

  // Constructor with required fields
  PujaDetails({required this.status, required this.message, required this.data});

  // Updated fromJson method to handle nullable fields gracefully
  PujaDetails.fromJson(Map<String, dynamic> json)
      : status = json['status'] ?? 'Unknown',  // Handle null status
        message = json['message'] ?? 'No message',  // Handle null message
        data = json['data'] != null ? Data.fromJson(json['data']) : throw Exception('Data is required');

  // Updated toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['status'] = this.status;
    dataMap['message'] = this.message;
    dataMap['data'] = this.data.toJson();
    return dataMap;
  }
}

class Data {
  int id;
  int mandirId;
  String pujaDate;
  String title;
  String subTitle;
  String about;
  String image;
  Mandir mandir;
  List<Benifits> benifits;
  List<Processes> processes;
  List<dynamic> faqs;  // Handle as List<dynamic>
  List<dynamic> packages;  // Handle as List<dynamic>

  // Constructor
  Data({
    required this.id,
    required this.mandirId,
    required this.pujaDate,
    required this.title,
    required this.subTitle,
    required this.about,
    required this.image,
    required this.mandir,
    required this.benifits,
    required this.processes,
    required this.faqs,
    required this.packages,
  });

  // Updated fromJson method with error handling and default empty lists
  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,  // Default to 0 if id is not found
        mandirId = json['mandir_id'] ?? 0,  // Default to 0 if mandir_id is not found
        pujaDate = json['puja_date'] ?? '',  // Default to empty string if not found
        title = json['title'] ?? '',  // Default to empty string if not found
        subTitle = json['sub_title'] ?? '',  // Default to empty string if not found
        about = json['about'] ?? '',  // Default to empty string if not found
        image = json['image'] ?? '',  // Default to empty string if not found
        mandir = json['mandir'] != null
            ? Mandir.fromJson(json['mandir'])
            : Mandir(id: 0, name: 'Unknown'),  // Handle null mandir gracefully
        benifits = (json['benifits'] as List?)
            ?.map((v) => Benifits.fromJson(v))
            .toList() ??
            [],  // Default to empty list if benifits is not found
        processes = (json['processes'] as List?)
            ?.map((v) => Processes.fromJson(v))
            .toList() ??
            [],  // Default to empty list if processes is not found
        faqs = json['faqs'] != null ? List<dynamic>.from(json['faqs']) : [],  // Handle faqs gracefully
        packages = json['packages'] != null ? List<dynamic>.from(json['packages']) : [];  // Handle packages gracefully

  // toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['id'] = id;
    dataMap['mandir_id'] = mandirId;
    dataMap['puja_date'] = pujaDate;
    dataMap['title'] = title;
    dataMap['sub_title'] = subTitle;
    dataMap['about'] = about;
    dataMap['image'] = image;
    dataMap['mandir'] = mandir.toJson();
    dataMap['benifits'] = benifits.map((v) => v.toJson()).toList();
    dataMap['processes'] = processes.map((v) => v.toJson()).toList();
    dataMap['faqs'] = faqs;
    dataMap['packages'] = packages;
    return dataMap;
  }
}

class Mandir {
  int id;
  String name;

  Mandir({required this.id, required this.name});

  Mandir.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,  // Handle null id gracefully
        name = json['name'] ?? 'Unknown';  // Handle null name gracefully

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['id'] = id;
    dataMap['name'] = name;
    return dataMap;
  }
}

class Benifits {
  int id;
  String icon;
  String title;
  String description;

  Benifits({required this.id, required this.icon, required this.title, required this.description});

  Benifits.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,  // Handle null id gracefully
        icon = json['icon'] ?? '',  // Handle null icon gracefully
        title = json['title'] ?? '',  // Handle null title gracefully
        description = json['description'] ?? '';  // Handle null description gracefully

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['id'] = id;
    dataMap['icon'] = icon;
    dataMap['title'] = title;
    dataMap['description'] = description;
    return dataMap;
  }
}

class Processes {
  int id;
  String description;

  Processes({required this.id, required this.description});

  Processes.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,  // Handle null id gracefully
        description = json['description'] ?? '';  // Handle null description gracefully

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['id'] = id;
    dataMap['description'] = description;
    return dataMap;
  }
}
