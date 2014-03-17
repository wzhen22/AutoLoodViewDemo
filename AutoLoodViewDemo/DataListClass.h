//
//  DataListClass.h
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-11.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataListClass : NSObject

+(DataListClass *)sharDataClass;
@property(nonatomic,retain)NSDictionary *dictionary;
@end
