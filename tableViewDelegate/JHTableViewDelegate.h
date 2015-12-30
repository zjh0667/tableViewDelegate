//
//  JHTableViewDelegate.h
//  tableViewDelegate
//
//  Created by 张健恒 on 15/12/29.
//  Copyright © 2015年 张健恒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JHTableViewDelegate : NSObject<UITableViewDataSource, UITableViewDelegate>
/**
 *  初始化
 *
 *  @param modelArr           传进来的模型数组
 *  @param sourceTableView    要设置的TableView
 *  @param cellIdentifier     标识
 *  @param tableViewCellClass cell的类
 *
 *  @return nil
 */
- (id)initWithModelArray:(NSArray *)modelArr SourceTableView:(UITableView *)sourceTableView CellIdentifier:(NSString *)cellIdentifier TableViewCellClass:(Class)tableViewCellClass;

/**
 *  配置Cell
 */
@property (nonatomic, strong)void(^tableViewCellConfigure)(NSIndexPath *indexPath, id model, UITableViewCell *cell);

/**
 *  高度设置
 */
@property (nonatomic, strong)CGFloat(^rowForHeight)(NSIndexPath *indexPath, id model);

/**
 *  点击效果
 */
@property (nonatomic, strong)void(^didSelectRow)(NSIndexPath *indexPath, id model);

@property (nonatomic, assign)BOOL haveNib;
@end
