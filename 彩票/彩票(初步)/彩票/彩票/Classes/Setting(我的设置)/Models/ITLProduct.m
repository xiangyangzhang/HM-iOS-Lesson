//
//  ITLProduct.m
//  
//
//  Created by 倪凡乐 on 16/2/9.
//
//

#import "ITLProduct.h"

@implementation ITLProduct


+ (instancetype)productWithDict:(NSDictionary *)dict
{
    ITLProduct *product = [[ITLProduct alloc]init];
    
    product.title = dict[@"title"];
    product.ID = dict[@"id"];
    product.icon = dict[@"icon"];
    product.url = dict[@"url"];
    product.customUrl = dict[@"customUrl"];
    
    return product;

}

- (void)setIcon:(NSString *)icon
{
    _icon = icon;
    _icon = [icon stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];

}


@end
