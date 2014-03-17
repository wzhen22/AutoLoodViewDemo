//
//  DataListClass.m
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-11.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "DataListClass.h"
static DataListClass *commonDataList = nil;
@implementation DataListClass
+(DataListClass *)sharDataClass{
    @synchronized(self){
        if (commonDataList == nil) {
            commonDataList = [[DataListClass alloc]init];
        }
        
    }
    return commonDataList;
}

//- (void)dealloc
//{
//    
//    
//    [super dealloc];
//}

@end
