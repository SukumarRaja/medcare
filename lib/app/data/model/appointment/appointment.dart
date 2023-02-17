class AppointmentRes {
  AppointmentRes({
    this.status,
    this.data,
  });

  dynamic status;
  List<Datum>? data;

  factory AppointmentRes.fromMap(Map<String, dynamic> json) => AppointmentRes(
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
    this.patient,
    this.doctor,
    this.date,
    this.timeSlot,
    this.sTime,
    this.eTime,
    this.remarks,
    this.addDate,
    this.registrationTime,
    this.sTimeKey,
    this.status,
    this.user,
    this.request,
    this.patientName,
    this.doctorName,
    this.roomId,
    this.liveMeetingLink,
    this.cronJob,
    this.hospitalId,
  });

  dynamic id;
  dynamic patient;
  dynamic doctor;
  dynamic date;
  dynamic timeSlot;
  dynamic sTime;
  dynamic eTime;
  dynamic remarks;
  dynamic addDate;
  dynamic registrationTime;
  dynamic sTimeKey;
  dynamic status;
  dynamic user;
  dynamic request;
  dynamic patientName;
  dynamic doctorName;
  dynamic roomId;
  dynamic liveMeetingLink;
  dynamic cronJob;
  dynamic hospitalId;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        patient: json["patient"],
        doctor: json["doctor"],
        date: json["date"],
        timeSlot: json["time_slot"],
        sTime: json["s_time"],
        eTime: json["e_time"],
        remarks: json["remarks"],
        addDate: json["add_date"],
        registrationTime: json["registration_time"],
        sTimeKey: json["s_time_key"],
        status: json["status"],
        user: json["user"],
        request: json["request"],
        patientName: json["patientname"],
        doctorName: json["doctorname"],
        roomId: json["room_id"],
        liveMeetingLink: json["live_meeting_link"],
        cronJob: json["cron_job"],
        hospitalId: json["hospital_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "patient": patient,
        "doctor": doctor,
        "date": date,
        "time_slot": timeSlot,
        "s_time": sTime,
        "e_time": eTime,
        "remarks": remarks,
        "add_date": addDate,
        "registration_time": registrationTime,
        "s_time_key": sTimeKey,
        "status": status,
        "user": user,
        "request": request,
        "patientName": patientName,
        "doctorName": doctorName,
        "room_id": roomId,
        "live_meeting_link": liveMeetingLink,
        "cron_job": cronJob,
        "hospital_id": hospitalId,
      };
}
