//
//  DescriptionViewController.m
//  PNews
//
//  Created by Karthik on 15/12/15.
//  Copyright © 2015 JRKKarthik. All rights reserved.
//

#import "DescriptionViewController.h"
#import <UIKit/UIKit.h>

#import "AppDelegate.h"

@implementation DescriptionViewController
{
    AppDelegate *appDelegateObj;
}

@synthesize  selectedLink, webView;


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegateObj = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSMutableURLRequest * request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:selectedLink]];
    [webView setDelegate:self];
    [self.webView loadRequest:request];
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
   // [appDelegateObj showHUDWithMessage:@"Loading..."];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
   // [appDelegateObj hideHUD];
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler
{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
   
}


@end
