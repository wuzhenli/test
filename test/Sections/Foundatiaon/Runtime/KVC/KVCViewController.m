//
//  KVCViewController.m
//  test
//
//  Created by li’Pro on 2019/3/11.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "KVCViewController.h"
#import "KVOPattern.h"


@interface KVCViewController ()

@property (strong, nonatomic) KVOPattern *pattern;

@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self mutableArrayValueForKey:@"name"];
}

- (void)dealloc {
    [self.pattern removeObserver:self forKeyPath:@"books"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"books"] && object == self.pattern) {
        NSLog(@"change:%@", change);
    }
}

- (IBAction)btnMutableArrayValueForKey:(id)sender {
    static int i = 0;
    NSLog(@"before:%p  %@", self.pattern.books, NSStringFromClass([self.pattern.books class]));
    NSMutableArray *array = [self.pattern mutableArrayValueForKey:@"books"];
    if (i++ %2 == 0) {
        [array addObject:@"OC"];
    } else {
        [array removeLastObject];
    }
    NSLog(@"after:%p  %@", self.pattern.books, NSStringFromClass([self.pattern.books class]));
}

    

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma -mark ***** getter

- (KVOPattern *)pattern {
    if (!_pattern) {
        _pattern = [KVOPattern new];
        [_pattern.books addObjectsFromArray:@[@"C", @"Java", @"oracle", @"English"]];
        [_pattern addObserver:self forKeyPath:@"books" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _pattern;
}

@end
