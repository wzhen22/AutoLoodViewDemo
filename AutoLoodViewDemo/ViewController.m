//
//  ViewController.m
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-10.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "ViewController.h"
#import "firstViewController.h"
#import "secondViewController.h"
#import "customButton.h"
#import "customView.h"

@interface ViewController ()

@end

@implementation ViewController{
//    int  responseOfType;0
}
//-(void)loadItemsForGroup:(NSDictionary *)dictionary;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    判断当前设备的版本号
    float numOfVersion = [[[UIDevice currentDevice]systemVersion] floatValue];
    if (numOfVersion >7.0) {
        NSLog(@"yes");
        [[UIApplication sharedApplication]setStatusBarHidden:YES];
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
//        self.extendedLayoutIncludesOpaqueBars = NO;
//        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }
	// Do any additional setup after loading the view, typically from a nib.
    NSString *lstring = [[NSBundle mainBundle] resourcePath];
    NSString *path = [lstring stringByAppendingPathComponent:@"DocumentsLayout.json"];
    NSData *ldata = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *lDictionary = [NSJSONSerialization JSONObjectWithData:ldata options:NSJSONReadingAllowFragments error:nil];
    [DataListClass sharDataClass].dictionary = lDictionary;//存储可能需要的公共数据；
//    NSLog(@"%@",lDictionary);
    
    self.lScrollView = [[UIScrollView alloc]init];
//    self.lScrollView.frame = CGRectMake(0, 0, 320, 400);
    self.lScrollView.frame = self.view.bounds;
    
    self.lScrollView.contentSize = CGSizeMake(400, 400);
    NSLog(@"%f",self.view.bounds.size.height);
    [self.lScrollView setBackgroundColor:[UIColor purpleColor]];
    int rows = [[lDictionary objectForKey:@"rowsOfType"] intValue];
    for (int i= 0; i<rows-2; i++) {
        NSString *keyOfGroupItems = [NSString stringWithFormat:@"itemsOfGroup_%d",i];
        NSDictionary *lDic = [lDictionary objectForKey:keyOfGroupItems];
        [self loadItemsForGroup:lDic];
    }
    [self.view addSubview:_lScrollView];
    
    customView *lCustomView = [[customView alloc]initWithFrame:CGRectMake(80, 400, 160, 100)];
    lCustomView.backgroundColor = [UIColor whiteColor];
    [lCustomView setimageWithView:^(void){
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(80, 400, 160, 100);
        imageView.image = [UIImage imageNamed:@"2"]; 
        [self.view addSubview:imageView];
    }];
    [self.view addSubview:lCustomView];
    
}


-(void)loadItemsForGroup:(NSDictionary *)dictionary{
    NSArray *typeOfArray = @[@"button",@"label",@"textField"];//用于判断接受控键的类型
    
    NSDictionary *lDictionary = dictionary;//通过json文件解析出来的字典用于动态布局
    
    //    NSLog(@"%@",lDictionary);
    
    NSInteger numOfitems;               //纪录需要布局的控键的个数
    numOfitems = [lDictionary allKeys].count;
    for (int i=0;  i<numOfitems;i++) {
        NSString *lKeyString = [NSString stringWithFormat:@"item_%d",i];
        NSDictionary *AttributeDic = [lDictionary objectForKey:lKeyString];
//        NSLog(@"%@",AttributeDic);
        
        for (int j = 0; j<typeOfArray.count; j++) {
            if ([[typeOfArray objectAtIndex:j]isEqualToString:[AttributeDic objectForKey:@"type"]]) {
//                NSLog(@"%d",j);
                switch (j) {
                    case 0:{
                        customButton *lButton = [[customButton alloc]init];
                        CGFloat rect_x= [[AttributeDic objectForKey:@"BkeyCGRect_x"] floatValue];
                        CGFloat rect_y= [[AttributeDic objectForKey:@"BkeyCGRect_y"] floatValue];
                        CGFloat rect_width= [[AttributeDic objectForKey:@"BkeyCGRect_width"] floatValue];
                        CGFloat rect_height= [[AttributeDic objectForKey:@"BkeyCGRect_height"] floatValue];
                        NSLog(@"%f,%f,%f,%f",rect_x,rect_y,rect_width,rect_height);
                        lButton.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //                        CGFloat RGB_red = [AttributeDic objectForKey:@"<#string#>"];
                        lButton.backgroundColor = [UIColor colorWithRed:100/255 green:100/255 blue:100/255 alpha:1];
                        NSString *nameOfButton = [AttributeDic objectForKey:@"BkeyNameOfText"];
                        [lButton setTitle:nameOfButton forState:UIControlStateNormal];
                        [lButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                        lButton.numOfType = [[AttributeDic objectForKey:@"BkeyOfClick"] intValue];
//                        NSLog(@"%d",responseOfType);
                        [self.lScrollView addSubview:lButton];
                        
                        break;
                    }
                    case 1:{
                        UILabel *lLabel = [[UILabel alloc]init];
                        CGFloat rect_x= [[AttributeDic objectForKey:@"LkeyCGRect_x"] floatValue];
                        CGFloat rect_y= [[AttributeDic objectForKey:@"LkeyCGRect_y"] floatValue];
                        CGFloat rect_width= [[AttributeDic objectForKey:@"LkeyCGRect_width"] floatValue];
                        CGFloat rect_height= [[AttributeDic objectForKey:@"LkeyCGRect_height"] floatValue];
                        lLabel.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        lLabel.text = [AttributeDic objectForKey:@"LkeyText"];
                        lLabel.textAlignment = [[AttributeDic objectForKey:@"LkeyAlignment"] intValue];
                        lLabel.backgroundColor = [UIColor grayColor];
                        [self.lScrollView addSubview:lLabel];
                        
                        break;
                    }
                    case 2:{
                        UITextField *lTextField = [[UITextField alloc]init];
                        CGFloat rect_x= [[AttributeDic objectForKey:@"TkeyCGRect_x"] floatValue];
                        CGFloat rect_y= [[AttributeDic objectForKey:@"TkeyCGRect_y"] floatValue];
                        CGFloat rect_width= [[AttributeDic objectForKey:@"TkeyCGRect_width"] floatValue];
                        CGFloat rect_height= [[AttributeDic objectForKey:@"TkeyCGRect_height"] floatValue];
                        lTextField.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        lTextField.backgroundColor = [UIColor blueColor];
                        [lTextField addTarget:self action:@selector(textClick) forControlEvents:UIControlEventEditingDidEndOnExit];
                        [self.lScrollView addSubview:lTextField];
                        
                        break;
                    }
                        
                    default:
                        break;
                }
                break;
            }
            //            NSLog(@"dsfdsfsdf");
        }
    }


}

-(void)textClick{
    //do any additional setup
    
}

-(void)buttonClick:(customButton *)sender{
    if (sender.numOfType == 1) {
        firstViewController *lFirstVC = [[firstViewController alloc]init];
        [self presentViewController:lFirstVC animated:YES completion:nil];
    }
    if (sender.numOfType == 2) {
        secondViewController *lSecondVC = [[secondViewController alloc]init];
        [self presentViewController:lSecondVC animated:YES completion:nil];
    }
    if (sender.numOfType == 3) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"warning" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
        NSLog(@"%ld",(long)alertView.cancelButtonIndex);
        NSLog(@"%ld",(long)alertView.firstOtherButtonIndex);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
