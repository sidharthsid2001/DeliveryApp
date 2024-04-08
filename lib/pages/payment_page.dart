import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food/components/my_button.dart';
import 'package:food/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  //user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //only show dialog if form is valid
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Confirm the payment'),
                content: SingleChildScrollView(
                    child: ListBody(
                  children: [
                    Text('Card Number : $cardNumber'),
                    Text('Expiry Date : $expiryDate'),
                    Text('Card Holder name : $cardHolderName'),
                    Text('CVV : $cvvCode'),
                  ],
                )),
                actions: [
                  //cancel button
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  //yes
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeliveryProgressPage()));
                      },
                      child: Text('Yes')),
                ],
              ));
    }
  }

  void onCreditCardWidgetChange(String cardNumber, String expiryDate,
      String cardHolderName, String cvvCode, bool isCvvFocused) {
    setState(() {
      this.cardNumber = cardNumber;
      this.expiryDate = expiryDate;
      this.cardHolderName = cardHolderName;
      this.cvvCode = cvvCode;
      this.isCvvFocused = isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              //credit card
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (p0) {},
              ),
              //credit card form
              CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                    isCvvFocused = data.isCvvFocused;
                  });
                },
                formKey: formKey,
              ),
              const Spacer(),
              MyButton(text: 'Pay Now', onTap: userTappedPay),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
