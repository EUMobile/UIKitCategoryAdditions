//
//  UIKitCategoryAdditionsAppDelegate.h
//  UIKitCategoryAdditions
//
//  Created by Mugunth on 21/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIKitCategoryAdditionsViewController;

@interface UIKitCategoryAdditionsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, strong) IBOutlet UIWindow *window;

@property (nonatomic, strong) IBOutlet UIKitCategoryAdditionsViewController *viewController;

@end
