//
//  CUAlertView.h
//  CUtil
//
//  Created by Acttos on 28/12/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import <UIKit/UIKit.h>

typedef enum {
    CUAlertViewThemeDefault = 1,
    CUAlertViewThemePopDown,
    CUAlertViewThemePopUp
}CUAlertViewTheme;

@interface CUAlertView : UIView

/**
 Initialize a CUAlertView instance
 
 @param title The title texts in this alert view
 @param message The message texts in this alert view
 @param leftBtnText The texts of left button in this alert view
 @param leftClickedBlock The clicked-block of the left button in this alert view
 @param rightBtnText The texts of right button in this alert view
 @param rightClickedBlock The clicked-block of the right button in this alert view
 @return The instance of this CUAlertView.
 */
-(instancetype)initWithTitle:(NSString *)title
                     message:(NSString *)message
              leftButtonText:(NSString *)leftBtnText
                 leftClicked:(void(^)(void))leftClickedBlock
             rightButtonText:(NSString *)rightBtnText
                rightClicked:(void(^)(void))rightClickedBlock;

/**
 Initialize a CUAlertView instance
 
 @param title The title texts in this alert view
 @param image The image shows in the alert view between title and massage
 @param message The message texts in this alert view
 @param leftBtnText The texts of left button in this alert view
 @param leftClickedBlock The clicked-block of the left button in this alert view
 @param rightBtnText The texts of right button in this alert view
 @param rightClickedBlock The clicked-block of the right button in this alert view
 @return The instance of this CUAlertView.
 */
-(instancetype)initWithTitle:(NSString *)title
                       image:(UIImage *)image
                     message:(NSString *)message
              leftButtonText:(NSString *)leftBtnText
                 leftClicked:(void(^)(void))leftClickedBlock
             rightButtonText:(NSString *)rightBtnText
                rightClicked:(void(^)(void))rightClickedBlock;

/**
 Initialize a CUAlertView instance
 
 @param title The title texts in this alert view
 @param image The image shows in the alert view between title and massage
 @param message The message texts in this alert view
 @param textColor The color of title and message
 @param leftBtnText The texts of left button in this alert view, if needed.
 @param leftBtnBgColor The color of left button, if needed.
 @param leftClickedBlock The clicked-block of the left button in this alert view, if needed.
 @param rightBtnText The texts of right button in this alert view
 @param rightBtnBgColor The color of right button in this alert view, such as RED: dangerous operaction, BLUE:Operaction with will
 @param rightClickedBlock The clicked-block of the right button in this alert view
 @return The instance of this CUAlertView.
 */
-(instancetype)initWithTitle:(NSString *)title
                       image:(UIImage *)image
                     message:(NSString *)message
                   textColor:(UIColor *)textColor
              leftButtonText:(NSString *)leftBtnText
            leftButtonColor:(UIColor *)leftBtnBgColor
                 leftClicked:(void(^)(void))leftClickedBlock
             rightButtonText:(NSString *)rightBtnText
            rightButtonColor:(UIColor *)rightBtnBgColor
                rightClicked:(void(^)(void))rightClickedBlock;

/**
 Invoke this method to show up the alert view.
 */
-(void)show;

/**
 Show up the alert view with a certain theme.
 
 @param theme The theme of CUAlertView
 */
-(void)showWithTheme:(CUAlertViewTheme)theme;

@end
