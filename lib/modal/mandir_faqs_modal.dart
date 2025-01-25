class MandirFaqs {
  String status;
  String message;
  List<Data> data; // ❌ ERROR: Needs initialization

  // ✅ FIX: Ensure initialization using required parameters
  MandirFaqs({required this.status, required this.message, required this.data});

  // ✅ FIX: Use the null-aware operator (`?`) and proper initialization
  MandirFaqs.fromJson(Map<String, dynamic> json)
      : status = json['status'] ?? '',
        message = json['message'] ?? '',
        data = (json['data'] as List?)?.map((v) => Data.fromJson(v)).toList() ?? [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  int id;
  int mandirId;
  String question;
  String answer;

  // ✅ FIX: Ensure initialization using required parameters
  Data({required this.id, required this.mandirId, required this.question, required this.answer});

  // ✅ FIX: Use null-aware operator to handle missing fields
  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        mandirId = json['mandir_id'] ?? 0,
        question = json['question'] ?? '',
        answer = json['answer'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mandir_id'] = mandirId;
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}
