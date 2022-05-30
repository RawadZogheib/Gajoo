library flutterclient.globals;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gajoo/hexColor/hexColor.dart';
import 'package:gajoo/widgets/HomePage/TeacherCard.dart';

//Version
const String version = "v1.0";

//Server Ip  (page[/my_api.dart])
//const String myIP = "https://kwikcode.net/gajoo_php";
const String myIP = "http://127.0.0.1/Gajoo_php";

// bool? isLoggedIn;

String currentPage = 'HomePage';//HomePage//MyCourses//CalendarPage//Teacher//LikedTeachersPage//MyAudio//PaymentPage//MySettings

//Colors
final Color blue = Colors.blue.shade50;
final Color blue_1 = Colors.blue.shade900;
final Color blue_2 = Colors.blue.shade900.withOpacity(0.5);
final Color red = Colors.red.shade50;
final Color red_1 = Colors.red.shade900;
final Color red_2 = Colors.red.shade900.withOpacity(0.5);

Color blue1 = Colors.blue.shade900;
Color blue2 = Colors.blue.shade50;
Color red1 = Colors.red.shade700;
Color red2 = Colors.red.shade50;
Color yellow1 = Colors.yellow.shade700;
Color yellow2 = Colors.yellow.shade50;
Color green1 = Colors.green.shade700;
Color green2 = Colors.green.shade50;

const Color transparent = Colors.transparent;
const Color black = Colors.black;
final Color whiteBlue = HexColor("#f2f3f8");
final Color white = HexColor("#fdfdfd");


//Errors
const String warning1 = "No Spaces Allowed.";
const String warning2_1 = "Your username must contain at least 8 characters.";
const String warning2_2 = "Your username can only contain lowercase and uppercase characters and special characters( _ .).";
const String warning2_3 = "Your password must contain at least 8 characters, 1 lowercase(a-z),1 uppercase(A-Z),1 numeric character(0-9) and 1 special character(* . ! @ # \$ % ^ & : , ? _ -).";
//const String warning2_4 = "Your age must be greater than 17.";
const String warning2_5 = "It's not an email format.";
//const String warning2_6 = "It's not a university email.";
const String error2_7 = "phone Number already exists";
const String error3 = "Please make sure your passwords match.";
const String error4 = "Cannot connect to the dataBase.";    // error in insert or delete or update etc...
const String warning5 = "UserName already exist.";
const String warning6 = "Email already exist.";
const String warning7 = "Field cannot be empty.";
const String warning8 = "Incorrect email or password.";       // for login
const String error9 = "It's not a phoneNumber format, example: +961########";
const String warning10 = "No data available";
const String error11 = "This email is not Registered";
const String error12 = "Incorrect Email sent";
const String errorToken = "Token Error.";
const String errorVersion = "New version available.";
const String errorElse = "Failed to connect... Connection Problem.";
const String errorException = "OOPs! Something went wrong. Try again in few seconds.";
const String codeFailed = "your code is incorrect";
const String codeException = "Oops Something went wrong! please try to login again!";

const String warning400 = "You must login first!";///////
const String error401 = "Sorry, this day is full.";///////
const String error402 = "Sorry, this day is not available.";///////
const String error403 = "Sorry, this course is not available.";///////
const String success404 = "New course added.";///////
const String error405 = 'This teacher has no courses yet.';
const String error406 = 'There is no courses available on this day.';
const String warning407 = 'There is no teacehrs available.';
const String success408 = "Payment Done Successfully.";///////
const String error409 = 'Coupon already claimed!';
const String error410 = 'You don\'t have enough bill.';// Wallet doesn't Exists
const String error411 = 'You don\'t have enough bill.';
const String error412 = 'The course is no longer available.';
const String error413 = 'You already have this course.';
//for AlertDialog
String x = '0';


//for Languages
List<dynamic> Languages = [ 'Afrikaans','Albanian','Amharic','Arabic','Armenian','Basque','Bengali','Byelorussian','Burmese','Bulgarian',
                          'Catalan','Czech','Chinese','Croatian','Danish','Dari','Dzongkha','Dutch','English','Esperanto','Estonian',
                          'Faroese','Farsi','Finnish','French','Gaelic','Galician','German','Greek','Hebrew','Hindi','Hungarian',
                          'Icelandic','Indonesian','Inuktitut (Eskimo)','Italian','Japanese','Khmer','Korean','Kurdish',
                          'Laotian','Latvian','Lappish','Lithuanian','Macedonian','Malay','Maltese','Nepali','Norwegian',
                          'Pashto','Polish','Portuguese','Romanian','Russian', 'Scots','Serbian','Slovak','Slovenian','Somali','Spanish','Swedish','Swahili',
                          'Tagalog-Filipino','Tajik','Tamil','Thai','Tibetan','Tigrinya','Tongan','Turkish','Turkmen','Ucrainian','Urdu','Uzbek'
                          'Vietnamese','Welsh'];

//for Countries
List<dynamic> Countries = ['Afghanistan','Albania','Algeria','Andorra','Angola','Antigua','Barbuda','Argentina','Armenia','Australia','Austria','Azerbaijan',
                          'The Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bhutan','Bolivia','Bosnia','Herzegovina',
                          'Botswana','Brazil','Brunei','Bulgaria','Burkina Faso','Burundi','Cabo Verde','Cambodia','Cameroon','Canada','Central African Republic',
                          'Chad','Chile','China','Colombia','Comoros','Democratic Republic of the Congo','Republic of the Congo','Costa Rica','Côte d’Ivoire',
                          'Croatia','Cuba','Cyprus','Czech Republic','Denmark','Djibouti','Dominica','Dominican Republic','East Timor (Timor-Leste)','Ecuador',
                          'Egypt','El Salvador','Equatorial Guinea','Eritrea','Estonia','Eswatini','Ethiopia','Fiji','Finland','France',
                          'Gabon','The Gambia','Georgia','Germany','Ghana','Greece','Grenada','Guatemala','Guinea','Guinea-Bissau','Guyana',
                          'Haiti','Honduras','Hungary','Iceland','India','Indonesia','Iran','Iraq','Ireland','Italy','Jamaica','Japan','Jordan',
                          'Kazakhstan','Kenya','Kiribati','North Korea','South Korea','Kosovo','Kuwait','Kyrgyzstan','Laos','Latvia','Lebanon','Lesotho','Liberia',
                          'Libya','Liechtenstein','Lithuania','Luxembourg','Madagascar','Malawi','Malaysia','Maldives','Mali','Malta','Marshall Islands','Mauritania',
                          'Mauritius','Mexico','Federated States of Micronesia','Moldova','Monaco','Mongolia','Montenegro','Morocco','Mozambique','Myanmar (Burma)',
                          'Namibia','Nauru','Nepal','Netherlands','New Zealand','Nicaragua','Niger','Nigeria','North Macedonia','Norway','Oman',
                          'Pakistan','Palau','Panama','Papua New Guinea','Paraguay','Peru','Philippines','Poland','Portugal','Qatar','Romania','Russia','Rwanda',
                          'Saint Kitts and Nevis','Saint Lucia','Saint Vincent and the Grenadines','Samoa,San Marino','Sao Tome and Principe','Saudi Arabia','Senegal',
                          'Serbia','Seychelles','Sierra Leone','Singapore','Slovakia','Slovenia','Solomon Islands','Somalia','South Africa','Spain','Sri Lanka',
                          'Sudan','South Sudan','Suriname','Sweden','Switzerland','Syria','Taiwan','Tajikistan','Tanzania','Thailand','Togo','Tonga',
                          'Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Tuvalu','Uganda','Ukraine','United Arab Emirates','United Kingdom',
                          'United States','Uruguay','Uzbekistan','Vanuatu','Vatican City','Venezuela','Vietnam','Yemen','Zambia','Zimbabwe'];

//Date Of Birth registration
String? dateOfBirth;

//for type,language,level
String? type;
String? language;
String? level;

//for 6 digit code
String? sixCodeNb;

//ForgetPassword
// String? emailForgetPass;
// String? newPassword;
// String? newPassword2;

//myDrawer
bool isLoading = false;