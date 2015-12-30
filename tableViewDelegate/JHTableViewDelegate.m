//
//  JHTableViewDelegate.m
//  tableViewDelegate
//
//  Created by 张健恒 on 15/12/29.
//  Copyright © 2015年 张健恒. All rights reserved.
//

#import "JHTableViewDelegate.h"

@interface JHTableViewDelegate()

@property (nonatomic, strong)NSArray *modelArr;

@property (nonatomic, strong)UITableView *sourceTableView;

@property (nonatomic, copy)NSString *cellIdentifier;

@property (nonatomic, copy)Class tableViewCellClass;

@end
@implementation JHTableViewDelegate

- (id)initWithModelArray:(NSArray *)modelArr SourceTableView:(UITableView *)sourceTableView CellIdentifier:(NSString *)cellIdentifier TableViewCellClass:(Class)tableViewCellClass{
    self = [super init];
    if (self) {
        self.sourceTableView = sourceTableView;
        self.cellIdentifier = cellIdentifier;
        self.tableViewCellClass = tableViewCellClass;
        self.modelArr = modelArr;
        if (sourceTableView) {
            [self setDataSource];
        }
    }
    return self;
}

-(void)setDataSource{
    self.sourceTableView.delegate = self;
    self.sourceTableView.dataSource = self;
}

#pragma -mark UITableViewDataSource、

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        
        if (self.haveNib) {
            
            cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self.tableViewCellClass) owner:self options:nil]lastObject];
            
        }else{
            
            Class class = self.tableViewCellClass;
            cell = [[class alloc]init];
            
        }
        
    }
    
    id model = self.modelArr[indexPath.row];
    
    self.tableViewCellConfigure(indexPath ,model, cell);
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.modelArr[indexPath.row];
    return  self.rowForHeight(indexPath, model);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.modelArr[indexPath.row];
    self.didSelectRow(indexPath, model);
}

@end
