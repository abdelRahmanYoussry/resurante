// ignore_for_file: file_names, must_be_immutable, unrelated_type_equality_checks, deprecated_member_use

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hassy/Features/student/presentation/manager/student_profile_cubit/student_profile_cubit.dart';
import 'package:hassy/core/utils/shared/widgets/my_custom_divider_size_10.dart';
import 'package:hassy/core/utils/shared/widgets/textButton.dart';
import 'package:hassy/core/utils/shared/widgets/textFormfield.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../../../../core/utils/shared/app/assets_manager.dart';
import '../../../../../../core/utils/shared/app/color_manager.dart';
import '../../../../../../core/utils/shared/app/font_manager.dart';
import '../../../../../../core/utils/shared/app/styles_manager.dart';
import '../../../../../../core/utils/shared/components/components.dart';
import '../../../../../../core/utils/shared/translations/locale_keys.g.dart';
import '../../../../../../core/utils/shared/widgets/CustomDropDown.dart';
import '../../../../../../core/utils/shared/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/shared/widgets/elevatedButton.dart';
import '../../../widgets/InputFormatter.dart';
import '../../../widgets/PaymentCardWidget.dart';
import '../../../widgets/class_compelete_reserv_widget.dart';

class StudentPaymentScreen extends StatelessWidget {
  StudentPaymentScreen({Key? key}) : super(key: key);
  final SingleValueDropDownController paymentMethodsController =
      SingleValueDropDownController();
  final SingleValueDropDownController visaCardController =
      SingleValueDropDownController();
  final _paymentCard = PaymentCard();
  final _card = PaymentCard();
  var numberController = TextEditingController();

  List<DropDownValueModel> paymentList = [
    DropDownValueModel(
        name: LocaleKeys.paymentUponAttendanceText.tr(), value: '1'),
    DropDownValueModel(name: LocaleKeys.payWithVisaCard.tr(), value: '2'),
  ];
  final cardNumberController = TextEditingController();
  final userNameController = TextEditingController();
  final cbvController = TextEditingController();
  final expirationController = TextEditingController();
  final promoCodeController = TextEditingController();

  List<DropDownValueModel> visaCardNumberList = [
    const DropDownValueModel(name: '1236598745888', value: '1'),
    const DropDownValueModel(name: '2569887788964', value: '2'),
    const DropDownValueModel(name: '8888888888888', value: '2'),
    const DropDownValueModel(name: '1454587655422', value: '2'),
    const DropDownValueModel(name: '5698977455777', value: '2'),
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = StudentProfileCubit.get(context);
    cubit.isAddCard = false;
    return BlocConsumer<StudentProfileCubit, StudentProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                LocaleKeys.paymentScreenText.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const MyCustomDividerSize10(),
                      ClassesReserveDetailsWidget(
                        classTitleString:
                            '${LocaleKeys.lessonPriceHintAndLabelText.tr()} :',
                        maxTextLines: 2,
                        classNoteString: '300 EGP',
                        classNoteColor: ColorManager.mainPrimaryColor4,
                      ),
                      const MyCustomDividerSize10(),
                      ClassesReserveDetailsWidget(
                        classTitleString:
                            '${LocaleKeys.servicesAndConsumption.tr()} :',
                        maxTextLines: 2,
                        classNoteString: '300 EGP',
                        classNoteColor: ColorManager.mainPrimaryColor4,
                      ),
                      const MyCustomDividerSize10(),
                      ClassesReserveDetailsWidget(
                        classTitleString: '${LocaleKeys.theNetPrice.tr()} :',
                        maxTextLines: 2,
                        classNoteString: '270 EGP',
                        classNoteColor: ColorManager.mainPrimaryColor4,
                      ),
                      const MyCustomDividerSize10(),
                      Row(
                        children: [
                          Expanded(
                            child: MyTextFormField(
                              readOnly: false,
                              onTap: () {},
                              label: LocaleKeys.classPromoCodeText.tr(),
                              control: promoCodeController,
                              type: TextInputType.text,
                              isPassword: false,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MyElevatedButton(
                              width: 100,
                              radius: 20,
                              height: 50,
                              onTap: () {},
                              buttonName: LocaleKeys.applyText.tr(),
                              buttonColor: ColorManager.mainPrimaryColor4,
                              borderColor: ColorManager.mainPrimaryColor4,
                              borderWidth: 1)
                        ],
                      ),
                      const MyCustomDividerSize10(),
                      MyCustomDropDown(
                        isAutoValid: AutovalidateMode.onUserInteraction,
                        enableSearch: false,
                        enableDropDown: true,
                        dropDownValueList: paymentList,
                        controller: paymentMethodsController,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.payMentMethodErrorText.tr();
                          } else {
                            cubit.changePayMethod(value: value);
                          }
                          return null;
                        },
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(LocaleKeys.selectPaymentMethods.tr()),
                        ),
                      ),
                      const MyCustomDividerSize10(),
                      cubit.visaPayment == LocaleKeys.payWithVisaCard.tr() &&
                              paymentMethodsController.dropDownValue?.value !=
                                  null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyCustomDropDown(
                                    isAutoValid:
                                        AutovalidateMode.onUserInteraction,
                                    enableSearch: false,
                                    enableDropDown: true,
                                    dropDownValueList: visaCardNumberList,
                                    controller: visaCardController,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return LocaleKeys.cardNumberErrorText
                                            .tr();
                                      }
                                      return null;
                                    },
                                    label: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          LocaleKeys.visaCardNumbersText.tr()),
                                    )),
                                MyTextButton(
                                  text: LocaleKeys.addCardButtonText.tr(),
                                  function: () {
                                    showBottomSheet(context: context);
                                    // navigateTo(context,
                                    //     routeName: Routes.studentAddCardRoute);
                                  },
                                  width: 120,
                                  textColor: ColorManager.mainPrimaryColor4,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const MyCustomDividerSize10(),
                      MyElevatedButton(
                        height: myMediaQuery(context: context).height / 10,
                        width: double.infinity,
                        radius: 20,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                        '${LocaleKeys.classCodeDetailsText.tr()} Is',
                                        style: getBoldStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          fontSize: FontSize.size18,
                                        ),
                                      ),
                                      content: Text(
                                        '256987521',
                                        style: getBoldStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          fontSize: FontSize.size18,
                                        ),
                                      ),
                                      // actions: [
                                      //   const MyCustomDividerSize10(),
                                      //   Container(
                                      //     // padding: const EdgeInsets.all(20.0),
                                      //     decoration: BoxDecoration(
                                      //       border: Border.all(
                                      //         color: ColorManager.white,
                                      //         width: AppSize.size3,
                                      //       ),
                                      //       borderRadius: BorderRadius.circular(
                                      //         AppSize.size10,
                                      //       ),
                                      //     ),
                                      //
                                      //     child: Column(
                                      //       mainAxisAlignment:
                                      //           MainAxisAlignment.center,
                                      //       children: [
                                      //         Text(
                                      //           '256987521',
                                      //           style: getBoldStyle(
                                      //             color: ColorManager.white,
                                      //             fontSize: FontSize.size18,
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ],
                                      // child: Container(
                                      //       height: myMediaQuery(context: context)
                                      //               .height /
                                      //           10,
                                      //       width: double.infinity / 2,
                                      //       padding: const EdgeInsets.all(15.0),
                                      //       decoration: BoxDecoration(
                                      //         color: ColorManager.mainPrimaryColor4,
                                      //         borderRadius: BorderRadius.circular(
                                      //           AppSize.size10,
                                      //         ),
                                      //       ),
                                      //       child: Padding(
                                      //         padding: const EdgeInsets.all(12.0),
                                      //         child: Column(
                                      //           children: [
                                      //             Text(
                                      //               '${LocaleKeys.classCodeDetailsText.tr()} Is',
                                      //               style: getBoldStyle(
                                      //                 color: ColorManager.white,
                                      //                 fontSize: FontSize.size18,
                                      //               ),
                                      //             ),
                                      //             const MyCustomDividerSize10(),
                                      //             Container(
                                      //               padding:
                                      //                   const EdgeInsets.all(20.0),
                                      //               decoration: BoxDecoration(
                                      //                 border: Border.all(
                                      //                   color: ColorManager.white,
                                      //                   width: AppSize.size3,
                                      //                 ),
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(
                                      //                   AppSize.size10,
                                      //                 ),
                                      //               ),
                                      //               height:
                                      //                   myMediaQuery(context: context)
                                      //                           .height /
                                      //                       10,
                                      //               width: 150,
                                      //               child: Column(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment.center,
                                      //                 children: [
                                      //                   Text(
                                      //                     '256987521',
                                      //                     style: getBoldStyle(
                                      //                       color: ColorManager.white,
                                      //                       fontSize: FontSize.size18,
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                    ));
                            // navigateTo(context,
                            //     routeName: Routes.studentClassCodeRoute);
                          }
                        },
                        buttonName: LocaleKeys.classConfirmReserveText.tr(),
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
      },
    );
  }

  showBottomSheet({required BuildContext context}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
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
        );
      },
    );
  }
}
