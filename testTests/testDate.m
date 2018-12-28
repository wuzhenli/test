//
//  testDate.m
//  testTests
//
//  Created by li’Pro on 2018/4/13.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+compare.h"
#import "NSString+formatter.h"

@interface testDate : XCTestCase

@end

@implementation testDate

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"--- setUp");
}
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    NSLog(@"--- tearDown");
    [super tearDown];
}

- (void)testDate {
  
    NSString *show1 = [@"2018-04-13 01:56:40" bbs_formatterText];
    NSString *show2 = [@"2018-04-12 23:54:32" bbs_formatterText];
    NSString *show3 = [@"2017-04-13 01:56:40" bbs_formatterText];
    
    NSLog(@"%@   %@   %@", show1, show2, show3);   
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end




















