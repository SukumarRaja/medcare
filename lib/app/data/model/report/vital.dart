class VitalSignRes {
  VitalSignRes({
    this.status,
    this.data,
  });

  dynamic status;
  List<Datum>? data;

  factory VitalSignRes.fromMap(Map<String, dynamic> json) => VitalSignRes(
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
    this.patientId,
    this.bmiHeight,
    this.bmiWeight,
    this.respiratoryRate,
    this.oxygenSaturation,
    this.temperature,
    this.diastolicBloodPressure,
    this.systolicBloodPressure,
    this.addDateTime,
    this.heartRate,
    this.hospitalId,
  });

  dynamic id;
  dynamic patientId;
  dynamic bmiHeight;
  dynamic bmiWeight;
  dynamic respiratoryRate;
  dynamic oxygenSaturation;
  dynamic temperature;
  dynamic diastolicBloodPressure;
  dynamic systolicBloodPressure;
  dynamic addDateTime;
  dynamic heartRate;
  dynamic hospitalId;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        patientId: json["patient_id"],
        bmiHeight: json["bmi_height"],
        bmiWeight: json["bmi_weight"],
        respiratoryRate: json["respiratory_rate"],
        oxygenSaturation: json["oxygen_saturation"],
        temperature: json["temperature"],
        diastolicBloodPressure: json["diastolic_blood_pressure"],
        systolicBloodPressure: json["systolic_blood_pressure"],
        addDateTime: json["add_date_time"],
        heartRate: json["heart_rate"],
        hospitalId: json["hospital_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "patient_id": patientId,
        "bmi_height": bmiHeight,
        "bmi_weight": bmiWeight,
        "respiratory_rate": respiratoryRate,
        "oxygen_saturation": oxygenSaturation,
        "temperature": temperature,
        "diastolic_blood_pressure": diastolicBloodPressure,
        "systolic_blood_pressure": systolicBloodPressure,
        "add_date_time": addDateTime,
        "heart_rate": heartRate,
        "hospital_id": hospitalId,
      };
}
