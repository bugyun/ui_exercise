//
// Created by 若云 on 2018/10/25.
// Copyright (c) 2018 finupgroup. All rights reserved.
//

#import "ZYHTableViewCell.h"
#import "ZYHCar.h"

@interface ZYHTableViewCell ()
@property(nonatomic, weak) UIImageView *iconImageView;
@property(nonatomic, weak) UILabel *priceLabel;
@property(nonatomic, strong) ZYHCar *car;
@end

@implementation ZYHTableViewCell

//需要重写这个方法,不能重写 initWithFrame
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"initWithStyle");
        //图片
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:iconImageView];
        _iconImageView = iconImageView;

        //价格
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:priceLabel];
        _priceLabel = priceLabel;

        //这样的写法是有问题的.因为_priceLabel 是 weak ,这样直接赋值的话,还是 weak
        //_priceLabel = [[UILabel alloc] init];
        //[self.contentView addSubview:_priceLabel];
    }
    return self;
}

//设置所有子控件的 frame
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat space = 10;
    CGFloat contentViewW = self.contentView.frame.size.width;
    CGFloat contentViewH = self.contentView.frame.size.height;

    //图片
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconW = 80;
    CGFloat iconH = contentViewH - 2 * space;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);

    //好用的方法
    //CGRectGetMaxX(<#CGRect rect#>)
    //CGRectGetMaxY(<#CGRect rect#>)
    //价格
    CGFloat priceX = iconX + iconW + space;
    CGFloat priceY = iconY;
    CGFloat priceW = contentViewW - priceX - space;
    CGFloat priceH = 20;
    self.priceLabel.frame = CGRectMake(priceX, priceY, priceW, priceH);
}

- (void)setCar:(ZYHCar *)car {
    _car = car;
    self.iconImageView.image = [UIImage imageNamed:car.icon];
    self.priceLabel.text = car.name;
}

- (void)dealloc {
    NSLog(@"dealloc");
}
@end