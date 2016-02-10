//
//  ITLProductCell.m
//  
//
//  Created by 倪凡乐 on 16/2/9.
//
//

#import "ITLProductCell.h"
#import "ITLProduct.h"

@interface ITLProductCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ITLProductCell

- (void)awakeFromNib
{
    //圆角
    _imgView.layer.cornerRadius = 10;
    //沿着边框裁剪
    _imgView.clipsToBounds = YES;

}

- (void)setProduct:(ITLProduct *)product
{
    _product = product;

    _imgView.image = [UIImage imageNamed:product.icon];
    _label.text = product.title;
    
    NSLog(@"%@---%@",_imgView.image,product.icon);
    
}

@end
