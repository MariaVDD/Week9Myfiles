//
//  MyFilesViewController.m
//  MyFiles
//
//  Created by Maria Vergel De Dios on 10/25/14.
//  Copyright (c) 2014 Maria Vergel De Dios. All rights reserved.
//

#import "MyFilesViewController.h"

@interface MyFilesViewController ()

@end

@implementation MyFilesViewController
@synthesize WebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [WebView release];
    [super dealloc];
}
- (IBAction)btnLocal:(id)sender {
    [self loadlocalFile];
}
- (IBAction)btnWeb:(id)sender {
    [self loadexternalFile];
    
}
- (void)loadlocalFile
{
    //check if iphone or ipad
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //load file
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Corydon" ofType:@"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        
        [WebView loadRequest:request];
        
        
    }
    
    else {
        //load file
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Corydon" ofType:@"pdf"];
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
             [WebView loadRequest:request];
        
    }

   
}

- (void)loadexternalFile
{

    if([self checkinternet] == NO)
    {
        // Not connected to the internet
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Internet Connection Required"
                                                          message:@"Close app and return when internet connection available."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    else
    {
        //check if iphone or ipad
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
             NSURL *targetURL = [NSURL URLWithString:@"http://www.cms.gov/Medicare/Provider-Enrollment-and-Certification/SurveyCertificationGenInfo/downloads/SCLetter11_16.pdf"];
            NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
            [WebView loadRequest:request];
            
        }
        
        else {
         
            NSURL *targetURL = [NSURL URLWithString:@"http://www.cms.gov/Medicare/Provider-Enrollment-and-Certification/SurveyCertificationGenInfo/downloads/SCLetter11_16.pdf"];
            NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
           [WebView loadRequest:request];
            
        }

        
    }
   
   

}
- (CGSize)getScreenSize
{
    //Get Screen size
    CGSize size;
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height > [[UIScreen mainScreen] bounds].size.width) {
        // in Landscape mode, width always higher than height
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height < [[UIScreen mainScreen] bounds].size.width) {
        // in Portrait mode, height always higher than width
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else {
        // otherwise it is normal
        size.height = [[UIScreen mainScreen] bounds].size.height;
        size.width = [[UIScreen mainScreen] bounds].size.width;
    }
    return size;
}
- (BOOL) checkinternet
{
    //check internet connection
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com/m"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data)
    {
        NSLog(@"Device is connected to the internet");
        return YES;
    }
    else
    {
        NSLog(@"Device is not connected to the internet");
        return NO;
    }
    
}

@end
