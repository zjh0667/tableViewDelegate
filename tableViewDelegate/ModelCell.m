//
//  ModelCell.m
//  tableViewDelegate
//
//  Created by 张健恒 on 15/12/30.
//  Copyright © 2015年 张健恒. All rights reserved.
//

#import "ModelCell.h"

@interface ModelCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end

@implementation ModelCell

- (void)awakeFromNib {
    [self setUI];
}

-(void)setUI{
    
}

-(void)setModel:(MyModel *)model{
    _model = model;
    self.nameLabel.text = model.name;
    self.ageLabel.text = model.age;
}
@end
