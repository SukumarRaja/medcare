class DoctorRes {
  DoctorRes({
    this.status,
    this.data,
  });

  dynamic status;
  List<Datum>? data;

  factory DoctorRes.fromMap(Map<String, dynamic> json) => DoctorRes(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.id,
    this.imgUrl,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.department,
    this.profile,
    this.x,
    this.y,
    this.ionUserId,
    this.hospitalId,
    this.departmentName,
    this.appointmentConfirmation,
    this.signature,
  });

  dynamic id;
  dynamic imgUrl;
  dynamic name;
  dynamic email;
  dynamic address;
  dynamic phone;
  dynamic department;
  dynamic profile;
  dynamic x;
  dynamic y;
  dynamic ionUserId;
  dynamic hospitalId;
  dynamic departmentName;
  dynamic appointmentConfirmation;
  dynamic signature;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        imgUrl: json["img_url"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        department: json["department"],
        profile: json["profile"],
        x: json["x"],
        y: json["y"],
        ionUserId: json["ion_user_id"],
        hospitalId: json["hospital_id"],
        departmentName: json["department_name"],
        appointmentConfirmation: json["appointment_confirmation"],
        signature: json["signature"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "img_url": imgUrl,
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "department": department,
        "profile": profile,
        "x": x,
        "y": y,
        "ion_user_id": ionUserId,
        "hospital_id": hospitalId,
        "department_name": departmentName,
        "appointment_confirmation": appointmentConfirmation,
        "signature": signature,
      };
}
