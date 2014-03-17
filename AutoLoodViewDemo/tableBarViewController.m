//
//  tableBarViewController.m
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-16.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "tableBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"


@interface tableBarViewController ()

@end

@implementation tableBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tabBar setBackgroundColor:[UIColor grayColor]];
    // Do any additional setup after loading the view.
    
    OneViewController *lOneVC = [[OneViewController alloc]init];
    UINavigationController *lOneNVC = [[UINavigationController alloc]initWithRootViewController:lOneVC];
    
    TwoViewController *lTwoVC = [[TwoViewController alloc]init];
    UINavigationController *lTwoNVC = [[UINavigationController alloc]initWithRootViewController:lTwoVC];
    
    ThreeViewController *lTreeVC = [[ThreeViewController alloc]init];
    UINavigationController *lThreeNVC =[[UINavigationController alloc]initWithRootViewController:lTreeVC];
    
    FourViewController *lFourVC = [[FourViewController alloc]init];
    UINavigationController *lFourNVC = [[UINavigationController alloc]initWithRootViewController:lFourVC];
    
    NSArray *Items = @[lOneNVC,lTwoNVC,lThreeNVC,lFourNVC];
    
    [self setViewControllers:Items animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
