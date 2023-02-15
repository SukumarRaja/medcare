class UpdateRes {
  UpdateRes({
    this.message,
    this.status,
    this.data,
  });

  dynamic message;
  dynamic status;
  Data? data;

  factory UpdateRes.fromMap(Map<String, dynamic> json) => UpdateRes(
        message: json["message"],
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "status": status,
        "data": data!.toMap(),
      };
}

class Data {
  Data({
    this.id,
    this.imgUrl,
    this.name,
    this.email,
    this.doctor,
    this.address,
    this.phone,
    this.sex,
    this.birthdate,
    this.age,
    this.bloodgroup,
    this.ionUserId,
    this.patientId,
    this.addDate,
    this.registrationTime,
    this.howAdded,
    this.hospitalId,
    this.appointmentConfirmation,
    this.appointmentCreation,
    this.paymentConfirmation,
    this.meetingSchedule,
  });

  dynamic id;
  dynamic imgUrl;
  dynamic name;
  dynamic email;
  dynamic doctor;
  dynamic address;
  dynamic phone;
  dynamic sex;
  dynamic birthdate;
  dynamic age;
  dynamic bloodgroup;
  dynamic ionUserId;
  dynamic patientId;
  dynamic addDate;
  dynamic registrationTime;
  dynamic howAdded;
  dynamic hospitalId;
  dynamic appointmentConfirmation;
  dynamic appointmentCreation;
  dynamic paymentConfirmation;
  dynamic meetingSchedule;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        imgUrl: json["img_url"],
        name: json["name"],
        email: json["email"],
        doctor: json["doctor"],
        address: json["address"],
        phone: json["phone"],
        sex: json["sex"],
        birthdate: json["birthdate"],
        age: json["age"],
        bloodgroup: json["bloodgroup"],
        ionUserId: json["ion_user_id"],
        patientId: json["patient_id"],
        addDate: json["add_date"],
        registrationTime: json["registration_time"],
        howAdded: json["how_added"],
        hospitalId: json["hospital_id"],
        appointmentConfirmation: json["appointment_confirmation"],
        appointmentCreation: json["appointment_creation"],
        paymentConfirmation: json["payment_confirmation"],
        meetingSchedule: json["meeting_schedule"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "img_url": imgUrl,
        "name": name,
        "email": email,
        "doctor": doctor,
        "address": address,
        "phone": phone,
        "sex": sex,
        "birthdate": birthdate,
        "age": age,
        "bloodgroup": bloodgroup,
        "ion_user_id": ionUserId,
        "patient_id": patientId,
        "add_date": addDate,
        "registration_time": registrationTime,
        "how_added": howAdded,
        "hospital_id": hospitalId,
        "appointment_confirmation": appointmentConfirmation,
        "appointment_creation": appointmentCreation,
        "payment_confirmation": paymentConfirmation,
        "meeting_schedule": meetingSchedule,
      };
}
