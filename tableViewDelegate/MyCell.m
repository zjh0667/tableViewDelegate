//
//  MyCell.m
//  tableViewDelegate
//
//  Created by 张健恒 on 15/12/29.
//  Copyright © 2015年 张健恒. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 300, 21)];
    label.text = self.text;
    label.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:label];
}


@end
