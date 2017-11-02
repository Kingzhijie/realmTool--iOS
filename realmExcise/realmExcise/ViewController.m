//
//  ViewController.m
//  realmExcise
//
//  Created by W志杰@融讯 on 16/11/30.
//  Copyright © 2016年 王志杰. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "PersonModel.h"

#import "manModel.h"
#import "DataBaseTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    PersonModel * person = [[PersonModel alloc] init];
    person.name = @"王志杰";
    person.sex = @"男";
    person.age = 5;
    
    PersonModel * person1 = [[PersonModel alloc] init];
    person1.name = @"李牛福";
    person1.sex = @"男";
    person1.age = 18;
    
    
    PersonModel * person2 = [[PersonModel alloc] init];
    person2.name = @"王志杰";
    person2.sex = @"男";
    person2.age = 60;
    
    PersonModel * person3 = [[PersonModel alloc] init];
    person3.name = @"王志";
    person3.sex = @"男";
    person3.age = 115;
    
    manModel * man = [[manModel alloc] init];
    man.name = @"李东泽";
    man.sex = @"女";
    man.age = 20;
    

     //添加数据
    [DataBaseTool saveDataWithClassName:@"PersonModel" object:person];
    [DataBaseTool saveDataWithClassName:@"PersonModel" object:person1];
    [DataBaseTool saveDataWithClassName:@"PersonModel" object:person2];
    [DataBaseTool saveDataWithClassName:@"PersonModel" object:person3];
    person2.sex = @"女";
    //根据主键name更新数据
    [DataBaseTool updateDataWithClassName:@"PersonModel" object:person2];
    //获取PersonModel 下所有的数据
    NSLog(@"%@",[DataBaseTool getAllObjectFromClassName:@"PersonModel"]);
    //年龄大于10的数据
    for (PersonModel * perm in [DataBaseTool getObjectsWhere:@"age > 10" fromClassName:@"PersonModel"]) {
        NSLog(@"perm.name==%@",perm.name);
    }

    
    //根据姓名为王志杰的人
    for (PersonModel * perModel in [DataBaseTool getObjectsWhere:@"name = '王志杰'" fromClassName:@"PersonModel"]) {
        NSLog(@"perModel.name==%@",perModel.name);
    }
    
    //删除数据, age > 80的全部删除  注释: 想删除ClassName中所有, 把条件写成恒成立
    [DataBaseTool deleteObjectsWhere:@"age > 100" fromClassName:@"PersonModel"];
    //删除所有的缓存数据
    [DataBaseTool deleteAllObject];
    
   
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
