//
//  ViewController.m
//  LHDefaultImage
//
//  Created by chenlonghai on 2019/9/4.
//  Copyright © 2019年 chenlonghai. All rights reserved.
//

#import "ViewController.h"

#import "LHPlaceHoldView.h"
#import "UITableView+LHDefaultImage.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL flag;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    __weak typeof(self) weakself = self;
   
    weakself.flag = NO;
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"icon.bundle"];
    
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    _tableView.placeHolderView = [[LHPlaceHoldView alloc] initWithFrame:self.tableView.bounds image: [UIImage imageWithContentsOfFile:[ bundle pathForResource:@"no_data" ofType:@"png"]] viewClick:^{
        weakself.flag = !weakself.flag;
        [weakself.tableView reloadData];

    }];
    [_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!_flag) {
        return 0;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    return cell;
}
@end
