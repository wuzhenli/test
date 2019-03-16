//
//  KVOViewController.m
//  test
//
//  Created by li’Pro on 2018/8/6.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "KVOViewController.h"
#import "KVOPerson.h"
#import <Objc/runtime.h>


@interface KVOViewController ()

@property (strong, nonatomic) KVOPerson *person;

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.person = [KVOPerson new];
    self.person.name = @"p0";
//    [self.person printInfo];
//
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    self.person.name = @"p1";
//    [self.person printInfo];
//
//    [self.person removeObserver:self forKeyPath:@"name"];
//    [self.person printInfo];
}

- (void)dealloc {
    [self.person removeObserver:self forKeyPath:@"name"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"keyPath:%@  change:%@", keyPath, change);
}

- (IBAction)btnChangeName:(id)sender {
    [self.person setValue:@(time(NULL)).stringValue forKey:@"name"];
}

- (IBAction)btnChange_name:(id)sender {
    [self.person setValue:@(time(NULL)).stringValue forKey:@"_name"];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
