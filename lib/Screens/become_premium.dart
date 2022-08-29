import 'dart:convert';
import 'dart:io';
import 'package:anmor_garbh_sanskar/Widgets/circular.dart';
import 'package:anmor_garbh_sanskar/constants/pallete.dart';
import 'package:anmor_garbh_sanskar/model/planModel.dart';
import 'package:anmor_garbh_sanskar/services/Rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BecomePremiumPage extends StatefulWidget {
  const BecomePremiumPage({Key? key}) : super(key: key);

  @override
  State<BecomePremiumPage> createState() => _BecomePremiumPageState();
}

class _BecomePremiumPageState extends State<BecomePremiumPage> {
  late Razorpay _razorpay;

  final List<PlanModel> _plans = <PlanModel>[];
  String planeId = '';
  String planAmount = '';

  Future<List<PlanModel>> _fetchPlans() async {
    _plans.clear();
    final response = await http
        .get(Uri.parse("https://apis.bhavishashah.com/api/get-plans"));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          jsonData['data'].forEach((v) {
            _plans.add(PlanModel.fromJson(v));
          });
        }
      }
    } on SocketException {
      Fluttertoast.showToast(msg: 'No Internet Connection');
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
    return _plans;
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }


  Future<void> generate_ODID(int amount) async {
    var orderOptions = {
      'amount': int.parse(amount.toString()) * 100,  // amount in the smallest currency unit
      'currency': "INR",
      'receipt': "order_rcptid_11"
    };
    final client = HttpClient();
    final request = await client.postUrl(Uri.parse('https://api.razorpay.com/v1/orders'));
    request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('${'rzp_live_JbVKaw0pMVE3YY'}:${'LhWE35BsLHIL9TE33EJ34FNK'}'));
    request.headers.set(HttpHeaders.authorizationHeader, basicAuth);
    request.add(utf8.encode(json.encode(orderOptions)));
    final response = await request.close();
    response.transform(utf8.decoder).listen((contents) {
      String orderId = contents.split(',')[0].split(":")[1];
      orderId = orderId.substring(1, orderId.length - 1);
      Fluttertoast.showToast(msg: "ORDERID: " +orderId, toastLength: Toast.LENGTH_SHORT);
      Map<String, dynamic> checkoutOptions = {
        'key': 'rzp_live_JbVKaw0pMVE3YY',
        'name': 'Demo',
        'order_id' : orderId,
        'description': 'Fssai Registrtion Charge',
        'prefill': {'contact': '8910407549', 'email': 'xx.xx@gmail.com'},
        'external': {
          'wallets': ['paytm']
        }
      };
      try {
        _razorpay.open(checkoutOptions);
      } catch (e) {
        print(e.toString());
      }
    });
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Map<String,String> body = {
      'plan_id': planeId,
      'amount': planAmount,
      'payment_id': response.paymentId!,
      'reference_id': '',
      'payment_status': 'success'
    };

    RestApi.paymentSuccess(body);
    // print('Success Response: ${response.paymentId}');
    // /*Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId!,
    //     toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: 'Payment Cancel');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName!, toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.becomePremium,),
      ),
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _plans.length,
                  itemBuilder: (context, index) {
                    var item = _plans[index];
                    return SizedBox(
                      height: 0.3.sh,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25))),
                              width: double.infinity,
                              height: 35,
                              child:  Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppLocalizations.of(context)!.packageName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Palette.bottombarcolor,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(25),
                                        bottomLeft: Radius.circular(25))),
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${item.title}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    Text(
                                      '\u{20B9}${(int.parse(item.price!) + 200).toString()}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    Text(
                                      '\u{20B9}${item.price}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.lightGreen),
                                          elevation:
                                              MaterialStateProperty.all(20),
                                          //Defines Elevation
                                          shadowColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                        ),
                                        onPressed: (){
                                          planeId = item.id.toString();
                                          planAmount = item.price.toString();
                                          generate_ODID(int.parse(item.price.toString()));
                                          setState((){});
                                        },
                                        child:  Text(AppLocalizations.of(context)!.buyNow,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularIndicator(
                  height: 0.75,
                ),
              );
            }
          },
          future: _fetchPlans()),
    );
  }
}
