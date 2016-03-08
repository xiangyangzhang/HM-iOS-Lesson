//
//  SWOAuthController.m
//  
//
//  Created by 倪凡乐 on 16/3/4.
//
//

#import "SWOAuthController.h"
#import <AFNetworking.h>
#import <MBProgressHUD.h>
#import "SWAccountTool.h"

@interface SWOAuthController ()<UIWebViewDelegate>

@end

@implementation SWOAuthController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate = self;
    
    [self.view addSubview:webView];
    
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?&client_id=4170453109&redirect_uri=http://www.baidu.com"];
    NSURL *url = [[NSURL alloc]initWithString:urlStr];
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    [webView loadRequest:urlRequest];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // 获得返回网址，截取token
    NSString *path = request.URL.absoluteString;
    NSRange range = [path rangeOfString:@"code="];
    if (range.length) {
        // range 是从指定字符开始计算位置，因此需加上指定字符长度，才是后面的字符
        NSString *code = [path substringFromIndex:range.length+range.location];
        [self accessTokenWithCode:code];
        
        // 禁止加载回调地址
        return NO;
    }
    
    
    return YES;
    
}

/**
 *  利用授权成功后的code换取accessToken
 *
 *  @param code 授权成功后的request token
 */

- (void)accessTokenWithCode:(NSString *)code
{
    /*
     url:https://api.weibo.com/oauth2/access_token
     
     client_id:申请应用时分配的AppKey。
     client_secret:请应用时分配的AppSecret。
     grant_type:填写authorization_code
     code:调用authorize获得的code值。
     redirect_uri：回调地址，需需与注册应用里的回调地址一致。
     
     */
    
    // 1.请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    // mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // AFHTTPSessionManager 默认不接受"text/plain"这种类型
    
    // 2.拼接参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"4170453109";
    params[@"client_secret"] = @"99504f75760609628a25013ab049562a";
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = @"http://www.baidu.com";
    
    // 3.发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^ void(NSURLSessionDataTask * __nonnull task, id __nonnull responseObject) {
        
        // 字典转模型
        SWAccount *account = [SWAccount accountWithDict:responseObject];

        // 模型存入沙盒
        [SWAccountTool saveAccount:account];
        
        // 切换控制器
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window switchRootViewController];
        
        MLog(@"%@",responseObject);
        
    } failure:^ void(NSURLSessionDataTask * __nullable task, NSError * __nonnull error) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        MLog(@"%@",error);
        
    }];
    
}

// 开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

// 加载完毕
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

// 加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];

}

@end
