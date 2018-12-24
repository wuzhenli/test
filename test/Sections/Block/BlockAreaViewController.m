//
//  BlockAreaViewController.m
//  test
//
//  Created by li’s Air on 2018/12/22.
//  Copyright © 2018 wzl. All rights reserved.
//
/*
 - 继承体系
 - 堆区：__NSMallocBlock__ -> __NSMallocBlock -> NSBlock -> NSOBject
 - 桟区(__weak 修改block)：__NSStackBlock__ -> __NSStackBlock -> NSBlock -> NSOBject
 - 全局区：__NSGlobalBlock__ -> __NSGlobalBlock -> NSBlock -> NSOBject
 - 全局区：不引用外部变量、或只有 静态、全局变量
 - 堆区：不管用什么修饰符修改block 属性，block 引用普通变量，block 位堆区block （__NSMallocBlock__）（老版本 Xcode weak修饰的block 不自定拷贝）
 */

#import "BlockAreaViewController.h"
#import <objc/runtime.h>

typedef void(^BlockType)(int a);


@interface BlockAreaViewController () {
    NSObject *object;
}

@property (strong, nonatomic) BlockType strongBlock;
@property (copy, nonatomic) BlockType copyBlock;
@property (weak, nonatomic) BlockType weakBlock;

@end

@implementation BlockAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"测试block内存区域";
    
//    [self testBlockArea];
    [self cycleBlockFunction5];
//    int a = 122;
//    NSLog(@"a:%p", &a);
//    [self testPoint:&a];
}

- (void)testPoint:(int *)p {
    NSLog(@"p:%p   &p:%p", p, &p);
}



//int globalInt = 12;

- (void)testBlockArea {
    int tmpInt = 14;
    
    self.strongBlock = ^(int a) {
        NSLog(@"a = %d", a);
        NSLog(@"tmpInt:%d", tmpInt);
    };
    
    self.copyBlock = ^(int a) {
        NSLog(@"a = %d", a);
        NSLog(@"tmpInt:%d", tmpInt);
    };
    
    self.weakBlock = ^(int a) {
        NSLog(@"a = %d", a);
        NSLog(@"tmpInt:%d", tmpInt);
    };
    
    NSLog(@"\nstrongBlock:%@ \ncopyBlock:%@ \nweakBlock:%@", object_getClass(self.strongBlock), object_getClass(self.copyBlock),  object_getClass(self.weakBlock));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.weakBlock(123);
}


#pragma -mark block 案例

- (void)cycleBlockFunction {
    NSObject *obj = [NSObject new];
    
    self.weakBlock = ^(int a) {
        NSLog(@"obj:%p   &obj:%p", obj, &obj);
    };
    
    
    self.weakBlock(12);
    obj = nil;
    self.weakBlock(12);
    
}

- (void)cycleBlockFunction2 {
    NSObject *obj = [NSObject new];
    
    __weak NSObject *weakObj = obj;
    self.weakBlock = ^(int a) {
        NSObject *strongObj = weakObj;
        NSLog(@"obj:%p   &obj:%p", strongObj, &strongObj);
    };
    
    self.weakBlock(12);
    obj = nil;
    self.weakBlock(12);
}


/*
 2018-12-23 16:23:55.675567+0800 test[25534:556915] obj:0x600000fc60f0   &obj:0x7ffeee4073a0
 2018-12-23 16:23:58.677101+0800 test[25534:556915] obj:0x600000fc60f0   &obj:0x7ffeee4073a0
 2018-12-23 16:23:58.677388+0800 test[25534:556915] set obj = nil
 2018-12-23 16:24:03.678919+0800 test[25534:556915] obj:0x0   &obj:0x7ffeee4073a0
 2018-12-23 16:24:06.680503+0800 test[25534:556915] obj:0x0   &obj:0x7ffeee4073a0
 */
- (void)cycleBlockFunction3 {
    NSObject *obj = [NSObject new];
    
    __weak NSObject *weakObj = obj;
    self.weakBlock = ^(int a) {
        NSObject *strongObj = weakObj;
        
        NSLog(@"obj:%p   &obj:%p", strongObj, &strongObj);
        sleep(3);
        NSLog(@"obj:%p   &obj:%p", strongObj, &strongObj);
    };
    
    self.weakBlock(12);
    NSLog(@"set obj = nil");
    obj = nil;
    sleep(5);
    self.weakBlock(12);
}


- (void)cycleBlockFunction4 {
    object = [NSObject new];
    NSLog(@"obj:%p   &obj:%p", object, &object);
    
    self.weakBlock = ^(int a) {
        NSLog(@"obj:%p   &obj:%p", object, &object);
    };
    
    self.weakBlock(12);
    object = nil;
    self.weakBlock(12);
}

- (void)cycleBlockFunction5 {
    __block char key = 0;
    objc_setAssociatedObject(self, &key, @1, OBJC_ASSOCIATION_ASSIGN);
    
    self.weakBlock = ^(int a) {
        objc_setAssociatedObject(self, &key, @12, OBJC_ASSOCIATION_ASSIGN);
    };
    
    NSLog(@"value:%@", objc_getAssociatedObject(self, &key));
    self.weakBlock(121);
    NSLog(@"value:%@", objc_getAssociatedObject(self, &key));
}

@end
