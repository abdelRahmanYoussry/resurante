// import 'dart:math';
// import 'dart:ui' as ui;
//
// import 'package:flutter/material.dart';
// import 'package:resturente/core/utils/shared/app/constant_manager.dart';
//
//
// const Map<CardType, String> CardTypeIconAsset = <CardType, String>{
//   CardType.visa: 'icons/visa.png',
//   CardType.rupay: 'icons/rupay.png',
//   CardType.americanExpress: 'icons/amex.png',
//   CardType.mastercard: 'icons/mastercard.png',
//   CardType.unionpay: 'icons/unionpay.png',
//   CardType.discover: 'icons/discover.png',
//   CardType.elo: 'icons/elo.png',
//   CardType.hipercard: 'icons/hipercard.png',
// };
//
// class NewCreditCardWidget extends StatefulWidget {
//   /// A widget showcasing credit card UI.
//   const NewCreditCardWidget({
//     Key? key,
//     required this.cardNumber,
//     required this.expiryDate,
//     required this.cardHolderName,
//     required this.cvvCode,
//     required this.showBackView,
//     this.bankName,
//     this.animationDuration = const Duration(milliseconds: 500),
//     this.height,
//     this.width,
//     this.textStyle,
//     this.cardBgColor = const Color(0xff1b447b),
//     this.obscureCardNumber = true,
//     this.obscureCardCvv = true,
//     this.labelCardHolder = 'CARD HOLDER',
//     this.labelExpiredDate = 'MM/YY',
//     this.labelValidThru = '',
//     this.cardType,
//     this.isHolderNameVisible = false,
//     this.backgroundImage,
//     this.backgroundNetworkImage,
//     this.isChipVisible = true,
//     this.isSwipeGestureEnabled = true,
//     this.padding = 10,
//     this.chipColor,
//     this.frontCardBorder,
//     this.backCardBorder,
//     this.obscureInitialCardNumber = false,
//     required this.customCardTypeIcons,
//   }) : super(key: key);
//
//   /// A string indicating number on the card.
//   final String cardNumber;
//
//   /// A string indicating expiry date for the card.
//   final String expiryDate;
//
//   /// A string indicating name of the card holder.
//   final String cardHolderName;
//
//   /// A String indicating cvv code.
//   final String cvvCode;
//
//   /// Applies text style to cardNumber, expiryDate, cardHolderName and cvvCode.
//   final TextStyle? textStyle;
//
//   /// Applies background color for card UI.
//   final Color cardBgColor;
//
//   /// Shows back side of the card at initial level when setting it to true.
//   /// This is helpful when focusing on cvv.
//   final bool showBackView;
//
//   /// A string indicating name of the bank.
//   final String? bankName;
//
//   /// Duration for flip animation. Defaults to 500 milliseconds.
//   final Duration animationDuration;
//
//   /// Sets height of the front and back side of the card.
//   final double? height;
//
//   /// Sets width of the front and back side of the card.
//   final double? width;
//
//   /// If this flag is enabled then card number is replaced with obscuring
//   /// characters to hide the content. Initial 4 and last 4 character
//   /// doesn't get obscured. Defaults to true.
//   final bool obscureCardNumber;
//
//   /// Also obscures initial 4 card numbers with obscuring characters. This
//   /// flag requires [obscureCardNumber] to be true. This flag defaults to false.
//   final bool obscureInitialCardNumber;
//
//   /// If this flag is enabled then cvv is replaced with obscuring characters
//   /// to hide the content. Defaults to true.
//   final bool obscureCardCvv;
//
//   /// Enable/disable card holder name. Defaults to false.
//   final bool isHolderNameVisible;
//
//   /// Shows image as background of the card widget. This should be available
//   /// locally in your assets folder.
//   final String? backgroundImage;
//
//   /// Shows image as background of the card widget from the network.
//   final String? backgroundNetworkImage;
//
//   /// Provides color to EMV chip on the card.
//   final Color? chipColor;
//
//   /// Enable/disable showcasing EMV chip UI. Defaults to true.
//   final bool isChipVisible;
//
//   /// Enable/disable gestures on credit card widget. If enabled then flip
//   /// animation is started when swiped or tapped. Defaults to true.
//   final bool isSwipeGestureEnabled;
//
//   /// Default label for card holder name. This is shown when user hasn't
//   /// entered any text for card holder name.
//   final String labelCardHolder;
//
//   /// Default label for expiry date. This is shown when user hasn't entered any
//   /// text for expiry date.
//   final String labelExpiredDate;
//
//   /// Default label for valid thru. This is shown when user hasn't entered any
//   /// text for valid thru.
//   final String labelValidThru;
//
//   /// Sets type of the card. An small image is shown based on selected type
//   /// of the card at bottom right corner. If this is set to null then image
//   /// shown automatically based on credit card number.
//   final CardType? cardType;
//
//   /// Replaces credit card image with provided widget.
//   final List<CustomCardTypeIcon> customCardTypeIcons;
//
//   /// Provides equal padding inside the credit card widget in all directions.
//   /// Defaults to 16.
//   final double padding;
//
//   /// Provides border in front of credit card widget.
//   final BoxBorder? frontCardBorder;
//
//   /// Provides border at back of credit card widget.
//   final BoxBorder? backCardBorder;
//
//   @override
//   _NewCreditCardWidgetState createState() => _NewCreditCardWidgetState();
// }
//
// class _NewCreditCardWidgetState extends State<NewCreditCardWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> _frontRotation;
//   late Animation<double> _backRotation;
//   late Gradient backgroundGradientColor;
//   late bool isFrontVisible = true;
//   late bool isGestureUpdate = false;
//
//   bool isAmex = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     ///initialize the animation controller
//     controller = AnimationController(
//       duration: widget.animationDuration,
//       vsync: this,
//     );
//
//     _gradientSetup();
//     _updateRotations(false);
//   }
//
//   @override
//   void didUpdateWidget(covariant NewCreditCardWidget oldWidget) {
//     if (widget.cardBgColor != oldWidget.cardBgColor) {
//       _gradientSetup();
//     }
//     super.didUpdateWidget(oldWidget);
//   }
//
//   void _gradientSetup() {
//     backgroundGradientColor = LinearGradient(
//       // Where the linear gradient begins and ends
//       begin: Alignment.topRight,
//       end: Alignment.bottomLeft,
//       // Add one stop for each color. Stops should increase from 0 to 1
//       stops: const <double>[0.1, 0.4, 0.7, 0.9],
//       colors: <Color>[
//         widget.cardBgColor.withOpacity(1),
//         widget.cardBgColor.withOpacity(0.97),
//         widget.cardBgColor.withOpacity(0.90),
//         widget.cardBgColor.withOpacity(0.86),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!isGestureUpdate) {
//       _updateRotations(false);
//       if (widget.showBackView) {
//         controller.forward();
//       } else {
//         controller.reverse();
//       }
//     } else {
//       isGestureUpdate = false;
//     }
//
//     final CardType? cardType = widget.cardType != null
//         ? widget.cardType
//         : detectCCType(widget.cardNumber);
//     return Stack(
//       children: <Widget>[
//         _cardGesture(
//           child: AnimationCard(
//             animation: _frontRotation,
//             child: _buildFrontContainer(),
//           ),
//         ),
//         _cardGesture(
//           child: AnimationCard(
//             animation: _backRotation,
//             child: _buildBackContainer(),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _leftRotation() {
//     _toggleSide(false);
//   }
//
//   void _rightRotation() {
//     _toggleSide(true);
//   }
//
//   void _toggleSide(bool isRightTap) {
//     _updateRotations(!isRightTap);
//     if (isFrontVisible) {
//       controller.forward();
//       isFrontVisible = false;
//     } else {
//       controller.reverse();
//       isFrontVisible = true;
//     }
//   }
//
//   void _updateRotations(bool isRightSwipe) {
//     setState(() {
//       final bool rotateToLeft =
//           (isFrontVisible && !isRightSwipe) || !isFrontVisible && isRightSwipe;
//
//       ///Initialize the Front to back rotation tween sequence.
//       _frontRotation = TweenSequence<double>(
//         <TweenSequenceItem<double>>[
//           TweenSequenceItem<double>(
//             tween: Tween<double>(
//                     begin: 0.0, end: rotateToLeft ? (pi / 2) : (-pi / 2))
//                 .chain(CurveTween(curve: Curves.linear)),
//             weight: 50.0,
//           ),
//           TweenSequenceItem<double>(
//             tween: ConstantTween<double>(rotateToLeft ? (-pi / 2) : (pi / 2)),
//             weight: 50.0,
//           ),
//         ],
//       ).animate(controller);
//
//       ///Initialize the Back to Front rotation tween sequence.
//       _backRotation = TweenSequence<double>(
//         <TweenSequenceItem<double>>[
//           TweenSequenceItem<double>(
//             tween: ConstantTween<double>(rotateToLeft ? (pi / 2) : (-pi / 2)),
//             weight: 50.0,
//           ),
//           TweenSequenceItem<double>(
//             tween: Tween<double>(
//                     begin: rotateToLeft ? (-pi / 2) : (pi / 2), end: 0.0)
//                 .chain(
//               CurveTween(curve: Curves.linear),
//             ),
//             weight: 50.0,
//           ),
//         ],
//       ).animate(controller);
//     });
//   }
//
//   Widget _buildFrontContainer() {
//     final TextStyle defaultTextStyle =
//         Theme.of(context).textTheme.titleLarge!.merge(
//               const TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'halter',
//                 fontSize: 15,
//               ),
//             );
//
//     String number = widget.cardNumber;
//     if (widget.obscureCardNumber) {
//       final String stripped = number.replaceAll(RegExp(r'[^\d]'), '');
//       if (widget.obscureInitialCardNumber && stripped.length > 4) {
//         final String start = number
//             .substring(0, number.length - 5)
//             .trim()
//             .replaceAll(RegExp(r'\d'), '*');
//         number = start + ' ' + stripped.substring(stripped.length - 4);
//       } else if (stripped.length > 8) {
//         final String middle = number
//             .substring(4, number.length - 5)
//             .trim()
//             .replaceAll(RegExp(r'\d'), '*');
//         number = stripped.substring(0, 4) +
//             ' ' +
//             middle +
//             ' ' +
//             stripped.substring(stripped.length - 4);
//       }
//     }
//     return NewCardBackground(
//       backgroundImage: widget.backgroundImage,
//       backgroundNetworkImage: widget.backgroundNetworkImage,
//       backgroundGradientColor: backgroundGradientColor,
//       height: widget.height,
//       width: widget.width,
//       padding: widget.padding,
//       border: widget.frontCardBorder,
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 50.h,
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 16),
//                   child: Text(
//                     widget.cardNumber.isEmpty ? 'XXXX XXXX XXXX XXXX' : number,
//                     style: widget.textStyle ?? defaultTextStyle,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       widget.expiryDate.isEmpty
//                           ? widget.labelExpiredDate
//                           : widget.expiryDate,
//                       style: widget.textStyle ?? getRegularWhite14Style(),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Visibility(
//                     visible: widget.isHolderNameVisible,
//                     child: Expanded(
//                       child: Text(
//                         widget.cardHolderName.isEmpty
//                             ? widget.labelCardHolder
//                             : widget.cardHolderName,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: widget.textStyle ?? defaultTextStyle,
//                       ),
//                     ),
//                   ),
//                   widget.cardType != null
//                       ? getCardTypeImage(widget.cardType)
//                       : getCardTypeIcon(widget.cardNumber),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBackContainer() {
//     final TextStyle defaultTextStyle =
//         Theme.of(context).textTheme.titleLarge!.merge(
//               const TextStyle(
//                 color: Colors.black,
//                 fontFamily: 'halter',
//                 fontSize: 16,
//               ),
//             );
//
//     final String cvv = widget.obscureCardCvv
//         ? widget.cvvCode.replaceAll(RegExp(r'\d'), '*')
//         : widget.cvvCode;
//
//     return NewCardBackground(
//       backgroundImage: ImageAssets.creditCardBackgroundImage,
//       backgroundNetworkImage: widget.backgroundNetworkImage,
//       backgroundGradientColor: backgroundGradientColor,
//       height: widget.height,
//       width: widget.width,
//       padding: widget.padding,
//       border: widget.backCardBorder,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             flex: 2,
//             child: Container(
//               margin: const EdgeInsets.only(top: 16),
//               height: 48,
//               color: Colors.black,
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Container(
//               margin: const EdgeInsets.only(top: 16),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     flex: 9,
//                     child: Container(
//                       height: 48,
//                       color: Colors.white70,
//                     ),
//                   ),
//                   Expanded(
//                     flex: 3,
//                     child: Container(
//                       color: Colors.white,
//                       child: Padding(
//                         padding: const EdgeInsets.all(5),
//                         child: Text(
//                           widget.cvvCode.isEmpty
//                               ? isAmex
//                                   ? 'XXXX'
//                                   : 'XXX'
//                               : cvv,
//                           maxLines: 1,
//                           style: widget.textStyle ?? defaultTextStyle,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Align(
//               alignment: Alignment.bottomRight,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
//                 child: widget.cardType != null
//                     ? getCardTypeImage(widget.cardType)
//                     : getCardTypeIcon(widget.cardNumber),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _cardGesture({required Widget child}) {
//     bool isRightSwipe = true;
//     return widget.isSwipeGestureEnabled
//         ? GestureDetector(
//             onPanEnd: (_) {
//               isGestureUpdate = true;
//               if (isRightSwipe) {
//                 _leftRotation();
//               } else {
//                 _rightRotation();
//               }
//             },
//             onPanUpdate: (DragUpdateDetails details) {
//               // Swiping in right direction.
//               if (details.delta.dx > 0) {
//                 isRightSwipe = true;
//               }
//
//               // Swiping in left direction.
//               if (details.delta.dx < 0) {
//                 isRightSwipe = false;
//               }
//             },
//             child: child,
//           )
//         : child;
//   }
//
//   Map<CardType, Set<List<String>>> cardNumPatterns =
//       <CardType, Set<List<String>>>{
//     CardType.visa: <List<String>>{
//       <String>['4'],
//     },
//     CardType.rupay: <List<String>>{
//       <String>['60'],
//       <String>['6521'],
//       <String>['6522'],
//     },
//     CardType.americanExpress: <List<String>>{
//       <String>['34'],
//       <String>['37'],
//     },
//     CardType.unionpay: <List<String>>{
//       <String>['62'],
//     },
//     CardType.discover: <List<String>>{
//       <String>['6011'],
//       <String>['622126', '622925'], // China UnionPay co-branded
//       <String>['644', '649'],
//       <String>['65']
//     },
//     CardType.mastercard: <List<String>>{
//       <String>['51', '55'],
//       <String>['2221', '2229'],
//       <String>['223', '229'],
//       <String>['23', '26'],
//       <String>['270', '271'],
//       <String>['2720'],
//     },
//     CardType.elo: <List<String>>{
//       <String>['401178'],
//       <String>['401179'],
//       <String>['438935'],
//       <String>['457631'],
//       <String>['457632'],
//       <String>['431274'],
//       <String>['451416'],
//       <String>['457393'],
//       <String>['504175'],
//       <String>['506699', '506778'],
//       <String>['509000', '509999'],
//       <String>['627780'],
//       <String>['636297'],
//       <String>['636368'],
//       <String>['650031', '650033'],
//       <String>['650035', '650051'],
//       <String>['650405', '650439'],
//       <String>['650485', '650538'],
//       <String>['650541', '650598'],
//       <String>['650700', '650718'],
//       <String>['650720', '650727'],
//       <String>['650901', '650978'],
//       <String>['651652', '651679'],
//       <String>['655000', '655019'],
//       <String>['655021', '655058']
//     },
//     CardType.hipercard: <List<String>>{
//       <String>['606282'],
//     },
//   };
//   CardType detectCCType(String cardNumber) {
//     //Default card type is other
//     CardType cardType = CardType.otherBrand;
//
//     if (cardNumber.isEmpty) {
//       return cardType;
//     }
//
//     cardNumPatterns.forEach(
//       (CardType type, Set<List<String>> patterns) {
//         for (List<String> patternRange in patterns) {
//           // Remove any spaces
//           String ccPatternStr =
//               cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');
//           final int rangeLen = patternRange[0].length;
//           // Trim the Credit Card number string to match the pattern prefix length
//           if (rangeLen < cardNumber.length) {
//             ccPatternStr = ccPatternStr.substring(0, rangeLen);
//           }
//
//           if (patternRange.length > 1) {
//             // Convert the prefix range into numbers then make sure the
//             // Credit Card num is in the pattern range.
//             // Because Strings don't have '>=' type operators
//             final int ccPrefixAsInt = int.parse(ccPatternStr);
//             final int startPatternPrefixAsInt = int.parse(patternRange[0]);
//             final int endPatternPrefixAsInt = int.parse(patternRange[1]);
//             if (ccPrefixAsInt >= startPatternPrefixAsInt &&
//                 ccPrefixAsInt <= endPatternPrefixAsInt) {
//               // Found a match
//               cardType = type;
//               break;
//             }
//           } else {
//             // Just compare the single pattern prefix with the Credit Card prefix
//             if (ccPatternStr == patternRange[0]) {
//               // Found a match
//               cardType = type;
//               break;
//             }
//           }
//         }
//       },
//     );
//
//     return cardType;
//   }
//
//   Widget getCardTypeImage(CardType? cardType) {
//     final List<CustomCardTypeIcon> customCardTypeIcon =
//         getCustomCardTypeIcon(cardType!);
//     if (customCardTypeIcon.isNotEmpty) {
//       return customCardTypeIcon.first.cardImage;
//     } else {
//       return Image.asset(
//         CardTypeIconAsset[cardType]!,
//         height: 48,
//         width: 48,
//       );
//     }
//   }
//
//   Widget getCardTypeIcon(String cardNumber) {
//     Widget icon;
//     final CardType ccType = detectCCType(cardNumber);
//     final List<CustomCardTypeIcon> customCardTypeIcon =
//         getCustomCardTypeIcon(ccType);
//     if (customCardTypeIcon.isNotEmpty) {
//       icon = customCardTypeIcon.first.cardImage;
//       isAmex = ccType == CardType.americanExpress;
//     } else {
//       switch (ccType) {
//         case CardType.visa:
//         case CardType.rupay:
//         case CardType.unionpay:
//         case CardType.discover:
//         case CardType.mastercard:
//         case CardType.elo:
//         case CardType.hipercard:
//           icon = Image.asset(
//             CardTypeIconAsset[ccType]!,
//             height: 48,
//             width: 48,
//             package: 'flutter_credit_card',
//           );
//           isAmex = false;
//           break;
//
//         case CardType.americanExpress:
//           icon = Image.asset(
//             CardTypeIconAsset[ccType]!,
//             height: 48,
//             width: 48,
//             package: 'flutter_credit_card',
//           );
//           isAmex = true;
//           break;
//
//         default:
//           icon = Container(
//             height: 48,
//             width: 48,
//           );
//           isAmex = false;
//           break;
//       }
//     }
//
//     return icon;
//   }
//
//   List<CustomCardTypeIcon> getCustomCardTypeIcon(CardType currentCardType) =>
//       widget.customCardTypeIcons
//           .where((CustomCardTypeIcon element) =>
//               element.cardType == currentCardType)
//           .toList();
// }
//
// class MaskedTextController extends TextEditingController {
//   MaskedTextController(
//       {String? text, required this.mask, Map<String, RegExp>? translator})
//       : super(text: text) {
//     this.translator = translator ?? MaskedTextController.getDefaultTranslator();
//
//     addListener(() {
//       final String previous = _lastUpdatedText;
//       if (beforeChange(previous, this.text)) {
//         updateText(this.text);
//         afterChange(previous, this.text);
//       } else {
//         updateText(_lastUpdatedText);
//       }
//     });
//
//     updateText(this.text);
//   }
//
//   String mask;
//
//   late Map<String, RegExp> translator;
//
//   Function afterChange = (String previous, String next) {};
//   Function beforeChange = (String previous, String next) {
//     return true;
//   };
//
//   String _lastUpdatedText = '';
//
//   void updateText(String text) {
//     if (text.isNotEmpty) {
//       this.text = _applyMask(mask, text);
//     } else {
//       this.text = '';
//     }
//
//     _lastUpdatedText = this.text;
//   }
//
//   void updateMask(String mask, {bool moveCursorToEnd = true}) {
//     this.mask = mask;
//     updateText(text);
//
//     if (moveCursorToEnd) {
//       this.moveCursorToEnd();
//     }
//   }
//
//   void moveCursorToEnd() {
//     final String text = _lastUpdatedText;
//     selection = TextSelection.fromPosition(TextPosition(offset: text.length));
//   }
//
//   @override
//   set text(String newText) {
//     if (super.text != newText) {
//       super.text = newText;
//       moveCursorToEnd();
//     }
//   }
//
//   static Map<String, RegExp> getDefaultTranslator() {
//     return <String, RegExp>{
//       'A': RegExp(r'[A-Za-z]'),
//       '0': RegExp(r'[0-9]'),
//       '@': RegExp(r'[A-Za-z0-9]'),
//       '*': RegExp(r'.*')
//     };
//   }
//
//   String _applyMask(String? mask, String value) {
//     String result = '';
//
//     int maskCharIndex = 0;
//     int valueCharIndex = 0;
//
//     while (true) {
//       // if mask is ended, break.
//       if (maskCharIndex == mask!.length) {
//         break;
//       }
//
//       // if value is ended, break.
//       if (valueCharIndex == value.length) {
//         break;
//       }
//
//       final String maskChar = mask[maskCharIndex];
//       final String valueChar = value[valueCharIndex];
//
//       // value equals mask, just set
//       if (maskChar == valueChar) {
//         result += maskChar;
//         valueCharIndex += 1;
//         maskCharIndex += 1;
//         continue;
//       }
//
//       // apply translator if match
//       if (translator.containsKey(maskChar)) {
//         if (translator[maskChar]!.hasMatch(valueChar)) {
//           result += valueChar;
//           maskCharIndex += 1;
//         }
//
//         valueCharIndex += 1;
//         continue;
//       }
//
//       // not masked value, fixed char on mask
//       result += maskChar;
//       maskCharIndex += 1;
//       continue;
//     }
//
//     return result;
//   }
// }
//
// enum CardType {
//   otherBrand,
//   mastercard,
//   visa,
//   rupay,
//   americanExpress,
//   unionpay,
//   discover,
//   elo,
//   hipercard,
// }
//
// class NewCardBackground extends StatelessWidget {
//   const NewCardBackground({
//     Key? key,
//     required this.backgroundGradientColor,
//     this.backgroundImage,
//     this.backgroundNetworkImage,
//     required this.child,
//     this.width,
//     this.height,
//     this.glassmorphismConfig,
//     required this.padding,
//     this.border,
//   })  : assert(
//             (backgroundImage == null && backgroundNetworkImage == null) ||
//                 (backgroundImage == null && backgroundNetworkImage != null) ||
//                 (backgroundImage != null && backgroundNetworkImage == null),
//             "You can't use network image & asset image at same time for card background"),
//         super(key: key);
//
//   final String? backgroundImage;
//   final String? backgroundNetworkImage;
//   final Widget child;
//   final Gradient backgroundGradientColor;
//   final Glassmorphism? glassmorphismConfig;
//   final double? width;
//   final double? height;
//   final double padding;
//   final BoxBorder? border;
//
//   @override
//   Widget build(BuildContext context) {
//     final Orientation orientation = MediaQuery.of(context).orientation;
//     return LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//       final double screenWidth = constraints.maxWidth.isInfinite
//           ? MediaQuery.of(context).size.width
//           : constraints.maxWidth;
//       final double screenHeight = MediaQuery.of(context).size.height;
//       return Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.all(padding),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: border,
//               gradient: glassmorphismConfig != null
//                   ? glassmorphismConfig!.gradient
//                   : backgroundGradientColor,
//               image: backgroundImage != null && backgroundImage!.isNotEmpty
//                   ? DecorationImage(
//                       image: ExactAssetImage(
//                         backgroundImage!,
//                       ),
//                       fit: BoxFit.fill,
//                     )
//                   : backgroundNetworkImage != null &&
//                           backgroundNetworkImage!.isNotEmpty
//                       ? DecorationImage(
//                           image: NetworkImage(
//                             backgroundNetworkImage!,
//                           ),
//                           fit: BoxFit.fill,
//                         )
//                       : null,
//             ),
//             width: width ?? screenWidth,
//             height: height ??
//                 (orientation == Orientation.portrait
//                     ? (((width ?? screenWidth) - (padding * 2)) *
//                         AppConstants.creditCardAspectRatio)
//                     : screenHeight / 2),
//             child: ClipRRect(
//               clipBehavior: Clip.hardEdge,
//               borderRadius: BorderRadius.circular(8),
//               child: Container(
//                 child: glassmorphismConfig != null
//                     ? BackdropFilter(
//                         filter: ui.ImageFilter.blur(
//                           sigmaX: glassmorphismConfig?.blurX ?? 0.0,
//                           sigmaY: glassmorphismConfig?.blurY ?? 0.0,
//                         ),
//                         child: child,
//                       )
//                     : child,
//               ),
//             ),
//           ),
//           if (glassmorphismConfig != null)
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: _GlassmorphicBorder(
//                 width: width ?? screenWidth,
//                 height: height ??
//                     (orientation == Orientation.portrait
//                         ? ((screenWidth - 32) * 0.5714)
//                         : screenHeight / 2),
//               ),
//             ),
//         ],
//       );
//     });
//   }
// }
//
// class _GlassmorphicBorder extends StatelessWidget {
//   _GlassmorphicBorder({
//     required this.height,
//     required this.width,
//   }) : _painter = _GradientPainter(strokeWidth: 2, radius: 10);
//   final _GradientPainter _painter;
//   final double width;
//   final double height;
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: _painter,
//       size: MediaQuery.of(context).size,
//       child: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         width: width,
//         height: height,
//       ),
//     );
//   }
// }
//
// class _GradientPainter extends CustomPainter {
//   _GradientPainter({required this.strokeWidth, required this.radius});
//
//   final double radius;
//   final double strokeWidth;
//   final Paint paintObject = Paint();
//   final Paint paintObject2 = Paint();
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final LinearGradient gradient = LinearGradient(
//         begin: Alignment.bottomRight,
//         end: Alignment.topLeft,
//         colors: <Color>[
//           Colors.white.withAlpha(50),
//           Colors.white.withAlpha(55),
//           Colors.white.withAlpha(50),
//         ],
//         stops: const <double>[
//           0.06,
//           0.95,
//           1
//         ]);
//     final RRect innerRect2 = RRect.fromRectAndRadius(
//         Rect.fromLTRB(strokeWidth, strokeWidth, size.width - strokeWidth,
//             size.height - strokeWidth),
//         Radius.circular(radius - strokeWidth));
//
//     final RRect outerRect = RRect.fromRectAndRadius(
//         Rect.fromLTRB(0, 0, size.width, size.height), Radius.circular(radius));
//     paintObject.shader = gradient.createShader(Offset.zero & size);
//
//     final Path outerRectPath = Path()..addRRect(outerRect);
//     final Path innerRectPath2 = Path()..addRRect(innerRect2);
//     canvas.drawPath(
//         Path.combine(
//             PathOperation.difference,
//             outerRectPath,
//             Path.combine(
//                 PathOperation.intersect, outerRectPath, innerRectPath2)),
//         paintObject);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
