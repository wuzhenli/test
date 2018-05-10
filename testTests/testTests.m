//
//  testTests.m
//  testTests
//
//  Created by li’Pro on 2017/9/26.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MehtodSignature.h"
#import "Animal.h"
#import "SingleModel.h"
#import "UIDevice+Addtion.h"

@interface testTests : XCTestCase

@end

@implementation testTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testArray {
    NSMutableArray<NSString *> *array = @[@"4", @"5", @"6"].mutableCopy;
    
    NSMutableArray<NSString *> *arrayOld = @[@"1", @"2", @"3"].mutableCopy;
    [array insertObjects:arrayOld atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, arrayOld.count)]];
    NSLog(@"%@", array);
    NSLog(@"count:%ld", array.count);
    NSAssert(array.count == 6, @"insert error");
}

- (void)testReadUrl {
    NSString *str = @"http://provider.test.6rooms.net/upload/bbs_thread/20180503/20004/src/20180503144916_4NklXATozFSck1PYiLS2.png?width=750&height=533";
    NSURL *url = [NSURL URLWithString:str];
    NSString *query = url.query;
    NSScanner *scanner = [NSScanner scannerWithString:query];
    [scanner scanString:@"width=" intoString:nil];
    NSInteger width = 0;
    [scanner scanInteger:&width];
    
    [scanner scanString:@"&height=" intoString:nil];
    NSInteger height = 0;
    [scanner scanInteger:&height];
    
    XCTAssert(width == 750, @"width error");
    XCTAssert(height == 533, @"height error");
}

- (void)testCompare {
    NSString *s1 = [[UIDevice currentDevice] systemVersion]; // 11.2
    
    
    XCTAssertTrue([UIDevice ad_lessThenVersion:@"11.3"]);
    XCTAssertFalse([UIDevice ad_lessThenVersion:@"11.2"]);
    XCTAssertFalse([UIDevice ad_lessThenVersion:@"8.0"], @"less then 8.4 is false" );
    NSLog(@"systemV:%@", s1);  // -1
}

- (void)testSingleton {
    SingleModel *m1 = [SingleModel shareSingleModel];
    SingleModel *m2 = [SingleModel shareSingleModel];
    
    XCTAssertNotNil(m1, "m1 is nil");
    XCTAssertNotNil(m2, "m2 is nil");
    
    
    XCTAssert(m1 == m2, "m1 != m2");
}
- (void)testDate {
    NSDate *datePast = [NSDate distantPast];
    NSDate *date = [NSDate date];
    
    NSTimeInterval interval = [date timeIntervalSinceDate:datePast];
    NSLog(@"distantPast:%@ interval:%lf", date, interval);
}

- (void)testString {
    NSString *str = @"abc d e f  ";
    NSString *newStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"newStr:|%@|", newStr);
}

- (void)testUrl {
    NSURL *baseUrl = [NSURL URLWithString:@"http://www.kongfz.com"];
    NSString *path = @"requere/contactlist";
    
    NSURL *requestUrl = [NSURL URLWithString:path relativeToURL:baseUrl];
    NSLog(@"url:%@", requestUrl.absoluteString);
    
    
    
    
    
    NSURLSessionTask *task;
    NSURLSession *session;
//    session 
    
    NSURLSessionDataTask;
    NSURLSessionDownloadTask;
    
}

- (void)testSig {
    /*
     NSUInteger lenth = [sig methodReturnLength];
     const char *returnType = [sig methodReturnType];
     NSLog(@"methodReturnType:%s  methodReturnLength:%lu", returnType, lenth);
     */
    
    MehtodSignature *obj = [MehtodSignature new];
    NSMethodSignature *sig = [obj methodSignatureForSelector:@selector(addressOfNum:)];
    
    // invocation
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setTarget:obj];
    invocation.selector = @selector(addressOfNum:);
    NSUInteger num = 12344;
    [invocation setArgument:&num atIndex:2];
    // print param
    NSUInteger numAt2Index = 0;
    [invocation getArgument:&numAt2Index atIndex:2];
    NSLog(@"getArgumentAt 2: %lu  target:%@ selector:%@", numAt2Index, invocation.target, NSStringFromSelector(invocation.selector));
    
    
    NSString *address = nil;
    [invocation invoke];
    [invocation getReturnValue:&address];
    
    NSLog(@"address: %@", address);
    
    
    /*
     @property (nullable, assign) id target;
     @property SEL selector;
     
     - (void)getReturnValue:(void *)retLoc;
     - (void)setReturnValue:(void *)retLoc;
     
     - (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx;
     - (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx;
     
     - (void)invoke;
     - (void)invokeWithTarget:(id)target;
     */
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

























