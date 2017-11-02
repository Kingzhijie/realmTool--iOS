//
//  PersonModel.h
//  realmExcise
//
//  Created by W志杰@融讯 on 16/11/30.
//  Copyright © 2016年 王志杰. All rights reserved.
//

#import <Realm/Realm.h>

@interface PersonModel : RLMObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *sex;
@property (nonatomic, assign)NSInteger age;

@property (nonatomic, assign)NSInteger index;

@end
