//
//  LoggedInViewController.m
//  RBS
//
//  Created by Fabian Jow on 25/1/19.
//  Copyright © 2019 fabian jow. All rights reserved.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController.m"

@interface LoggedInViewController (){
    IBOutlet UILabel* nameOfUser;
    UIActivityIndicatorView *activityIndicatorView;
}

@end

@implementation LoggedInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect frame = CGRectMake (120.0, 185.0, 80, 80);
    activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:frame];
    activityIndicatorView.color = [UIColor blueColor];
    [self.view addSubview:activityIndicatorView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logout:(id)sender {
    [activityIndicatorView startAnimating];
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        [self->activityIndicatorView stopAnimating];
        if(error == nil){
            [self goToStartPage];
        }else{
            [self displayMessageToUser:error.debugDescription];
        }
    }];
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

- (void)goToStartPage {
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    ViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentViewController:vc animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
