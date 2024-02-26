abstract class RegisterEvent {}

class FetchRegister extends RegisterEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String address;
  final String gender;
  final int age;
  FetchRegister(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.address,
      required this.gender,
      required this.age});
  List<Object> get props =>
      [name, email, phone, password, address, gender, age];
}
