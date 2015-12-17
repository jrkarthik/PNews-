//
//  DescriptionViewController.h
//  PNews
//
//  Created by Karthik on 15/12/15.
//  Copyright © 2015 JRKKarthik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescriptionViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property(nonatomic, strong) NSString *selectedLink;
@end
