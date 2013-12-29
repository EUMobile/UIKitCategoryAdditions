//
//  UIAlertView+MKBlockAdditions.m
//  UIKitCategoryAdditions
//
//  Created by Mugunth on 21/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIAlertView+MKBlockAdditions.h"

static DismissBlock _dismissBlock;
static CancelBlock _cancelBlock;
static TextInputPickeBLock _textInputDismissBlock;

@implementation UIAlertView (Block)

+ (UIAlertView*) alertViewStylePlainTextInputWithTitle:(NSString*) title
                            message:(NSString*) message
                              defaultValue:(NSString *)defaultValue
                  cancelButtonTitle:(NSString*) cancelButtonTitle
                  otherButtonTitles:(NSArray*) otherButtons
                          onDismiss:(TextInputPickeBLock)dismissed
                           onCancel:(CancelBlock) cancelled {
    
    return [UIAlertView alertViewStylePlainTextInputWithTitle:title message:message defaultValue:defaultValue keyboardType:UIKeyboardTypeDefault cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtons onDismiss:dismissed onCancel:cancelled];
}

+ (UIAlertView*) alertViewStylePlainTextInputWithTitle:(NSString*) title
                                               message:(NSString*) message
                                          defaultValue:(NSString *)defaultValue
                                          keyboardType:(UIKeyboardType)keyboardType
                                     cancelButtonTitle:(NSString*) cancelButtonTitle
                                     otherButtonTitles:(NSArray*) otherButtons
                                             onDismiss:(TextInputPickeBLock)dismissed
                                              onCancel:(CancelBlock) cancelled {
    
    _cancelBlock  = cancelled;
    
    _textInputDismissBlock  = [dismissed copy];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:(id)[self class]
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert textFieldAtIndex:0].text = defaultValue;
    [alert textFieldAtIndex:0].keyboardType = keyboardType;
    
    for(NSString *buttonTitle in otherButtons)
        [alert addButtonWithTitle:buttonTitle];
    
    [alert show];
    return alert;
}


+ (UIAlertView*) alertViewWithTitle:(NSString*) title                    
                    message:(NSString*) message 
          cancelButtonTitle:(NSString*) cancelButtonTitle
          otherButtonTitles:(NSArray*) otherButtons
                  onDismiss:(DismissBlock) dismissed                   
                   onCancel:(CancelBlock) cancelled {
    
    _cancelBlock  = cancelled;

    _dismissBlock  = [dismissed copy];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:(id)[self class]
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    
    for(NSString *buttonTitle in otherButtons)
        [alert addButtonWithTitle:buttonTitle];
    
    [alert show];
    return alert;
}

+ (UIAlertView*) alertViewWithTitle:(NSString*) title 
                    message:(NSString*) message {
    
    return [UIAlertView alertViewWithTitle:title 
                                   message:message 
                         cancelButtonTitle:NSLocalizedString(@"Dismiss", @"")];
}

+ (UIAlertView*) alertViewWithTitle:(NSString*) title 
                    message:(NSString*) message
          cancelButtonTitle:(NSString*) cancelButtonTitle {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles: nil];
    [alert show];
    return alert;
}


+ (void)alertView:(UIAlertView*) alertView didDismissWithButtonIndex:(NSInteger) buttonIndex {
    if (alertView.alertViewStyle == UIAlertViewStylePlainTextInput) {
        if(buttonIndex == [alertView cancelButtonIndex]) {
            if (_cancelBlock) {
                _cancelBlock();
            }
        }  else {
            if (_textInputDismissBlock) {
                _textInputDismissBlock([alertView textFieldAtIndex:0], buttonIndex - 1); // cancel button is button 0
            }
            
        }
        return;
    }
    
	if(buttonIndex == [alertView cancelButtonIndex]) {
        if (_cancelBlock) {
            _cancelBlock();
        }
	}  else {
        if (_dismissBlock) {
            _dismissBlock(buttonIndex - 1); // cancel button is button 0
        }
        
    }
}

@end