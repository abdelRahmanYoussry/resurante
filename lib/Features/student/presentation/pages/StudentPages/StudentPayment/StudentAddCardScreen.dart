// ignore_for_file: file_names, prefer_const_constructors_in_immutables, unused_field, unused_element, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hassy/core/utils/shared/app/assets_manager.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../widgets/InputFormatter.dart';
import '../../../widgets/PaymentCardWidget.dart';

class StudentAddCardScreen extends StatefulWidget {
  StudentAddCardScreen({Key? key}) : super(key: key);

  @override
  State<StudentAddCardScreen> createState() => _StudentAddCardScreenState();
}

class _StudentAddCardScreenState extends State<StudentAddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  var numberController = TextEditingController();
  final _paymentCard = PaymentCard();
  final _card = PaymentCard();
  @override
  void initState() {
    super.initState();
    _paymentCard.type = CardType.Others;
    numberController.addListener(_getCardTypeFrmNumber);
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      _paymentCard.type = cardType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          mycolor: ColorManager.mainPrimaryColor4,
          isLeading: true,
          toolBarHeight: myMediaQuery(context: context).height / 14,
          title: Text(
            LocaleKeys.addCardButtonText.tr(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorManager.mainPrimaryColor4, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 3),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(
                        color: ColorManager.textFormBorderColor,
                        fontSize: FontSize.size16,
                      ),
                      labelStyle: TextStyle(
                        color: ColorManager.textFormBorderColor,
                        fontSize: FontSize.size16,
                      ),
                      filled: true,
                      icon: Icon(
                        Icons.person_outline_sharp,
                        size: 40.0,
                        color: ColorManager.mainPrimaryColor4,
                      ),
                      hintText: LocaleKeys.cardUserNameHintText.tr(),
                      labelText: LocaleKeys.userNameLabelAndHint.tr(),
                    ),
                    onSaved: (String? value) {
                      _card.name = value;
                    },
                    keyboardType: TextInputType.text,
                    validator: (String? value) =>
                        value!.isEmpty ? LocaleKeys.fieldReq.tr() : null,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      CardNumberInputFormatter()
                    ],
                    controller: numberController,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorManager.mainPrimaryColor4, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 3),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        color: ColorManager.textFormBorderColor,
                        fontSize: FontSize.size16,
                      ),
                      labelStyle: TextStyle(
                        color: ColorManager.textFormBorderColor,
                        fontSize: FontSize.size16,
                      ),
                      icon: CardUtils.getCardIcon(_paymentCard.type),
                      hintText: LocaleKeys.cardNumberLabelText.tr(),
                      labelText: LocaleKeys.cardNumberHintAndLabelText.tr(),
                    ),
                    onSaved: (String? value) {
                      _paymentCard.number = CardUtils.getCleanedNumber(value!);
                    },
                    validator: CardUtils.validateCardNum,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: myMediaQuery(context: context).width / 3,
                        height: 100,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager.mainPrimaryColor4,
                                    width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 3),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintStyle: TextStyle(
                              color: ColorManager.textFormBorderColor,
                              fontSize: FontSize.size16,
                            ),
                            labelStyle: TextStyle(
                              color: ColorManager.textFormBorderColor,
                              fontSize: FontSize.size16,
                            ),
                            filled: true,
                            icon: Image.asset(
                              ImageAssets.cardCvvPay,
                              width: 40.0,
                              color: ColorManager.mainPrimaryColor4,
                            ),
                            hintText: LocaleKeys.cvvCardNumberHintText.tr(),
                            labelText: 'CVV',
                          ),
                          validator: CardUtils.validateCVV,
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            _paymentCard.cvv = int.parse(value!);
                          },
                        ),
                      ),
                      SizedBox(
                        width: myMediaQuery(context: context).width / 1.80,
                        height: 100,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardMonthInputFormatter()
                          ],
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager.mainPrimaryColor4,
                                    width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 3),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintStyle: TextStyle(
                              color: ColorManager.textFormBorderColor,
                              fontSize: FontSize.size16,
                            ),
                            labelStyle: TextStyle(
                              color: ColorManager.textFormBorderColor,
                              fontSize: FontSize.size16,
                            ),
                            filled: true,
                            icon: Image.asset(
                              ImageAssets.calender,
                              width: 40.0,
                              color: ColorManager.mainPrimaryColor4,
                            ),
                            hintText: 'MM/YY',
                            labelText: LocaleKeys.expiryDate.tr(),
                          ),
                          validator: CardUtils.validateDate,
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            List<int> expiryDate =
                                CardUtils.getExpiryDate(value!);
                            _paymentCard.month = expiryDate[0];
                            _paymentCard.year = expiryDate[1];
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  MyElevatedButton(
                    height: myMediaQuery(context: context).height / 10,
                    width: 150,
                    radius: 20,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint('ali');
                        Navigator.pop(context);
                      }
                    },
                    buttonName: LocaleKeys.addCardButtonText.tr(),
                    buttonColor: ColorManager.mainPrimaryColor4,
                    borderColor: ColorManager.mainPrimaryColor4,
                    borderWidth: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
