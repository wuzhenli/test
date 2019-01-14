//
//  NSStringAdditionTests.m
//  testTests
//
//  Created by li’Pro on 2019/1/14.
//  Copyright © 2019 wzl. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Addition.h"

@interface NSStringAdditionTests : XCTestCase

@end

@implementation NSStringAdditionTests

- (void)testIsPhoneNumber {
    NSString *num1 = @"13655223378";
    NSString *num2 = @"13322225553";
    
    XCTAssertTrue([num1 adt_isPhoneNum], @"num 1 is not phone num");
    XCTAssertTrue([num2 adt_isPhoneNum], @"%@ is not phone num", num2);
}

@end
