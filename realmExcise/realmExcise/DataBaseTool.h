//
//  DataBaseTool.h
//  DMProject
//
//  Created by panda誌 on 2017/7/21.
//  Copyright © 2017年 王志杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@interface DataBaseTool : NSObject


/**
 设置版本数据迁移 (涉及到数据库升级的时候, 才使用)
 */
+ (void)setDataMigrationVersion;

/**
 数据存储

 @param ClassName 存储对象类名
 @param object 存储的对象
 */
+ (void)saveDataWithClassName:(NSString *)ClassName object:(id)object;

/**
 数据更新

 @param ClassName 需:更新对象类名
 @param object 需:更新的对象
 */
+ (void)updateDataWithClassName:(NSString *)ClassName object:(id)object;


/**
 总数据查询----获取ClassName类中所有的数据

 @param ClassName 存储对象类名
 @return 存储对象数组
 */
+ (RLMResults *)getAllObjectFromClassName:(NSString *)ClassName;


/**
 条件查询----获取where条件下, 对应数据数组

 @param where  查询条件 [例如: @"age > 80", @"name = 'panda誌'" 等]
 @param ClassName 被查询对象类名
 @return 查询结果, 数组
 */
+ (RLMResults *)getObjectsWhere:(NSString *)where fromClassName:(NSString *)ClassName;


/**
 条件删除----删除where条件下,对应的数据

 @param where 删除条件
 @param ClassName 类名
 */
+ (void)deleteObjectsWhere:(NSString *)where fromClassName:(NSString *)ClassName;

/**
 删除所有存储在realm中的数据(!!!!慎用)
 */
+ (void)deleteAllObject;


@end
