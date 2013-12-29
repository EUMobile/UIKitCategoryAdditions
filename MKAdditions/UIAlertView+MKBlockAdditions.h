//
//  UIAlertView+MKBlockAdditions.h
//  UIKitCategoryAdditions
//
//  Created by Mugunth on 21/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKBlockAdditions.h"

@interface UIAlertView (Block) <UIAlertViewDelegate>
+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message;

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message
                  cancelButtonTitle:(NSString*) cancelButtonTitle;

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message
                  cancelButtonTitle:(NSString*) cancelButtonTitle
                  otherButtonTitles:(NSArray*) otherButtons
                          onDismiss:(DismissBlock) dismissed
                           onCancel:(CancelBlock) cancelled;

+ (UIAlertView*)alertViewStylePlainTextInputWithTitle:(NSString*) title
                                              message:(NSString*) message
                                         defaultValue:(NSString *)defaultValue
                                    cancelButtonTitle:(NSString*) cancelButtonTitle
                                    otherButtonTitles:(NSArray*) otherButtons
                                            onDismiss:(TextInputPickeBLock)dismissed
                                             onCancel:(CancelBlock) cancelled;

+ (UIAlertView*) alertViewStylePlainTextInputWithTitle:(NSString*) title
                                               message:(NSString*) message
                                          defaultValue:(NSString *)defaultValue
                                          keyboardType:(UIKeyboardType)keyboardType
                                     cancelButtonTitle:(NSString*) cancelButtonTitle
                                     otherButtonTitles:(NSArray*) otherButtons
                                             onDismiss:(TextInputPickeBLock)dismissed
                                              onCancel:(CancelBlock) cancelled;
@end
