//
//  ViewController.m
//  tableViewDelegate
//
//  Created by 张健恒 on 15/12/29.
//  Copyright © 2015年 张健恒. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SDAutoLayout.h"
#import "JHTableViewDelegate.h"
#import "MyCell.h"
#import "MyModel.h"
#import "ModelCell.h"
@interface ViewController ()
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *modelArr;
@property (nonatomic,strong) JHTableViewDelegate *tableHander ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        [self.view addSubview:self.tableView];
        _tableView.backgroundColor = [UIColor redColor];
        _tableView.sd_layout
        .topSpaceToView(self.view, 20)
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .bottomEqualToView(self.view);
        
//        self.tableHander = [[JHTableViewDelegate alloc]initWithModelArray:self.modelArr SourceTableView:_tableView CellIdentifier:@"Mycell" TableViewCellClass:[MyCell class]];
//        
//        self.tableHander.tableViewCellConfigure = ^(NSIndexPath *indexPath, id model, UITableViewCell *cell) {
//            MyCell *mycell = (MyCell *)cell;
//            mycell.text = model;
//        };
        
        
        self.tableHander = [[JHTableViewDelegate alloc]initWithModelArray:self.modelArr SourceTableView:_tableView CellIdentifier:@"modelCell" TableViewCellClass:[ModelCell class]];
        
        self.tableHander.tableViewCellConfigure = ^(NSIndexPath *indexPath, id model, UITableViewCell *cell) {
            ModelCell *mycell = (ModelCell *)cell;
            mycell.model = model;
        };
        
        self.tableHander.rowForHeight = ^(NSIndexPath *indexPath, id model) {
            return 60.0;
        };
        
        self.tableHander.didSelectRow = ^(NSIndexPath *indexPath, id model){
            NSLog(@"111");
        };
        
    }
    return _tableView;
}

-(NSArray *)modelArr{
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
        MyModel *m1 = [[MyModel alloc]init];
        m1.name = @"张三";
        m1.age = @"18";
        
        MyModel *m2 = [[MyModel alloc]init];
        m2.name = @"李四";
        m2.age = @"19";
        
        MyModel *m3 = [[MyModel alloc]init];
        m3.name = @"王五";
        m3.age = @"20";
        
        MyModel *m4 = [[MyModel alloc]init];
        m4.name = @"赵六";
        m4.age = @"22";
        
        MyModel *m5 = [[MyModel alloc]init];
        m5.name = @"钱七";
        m5.age = @"32";
        
        [_modelArr addObject:m1];
        [_modelArr addObject:m2];
        [_modelArr addObject:m3];
        [_modelArr addObject:m4];
        [_modelArr addObject:m5];
    }
    return _modelArr;
}

@end
