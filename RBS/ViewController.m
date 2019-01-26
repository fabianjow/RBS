//
//  ViewController.m
//  RBS
//
//  Created by Fabian Jow on 9/1/19.
//  Copyright © 2019 fabian jow. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "HomeViewController.h"

@interface ViewController (){
    IBOutlet UITextField * signInUserNameTextField;
    IBOutlet UITextField * signInPasswordTextField;
    UIActivityIndicatorView *activityIndicatorView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect frame = CGRectMake (120.0, 185.0, 80, 80);
    activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:frame];
    activityIndicatorView.color = [UIColor blueColor];
    [self.view addSubview:activityIndicatorView];
}

- (void)viewDidAppear:(BOOL)animated {
    if ([PFUser currentUser]) {
        [self goToMainPage];
    }
}

- (IBAction)signIn:(id)sender {
    [activityIndicatorView startAnimating];
    [PFUser logInWithUsernameInBackground:signInUserNameTextField.text password:signInPasswordTextField.text
                                    block:^(PFUser *user, NSError *error) {
                                        
                                        [self->activityIndicatorView stopAnimating];
                                        if (user) {
                                            [self goToMainPage];
                                        } else {
                                            [self displayMessageToUser:error.localizedDescription];
                                        }
                                    }];
    
}

- (void)goToMainPage {
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    LoggedInViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"LoggedInNC"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)displayMessageToUser:(NSString*)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Message"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
    popPresenter.sourceView = self.view;
    UIAlertAction *Okbutton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    [alert addAction:Okbutton];
    popPresenter.sourceRect = self.view.frame;
    alert.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
