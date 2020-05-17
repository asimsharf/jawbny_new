import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

File jsonFile;
Directory dir;
String fileName = "userJSON.json";
bool fileExists = false;
Map<dynamic, dynamic> fileContent;


String name='';
String email='';
String mobile='';
String dob='';
String address='';
String role='';
String nameInitial='';
String message='';
String fullData='';
// ignore: non_constant_identifier_names
String created_at='';
String activePlan='';
String activeStatus='';
String expiryDate='';
String subscriptionHistory='';
String subNamesHistory='';


var status;
var movieDataLength;
var menuDataListLength;
bool boolValue;
SharedPreferences prefs;
DateTime currentDate;

//  For user profile, plan subscription details and payment history details.
var userId;
var dataUser;
var userDetail;
var userName;
var userEmail;
var userMobile;
var userDOB;
var userImage;
var userCreatedAt;
var userActivePlan;
var userPaypalHistory;
var userStripeHistory;
var userActiveStatus;
var userExpiryDate;
var userSubscriptionHistory;
var userSubNamesHistory;
var userPlanStart;
var userPlanEnd;
var userPaymentType;
var userPaypalPayId;
var stripeCustomerId;
var difference;
var faqApiData;
var userProfileApiData;
var dateDiff;
var remainingDays;

//  For slider, movies and tv series
var sliderResponseData;
var mainData;
var topMData;
var showPaymentGateway;
var menuList;
var menuId;
var newVideosList1;
var newVideosListG;
var newVideosTM;
var episodesList;
var code;
var seasonEpisodeData;
var checkConnectionStatus;


//  For payment gateways stripe, braintree and paystack
var ser;
var stripePayment;
var stripeData;
var stripeKey;
var stripePass;
var paypalPayment;
var payuPayment;
var paytmPayment;
var paystackPayment;
var braintreePayment;
var btreePayment;
var bankPayment;
var braintreeClientNonce;
var payStackKey;
var menuDataResponse;
var showWatchlist;
var genreId;
var userWatchListOld;
var homeApiResponseData;
var loginImageData;
var loginConfigData;
var homeDataBlocks;
var faqHelp;
var blogResponse;
var commentsCount;
var blogComments;
var subComments;
var subCommentsCount;
var homeDataResponseDetails;
var accountNo;
var branchName;
var bankAccountName;
var bankIFSCCode;
var bankName;
var wEmail;
var donationUrl;
var tvSeriesArray;
var moviesArray;
var isAdmin;
var playerTitle;
var iFrameURL;
var videoLink;
var iReadyUrl;
var blogStatus;
var fbLoginStatus;
var videoCommentsStatus;
var donationStatus;


//  Used for movies, slider and genres
List movieData;
List genreData;
List mDataCount;
List sliderData;
List topMenuData;
List menuDataArray;

List allDataList= new List();
List newL = new List();


//  Used for search page
List searchIds = new List();
List searchIds2 = new List();


//  Used for watchlist page
List userWatchList = new List();

Color greenPrime = const Color.fromRGBO( 125, 183, 91, 1.0);
Color bluePrime = const Color.fromRGBO( 72, 163, 198, 1.0);
Color primaryColor= const Color.fromRGBO( 34, 34, 34, 1.0);
Color primaryDarkColor= const Color.fromRGBO( 20, 20, 20, 1.0);
Color blackColor= const Color.fromRGBO( 0, 0, 0, 1.0);
Color cardColor= const Color.fromRGBO( 90, 90, 90, 1.0);
Color textColor= const Color.fromRGBO( 30, 30, 30, 1.0);
Color whiteColor= const Color.fromRGBO(255, 255, 255, 1.0);