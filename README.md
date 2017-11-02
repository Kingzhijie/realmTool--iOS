

**realm数据二次封装**

	1. 准备工作, 首先项目接入realmSDK   安装 pod 'Realm', '~> 3.0.0'  demo使用的3.0.0版本
	2. 工具提供数据库的---存储, 更新 , 查询, 删除等功能

	/**
	 设置版本数据迁移 (涉及到数据库中, 增加新的元素的时候, 需要使用升级)
	 */
	+ (void)setDataMigrationVersion;

	/**
	 数据存储

	 @param ClassName 存储对象类名
	 @param object 存储的对象 (可以设置主键存储)
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

	如果下载demo, 编译报错, 更新一下realm到最新版本即可------目前发现realm有新版的时候, 不更新会报错😄😄

