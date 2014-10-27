//
//  MyFilesViewController.h
//  MyFiles
//  Created by Maria Vergel De Dios on 10/25/14.
//  Copyright (c) 2014 Maria Vergel De Dios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFilesViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIWebView *WebView;
- (IBAction)btnLocal:(id)sender;
- (IBAction)btnWeb:(id)sender;


@end
