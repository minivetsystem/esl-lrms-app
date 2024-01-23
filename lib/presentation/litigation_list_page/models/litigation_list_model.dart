class CaseList {
  bool? status;
  Results? results;
  String? message;

  CaseList({this.status, this.results, this.message});

  CaseList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Results {
  List<CourtCases>? courtCases;
  int? totalPage;
  int? totalCount;
  int? closedCase;
  int? openCase;

  Results(
      {this.courtCases,
      this.totalPage,
      this.totalCount,
      this.closedCase,
      this.openCase});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['courtCases'] != null) {
      courtCases = <CourtCases>[];
      json['courtCases'].forEach((v) {
        courtCases!.add(new CourtCases.fromJson(v));
      });
    }
    totalPage = json['totalPage'];
    totalCount = json['totalCount'];
    closedCase = json['closedCase'];
    openCase = json['openCase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courtCases != null) {
      data['courtCases'] = this.courtCases!.map((v) => v.toJson()).toList();
    }
    data['totalPage'] = this.totalPage;
    data['totalCount'] = this.totalCount;
    data['closedCase'] = this.closedCase;
    data['openCase'] = this.openCase;
    return data;
  }
}

class CourtCases {
  int? id;
  int? courtId;
  int? userId;
  int? assignedBy;
  String? title;
  int? typeId;
  String? type;
  int? caseStatusId;
  String? caseNo;
  int? villageId;
  String? createdAt;
  String? updatedAt;
  Details? details;
  User? user;
  Court? court;
  CaseType? caseType;
  CaseType? caseStatus;
  Assignee? assignee;

  CourtCases(
      {this.id,
      this.courtId,
      this.userId,
      this.assignedBy,
      this.title,
      this.typeId,
      this.type,
      this.caseStatusId,
      this.caseNo,
      this.villageId,
      this.createdAt,
      this.updatedAt,
      this.details,
      this.user,
      this.court,
      this.caseType,
      this.caseStatus,
      this.assignee});

  CourtCases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courtId = json['court_id'];
    userId = json['user_id'];
    assignedBy = json['assigned_by'];
    title = json['title'];
    typeId = json['type_id'];
    type = json['type'];
    caseStatusId = json['case_status_id'];
    caseNo = json['case_no'];
    villageId = json['village_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    court = json['court'] != null ? new Court.fromJson(json['court']) : null;
    caseType = json['case_type'] != null
        ? new CaseType.fromJson(json['case_type'])
        : null;
    caseStatus = json['case_status'] != null
        ? new CaseType.fromJson(json['case_status'])
        : null;
    assignee = json['assignee'] != null
        ? new Assignee.fromJson(json['assignee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['court_id'] = this.courtId;
    data['user_id'] = this.userId;
    data['assigned_by'] = this.assignedBy;
    data['title'] = this.title;
    data['type_id'] = this.typeId;
    data['type'] = this.type;
    data['case_status_id'] = this.caseStatusId;
    data['case_no'] = this.caseNo;
    data['village_id'] = this.villageId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.court != null) {
      data['court'] = this.court!.toJson();
    }
    if (this.caseType != null) {
      data['case_type'] = this.caseType!.toJson();
    }
    if (this.caseStatus != null) {
      data['case_status'] = this.caseStatus!.toJson();
    }
    if (this.assignee != null) {
      data['assignee'] = this.assignee!.toJson();
    }
    return data;
  }
}

class Details {
  int? id;
  int? caseId;
  String? openAt;
  String? closeAt;
  String? details;
  String? petitionerName;
  String? petitionerAddress;
  String? petitionerContact;
  String? advocateName;
  String? advocateAddress;
  String? advocatePhoneNo;
  String? responderName;
  String? responderAddress;
  String? responderPhoneNo;
  String? createdAt;
  String? updatedAt;

  Details(
      {this.id,
      this.caseId,
      this.openAt,
      this.closeAt,
      this.details,
      this.petitionerName,
      this.petitionerAddress,
      this.petitionerContact,
      this.advocateName,
      this.advocateAddress,
      this.advocatePhoneNo,
      this.responderName,
      this.responderAddress,
      this.responderPhoneNo,
      this.createdAt,
      this.updatedAt});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caseId = json['case_id'];
    openAt = json['open_at'];
    closeAt = json['close_at'];
    details = json['details'];
    petitionerName = json['petitioner_name'];
    petitionerAddress = json['petitioner_address'];
    petitionerContact = json['petitioner_contact'];
    advocateName = json['advocate_name'];
    advocateAddress = json['advocate_address'];
    advocatePhoneNo = json['advocate_phone_no'];
    responderName = json['responder_name'];
    responderAddress = json['responder_address'];
    responderPhoneNo = json['responder_phone_no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['case_id'] = this.caseId;
    data['open_at'] = this.openAt;
    data['close_at'] = this.closeAt;
    data['details'] = this.details;
    data['petitioner_name'] = this.petitionerName;
    data['petitioner_address'] = this.petitionerAddress;
    data['petitioner_contact'] = this.petitionerContact;
    data['advocate_name'] = this.advocateName;
    data['advocate_address'] = this.advocateAddress;
    data['advocate_phone_no'] = this.advocatePhoneNo;
    data['responder_name'] = this.responderName;
    data['responder_address'] = this.responderAddress;
    data['responder_phone_no'] = this.responderPhoneNo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? username;
  int? departmentId;
  String? phoneno;
  String? whatasppno;
  String? profileImageOriginalName;
  String? profileImageName;
  String? profileImageUrl;
  String? signatureImageUrl;
  String? stampImageUrl;
  String? resetToken;
  String? verify;
  String? verifyToken;
  String? passwordResets;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? deletedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.departmentId,
      this.phoneno,
      this.whatasppno,
      this.profileImageOriginalName,
      this.profileImageName,
      this.profileImageUrl,
      this.signatureImageUrl,
      this.stampImageUrl,
      this.resetToken,
      this.verify,
      this.verifyToken,
      this.passwordResets,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    departmentId = json['department_id'];
    phoneno = json['phoneno'];
    whatasppno = json['whatasppno'];
    profileImageOriginalName = json['profile_image_original_name'];
    profileImageName = json['profile_image_name'];
    profileImageUrl = json['profile_image_url'];
    signatureImageUrl = json['signature_image_url'];
    stampImageUrl = json['stamp_image_url'];
    resetToken = json['reset_token'];
    verify = json['verify'];
    verifyToken = json['verify_token'];
    passwordResets = json['password_resets'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['department_id'] = this.departmentId;
    data['phoneno'] = this.phoneno;
    data['whatasppno'] = this.whatasppno;
    data['profile_image_original_name'] = this.profileImageOriginalName;
    data['profile_image_name'] = this.profileImageName;
    data['profile_image_url'] = this.profileImageUrl;
    data['signature_image_url'] = this.signatureImageUrl;
    data['stamp_image_url'] = this.stampImageUrl;
    data['reset_token'] = this.resetToken;
    data['verify'] = this.verify;
    data['verify_token'] = this.verifyToken;
    data['password_resets'] = this.passwordResets;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Court {
  int? id;
  String? name;
  int? courtTypeId;
  String? address;
  String? details;
  String? status;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Court(
      {this.id,
      this.name,
      this.courtTypeId,
      this.address,
      this.details,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Court.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    courtTypeId = json['court_type_id'];
    address = json['address'];
    details = json['details'];
    status = json['status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['court_type_id'] = this.courtTypeId;
    data['address'] = this.address;
    data['details'] = this.details;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CaseType {
  int? id;
  String? name;
  String? status;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  CaseType(
      {this.id,
      this.name,
      this.status,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  CaseType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Assignee {
  int? id;
  String? name;
  String? email;
  String? username;
  int? departmentId;
  String? phoneno;
  String? whatasppno;
  Null? profileImageOriginalName;
  String? profileImageName;
  String? profileImageUrl;
  Null? signatureImageUrl;
  Null? stampImageUrl;
  Null? resetToken;
  String? verify;
  Null? verifyToken;
  String? passwordResets;
  String? createdAt;
  Null? createdBy;
  String? updatedAt;
  Null? deletedAt;

  Assignee(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.departmentId,
      this.phoneno,
      this.whatasppno,
      this.profileImageOriginalName,
      this.profileImageName,
      this.profileImageUrl,
      this.signatureImageUrl,
      this.stampImageUrl,
      this.resetToken,
      this.verify,
      this.verifyToken,
      this.passwordResets,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.deletedAt});

  Assignee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    departmentId = json['department_id'];
    phoneno = json['phoneno'];
    whatasppno = json['whatasppno'];
    profileImageOriginalName = json['profile_image_original_name'];
    profileImageName = json['profile_image_name'];
    profileImageUrl = json['profile_image_url'];
    signatureImageUrl = json['signature_image_url'];
    stampImageUrl = json['stamp_image_url'];
    resetToken = json['reset_token'];
    verify = json['verify'];
    verifyToken = json['verify_token'];
    passwordResets = json['password_resets'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['department_id'] = this.departmentId;
    data['phoneno'] = this.phoneno;
    data['whatasppno'] = this.whatasppno;
    data['profile_image_original_name'] = this.profileImageOriginalName;
    data['profile_image_name'] = this.profileImageName;
    data['profile_image_url'] = this.profileImageUrl;
    data['signature_image_url'] = this.signatureImageUrl;
    data['stamp_image_url'] = this.stampImageUrl;
    data['reset_token'] = this.resetToken;
    data['verify'] = this.verify;
    data['verify_token'] = this.verifyToken;
    data['password_resets'] = this.passwordResets;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}