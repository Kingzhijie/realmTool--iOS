//
//  DataBaseTool.m
//  DMProject
//
//  Created by panda誌 on 2017/7/21.
//  Copyright © 2017年 王志杰. All rights reserved.
//

#import "DataBaseTool.h"

@implementation DataBaseTool
/**
 设置版本数据迁移
 */
+ (void)setDataMigrationVersion{
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.schemaVersion = 0; //初始版本0---1---2---依次递增
    config.migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion) {
        // enumerateObjects:block: 遍历了存储在 Realm 文件中的每一个“Person”对象
//        [migration enumerateObjects:Person.className
//                              block:^(RLMObject *oldObject, RLMObject *newObject) {
//                                  // 只有当 Realm 数据库的架构版本为 0 的时候，才添加 “fullName” 属性
//                                  if (oldSchemaVersion < 1) {
//                                      newObject[@"fullName"] = [NSString stringWithFormat:@"%@ %@",
//                                                                oldObject[@"firstName"],
//                                                                oldObject[@"lastName"]];
//                                  }
//                                  // 只有当 Realm 数据库的架构版本为 0 或者 1 的时候，才添加“email”属性
//                                  if (oldSchemaVersion < 2) {
//                                      newObject[@"email"] = @"";
//                                  }
//                              }];
    };
    [RLMRealmConfiguration setDefaultConfiguration:config];
    // 现在我们已经成功更新了架构版本并且提供了迁移闭包，打开旧有的 Realm 数据库会自动执行此数据迁移，然后成功进行访问
    [RLMRealm defaultRealm];
}

/**
 数据存储
 
 @param ClassName 存储对象类名
 @param object 存储的对象
 */
+ (void)saveDataWithClassName:(NSString *)ClassName object:(id)object{
    RLMRealm * realm = [RLMRealm defaultRealm];
    //数据存储
    [realm transactionWithBlock:^{
        [NSClassFromString(ClassName) createOrUpdateInRealm:realm withValue:object];
        //如果已经设置过主键的话, 可以根据主键对数据进行更新或者是不存在时候插入
    }];
}

/**
 数据更新
 
 @param ClassName 需:更新对象类名
 @param object 需:更新的对象
 */
+ (void)updateDataWithClassName:(NSString *)ClassName object:(id)object{
    [DataBaseTool saveDataWithClassName:ClassName object:object];
}

/**
 获取ClassName类中所有的数据
 
 @param ClassName 存储对象类名
 @return 存储对象数组
 */
+ (RLMResults *)getAllObjectFromClassName:(NSString *)ClassName{
    RLMResults * Results = [NSClassFromString(ClassName) allObjects];
    return Results;
}

/**
 获取where条件下, 对应数据数组
 
 @param where  查询条件
 @param ClassName 被查询对象类名
 @return 查询结果, 数组
 */
+ (RLMResults *)getObjectsWhere:(NSString *)where fromClassName:(NSString *)ClassName{
    RLMRealm * realm = [RLMRealm defaultRealm];
    RLMResults *Results = [NSClassFromString(ClassName) objectsInRealm:realm where:where];
    return Results;
}

/**
 条件删除----删除where条件下,对应的数据
 
 @param where 删除条件
 @param ClassName 类名
 */
+ (void)deleteObjectsWhere:(NSString *)where fromClassName:(NSString *)ClassName{
    RLMRealm * realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        RLMResults * ResultArray = [NSClassFromString(ClassName) objectsInRealm:realm where:where];
        [realm deleteObjects:ResultArray];
    }];
}

/**
 删除所有存储在realm中的数据(!!!!慎用)
 */
+ (void)deleteAllObject{
    RLMRealm * realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteAllObjects];
    }];
}


@end
