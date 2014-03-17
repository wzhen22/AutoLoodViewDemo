//
//  OneViewController.m
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-16.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title =@"hello";
        UITabBarItem *titleBar = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:101];
        [self setTabBarItem:titleBar];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.title = @"hello";
    
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    lButton.frame = CGRectMake(130, 200, 60, 40);
    lButton.backgroundColor = [UIColor blueColor];
    [lButton setTitle:@"点击" forState:UIControlStateNormal];
    [lButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)buttonClick:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
