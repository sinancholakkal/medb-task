class UserModel {
  final String userId;
  final String? clinicId;
  final String? doctorId;
  final String? doctorClinics;
  final String firstName;
  final String? middleName;
  final String? lastName;
  final String? age;
  final String? gender;
  final String? designation;
  final String? contactNo;
  final String? address;
  final String? city;
  final String? district;
  final String? state;
  final String? country;
  final String? postalCode;
  final String? profilePicture;
  final String? email;

  UserModel({
    required this.userId,
    this.clinicId,
    this.doctorId,
    this.doctorClinics,
    required this.firstName,
    this.middleName,
    this.lastName,
    this.age,
    this.gender,
    this.designation,
    this.contactNo,
    this.address,
    this.city,
    this.district,
    this.state,
    this.country,
    this.postalCode,
    this.profilePicture,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? '',
      clinicId: json['clinicId'],
      doctorId: json['doctorId'],
      doctorClinics: json['doctorClinics'],
      firstName: json['firstName'] ?? '',
      middleName: json['middleName'],
      lastName: json['lastName'],
      age: json['age'],
      gender: json['gender'],
      designation: json['designation'],
      contactNo: json['contactNo'],
      address: json['address'],
      city: json['city'],
      district: json['district'],
      state: json['state'],
      country: json['country'],
      postalCode: json['postalCode'],
      profilePicture: json['profilePicture'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'clinicId': clinicId,
      'doctorId': doctorId,
      'doctorClinics': doctorClinics,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'age': age,
      'gender': gender,
      'designation': designation,
      'contactNo': contactNo,
      'address': address,
      'city': city,
      'district': district,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      'profilePicture': profilePicture,
      'email': email,
    };
  }
}
