## Login Register Bloc Library ##

A login and register form validation library built with flutter_bloc and Formz,
providing reusable blocs, events, states, and shared input widgets for Flutter apps.

#### Dependencies ####
```
Flutter 3.41.9 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 00b0c91f06 (2 weeks ago) • 2026-04-29 10:03:19 -0700
Engine • hash 9161402dc0e134b3fb5adee5046b6e84b1a5e1c1 (revision 42d3d75a56) (16 days ago) • 2026-04-28 17:31:55.000Z
Tools • Dart 3.11.5 • DevTools 2.54.2
```

#### Testing ####

This project includes comprehensive unit and widget tests using `flutter_test`, `bloc_test`, and `mocktail`.

| Test Category | Description |
| :--- | :--- |
| **Bloc Tests** | Validate state transitions for `LoginBloc` and `RegisterBloc`, including email, password, full name, and confirm password validation logic. |
| **Widget Tests** | Test reusable widgets like `PasswordField` (toggle visibility, callbacks, error display). |
| **Screen Tests** | Verify UI interactions and navigation for `LoginScreen` and `RegisterScreen`, including event dispatching on text input and button state changes. |

Run all tests with:
```
flutter test
```

#### Screenshot Android ####
| ![](https://images2.imgbox.com/85/eb/Lt8ZO2wF_o.jpg) | ![](https://images2.imgbox.com/ca/15/kD0nOJ09_o.jpg) | ![](https://images2.imgbox.com/04/c2/kf4cG3DG_o.jpg) | ![](https://images2.imgbox.com/76/88/f6YPlkBt_o.jpg) |
| :---: | :---: | :---: | :---: |
| ![](https://images2.imgbox.com/52/de/cltNsQIc_o.jpg) | ![](https://images2.imgbox.com/3b/44/BwyT7Oli_o.jpg) | ![](https://images2.imgbox.com/5c/aa/Q2T8C2Us_o.jpg) | ![](https://images2.imgbox.com/43/8d/ptzDPFlE_o.jpg) |

#### Screenshot iOS ####
| ![](https://i.imgur.com/3waH0X0.png) | ![](https://i.imgur.com/qO6T1xp.png) | ![](https://i.imgur.com/0phtRvN.png) | ![](https://i.imgur.com/MqYmGFv.png) |
| :---: | :---: | :---: | :---: |
| ![](https://i.imgur.com/u5SxBV7.png) | ![](https://i.imgur.com/Bj3DDKA.png) | ![](https://i.imgur.com/KJYdRdo.png) | ![](https://i.imgur.com/DoWh6qR.png) |

#### List Library ####
- [Bloc Test](https://pub.dev/packages/bloc_test)
- [Email Validator](https://pub.dev/packages/email_validator)
- [Equatable](https://pub.dev/packages/equatable)
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc)
- [Flutter Toast](https://pub.dev/packages/fluttertoast)
- [Formz](https://pub.dev/packages/formz)
- [Mocktail](https://pub.dev/packages/mocktail)
