//
//  SPViewController.m
//  UnibowlSDK
//
//  Created by jickyi521 on 03/24/2025.
//  Copyright (c) 2025 jickyi521. All rights reserved.
//

#import "SPViewController.h"
#import "SPUnibowlManager.h"

@interface SPViewController ()
@property (nonatomic, strong) UIButton *blueButton;
@end

@implementation SPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize button
    self.blueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.blueButton.frame = CGRectMake(0, 0, 200, 44);
    self.blueButton.center = self.view.center;
    [self.blueButton setTitle:@"点击跳转" forState:UIControlStateNormal];
    [self.blueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.blueButton.backgroundColor = [UIColor blueColor];
    [self.blueButton addTarget:self action:@selector(blueButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // Add to view
    [self.view addSubview:self.blueButton];
}

- (void)blueButtonClicked {
    [SPUnibowlManager handleUniversalLink:@{@"key1": @"value1", @"key2": @"value2"} completion:^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"跳转成功");
        } else {
            NSLog(@"跳转失败: %@", error.localizedDescription);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
