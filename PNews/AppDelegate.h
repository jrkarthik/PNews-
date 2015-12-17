//
//  AppDelegate.h
//  PNews
//
//  Created by Karthik on 15/12/15.
//  Copyright © 2015 JRKKarthik. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MBProgressHUD.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate, MBProgressHUDDelegate>


@property (strong, nonatomic) UIWindow *window;


-(void)showHUDWithMessage:(NSString *) message;
-(void)hideHUD;

@end

