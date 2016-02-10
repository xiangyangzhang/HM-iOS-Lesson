//
//  ITLProduct.h
//  
//
//  Created by 倪凡乐 on 16/2/9.
//
//

#import <Foundation/Foundation.h>
/**
 "title": "网易电影票",
 "id": "com.netease.movie",
 "url": "http://itunes.apple.com/app/id583784224?mt=8",
 "icon": "movie@2x.png",
 "customUrl": "movieticket163"

 */

@interface ITLProduct : NSObject

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *ID;
@property (nonatomic, strong)NSString *url;
@property (nonatomic, strong)NSString *icon;
@property (nonatomic, strong)NSString *customUrl;


+(instancetype)productWithDict:(NSDictionary *)dict;


@end
