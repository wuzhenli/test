//
//  MapHashTableViewController.m
//  test
//
//  Created by li’Pro on 2020/12/6.
//  Copyright © 2020 wzl. All rights reserved.
//

#import "MapHashTableViewController.h"
#import "TableModel.h"

@interface MapHashTableViewController ()

@end

@implementation MapHashTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)objectPersonalityClicked:(UIButton *)sender {
    NSPointerFunctionsOptions options = NSPointerFunctionsObjectPersonality;
    NSHashTable *hashTable = [[NSHashTable alloc] initWithOptions:options capacity:10];
    
    [hashTable addObject:[TableModel modelWithId:1]];
    [hashTable addObject:[TableModel modelWithId:2]];
    NSLog(@"already add 1 / 2");
    NSLog(@"contain 2:%d", [hashTable containsObject:[TableModel modelWithId:2]]);
}

- (IBAction)opaquePersonalityClicked:(id)sender {
    NSPointerFunctionsOptions options = NSPointerFunctionsCopyIn;
    NSHashTable *hashTable = [[NSHashTable alloc] initWithOptions:options capacity:10];
    
    [hashTable addObject:[TableModel modelWithId:1]];
    [hashTable addObject:[TableModel modelWithId:2]];
    NSLog(@"already add 1 / 2");
    NSLog(@"contain 2:%d", [hashTable containsObject:[TableModel modelWithId:2]]);
}


@end
