# Change Log
## 1.2.1

- Add new methods in 'CUJSON' to support returning un-formated JSON string.

## 1.2.0

- Add a new class called 'CUTimer' to replace NSTimer because NSTimer is not friendly-use.

## 1.1.0

- Add a new class called 'CUQueryString' to handle the parameters for HTTP-Get;
- Add a new method in CUFile.h&m to redirect the NSLog info into log files in Documents/logs;

## 1.0.2

- Add highlighted background color for CUCustomAlertView's buttons;
- Add a new method in CUColor to generate image from color;
- Modify the cornerRadius of CUCustomAlertView to be 14, like the corner of UIAlertController's view;
- Add safty check to method 'substring:to:' in class 'NSString+CUString.m';
- Correct an issue in CUDate when converting millisecond into NSDate.

## 1.0.1

- Add 'CUCustomAlertView.h' into CUtil.h to make it public;
- Add a new class 'CUCustomAlertView' to support much more definition of alert view;
- Adjust the Y-position of message label in CUAlertView and the height of main alert view too;
- Add a new method in CUDate.h&m to generate milliseconds with a date and a format string;
- Modify the style of CUAlertView, removed the defined enum 'CUAlertViewRightButtonColor' and accept custom color of text and button;

## 0.1.22:

- Add a new method for initializing CUAlertView, it suppports specifying a color for the right button;
- Add no less than three types of color for the right button;

## 0.1.21:

- Increase the width of message label to contain more letters;
- Decrease the x-position of message label;
- Add an optional image view in CUAlertView and move the properties in CUAlertView.h to CUAlertView.m to avoid possible mistakes;
- Adjust the frame of the image view to follow the size of the image in CUAlertView.

## 0.1.20:

- Adjust the parameters of position in CUAlertView to fit the dynamic length of 'message';
- Make the height of CUAlertView change with the height of message label.

## 0.1.19:

- Make the 'hiding' of views with animations;
- Increase the width of message label in CUAlertView to make the alert view look better;
- Remove the 'warning' comments in CUCode.h, CUStorage.h&m files due to the keys can be stored in Keychain of both real devices and simulators.

## 0.1.18:

- Translate the Comments from Chinese to English;
- Translate the README.md file from Chinese to English.

## 0.1.17:

- Make NSData+CUData work through CocoaPods;
- Add 'libz.tbd' into CUtil.podspec to support compression or uncompression;
- Add NSData+CUData to compress & decompress, encrypt & decrypt data; -- It works now.

## 0.1.14 & 0.1.15 & 0.1.16:

- Correct an issue in NSString+CUString.m;
- CUAlertView supports only one button(in fact, the right one);
- Add a method in CUAlertView to hide activity indicator view;
- Make the theme of CUTipsView stand for CUTipsView;
- Add NSData+CUData to compress & decompress, encrypt & decrypt data; -- unavailable
- Make the JSON string looks pretty.

## 0.1.13:

- Add two methods in CUJSON for parsing JSON string to an array or a dictionary.
- Modify the logic of layouting subview in CUAlertView to reduce the memory cost.

## 0.1.12:

- Add `CUAlertViewTheme` support for CUAlertView;
- Change the font-size of `messageLabel` in CUAlertView;
- Change the colors of `title` and `message` in CUAlertView.

## v0.1.11:

- Add `CUAlertView` class for the alert view show;
- Add Initialization method and show method in CUAlertView.h;
- Add the implementation of methods in CUAlertView.h or self-use methods in CUAlertView.

## v0.1.10:

- Add new features for NSString+CUString.h&m.

## v0.1.9:

- Add commonly used API in Java to NSString+CUString.h&m.
