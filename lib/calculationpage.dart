import 'package:flutter/material.dart';
import 'package:validator_emi_calculator/logic.dart';

class CalulatePage extends StatefulWidget {
  @override
  _CalulatePageState createState() => _CalulatePageState();
}

class _CalulatePageState extends State<CalulatePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  EmiCalculation ans;
  String emi = "0";
  double _amountSlider = 100000;
  double _rateSlider = 1;
  double _durationSlider = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Container(
          width: 250,
          child: Drawer(
            child: Container(
              color: Colors.indigo,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          "EMI CALCULATOR",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.indigo,
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                image: NetworkImage(
                    "https://is1-3.housingcdn.com/4f2250e8/be4a9354214138cc131480eeb52e97b8/v0/fs/riddhi_yash_icon-raysan_gandhinagar_district-gandhinagar-riddhi_developer.jpeg"),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your loan EMI is",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Text(
                  ("₹${emi.toString()}"),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                Text("per month",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 250, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(25),
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Loan Amount",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 18),
                          ),
                          Container(
                            width: 100,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "100000",
                              ),
                              onChanged: (val) {
                                setState(() {
                                  if (double.parse(val).roundToDouble() >=
                                          100000.00 &&
                                      double.parse(val).roundToDouble() <=
                                          10100000)
                                    _amountSlider =
                                        double.parse(val).roundToDouble();
                                  else
                                    _amountSlider = 100000;
                                });
                              },
                              keyboardType: TextInputType.number,
                              controller: _amountController,
                              style: TextStyle(
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Slider(
                            min: 100000,
                            max: 10100000,
                            divisions: 100,
                            value: _amountSlider,
                            inactiveColor: Colors.grey,
                            onChanged: (val) {
                              setState(() {
                                _amountSlider = val;
                                _amountController.text = val.toInt().toString();
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "1,00,000",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 135),
                              Text(
                                "1,01,00,000",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Interest Rate",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 18),
                          ),
                          Container(
                            width: 55,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "1",
                                suffix: Text("%"),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  if (double.parse(val).roundToDouble() >= 1 &&
                                      double.parse(val).roundToDouble() <= 16)
                                    _rateSlider =
                                        double.parse(val).roundToDouble();
                                  else
                                    _rateSlider = 1;
                                });
                              },
                              keyboardType: TextInputType.number,
                              controller: _rateController,
                              style: TextStyle(
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Slider(
                            min: 1,
                            max: 16,
                            divisions: 15,
                            value: _rateSlider,
                            inactiveColor: Colors.grey,
                            onChanged: (val) {
                              setState(() {
                                _rateSlider = val;
                                _rateController.text = val.toInt().toString();
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "1%",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 240),
                              Text(
                                "16%",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Loan Tenure",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 18),
                          ),
                          Container(
                            width: 100,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "10",
                                suffix: Text("years"),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  if (double.parse(val).roundToDouble() >= 10 &&
                                      double.parse(val).roundToDouble() <= 20)
                                    _durationSlider =
                                        double.parse(val).roundToDouble();
                                  else
                                    _durationSlider = 10;
                                });
                              },
                              keyboardType: TextInputType.number,
                              controller: _durationController,
                              style: TextStyle(
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Slider(
                            min: 10,
                            max: 20,
                            divisions: 10,
                            value: _durationSlider,
                            inactiveColor: Colors.grey,
                            onChanged: (val) {
                              setState(() {
                                _durationSlider = val;
                                _durationController.text =
                                    val.toInt().toString();
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "10",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 240),
                              Text(
                                "20",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _amountController.text =
                                _amountSlider.toInt().toString();
                            _rateController.text =
                                _rateSlider.toInt().toString();
                            _durationController.text =
                                _durationSlider.toInt().toString();
                            ans = EmiCalculation(
                              amount: double.parse(_amountController.text),
                              duration: double.parse(_durationController.text),
                              rate: double.parse(_rateController.text),
                            );
                            emi = ans.getEmi();
                          });
                          Navigator.of(context)
                              .pushNamed('second/', arguments: emi);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "Calculate",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
