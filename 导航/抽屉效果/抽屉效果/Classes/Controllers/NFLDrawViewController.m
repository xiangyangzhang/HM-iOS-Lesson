//
//  NFLDrawViewController.m
//  
//
//  Created by 倪凡乐 on 16/1/18.
//
//

#import "NFLDrawViewController.h"

@interface NFLDrawViewController ()
@property (nonatomic, assign) BOOL isDraging;
@end

@implementation NFLDrawViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addChildView];
    /**
     *  第三步，增加观察者方法，实现滑动页面的切换
     *
     *  forKeyPath：监听frame的改变
     *  options：监听新值的改变
     */
    [_mainView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    
}

//当_mainView值改变时会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (_mainView.frame.origin.x < 0) {
        //往左移，显示右边
        _rightView.hidden = NO;
        _leftView.hidden = YES;
    }else if (_mainView.frame.origin.x > 0){
        //往右移，显示左边
        _rightView.hidden = YES;
        _leftView.hidden = NO;

    }
}

/**
 *  第一步，创建左中右三个视图
 */
- (void)addChildView
{
    
    UIView *leftView = [[UIView alloc]initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:leftView];
    _leftView = leftView;
    
    UIView *rightView = [[UIView alloc]initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:rightView];
    _rightView =rightView;
    
    
    UIView *mainView = [[UIView alloc]initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:mainView];
    _mainView = mainView;
    
}

/**
 *  第二步，设置touch事件，实现滑动响应
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获取UITouch对象
    UITouch *touch = [touches anyObject];
    //获取当前点
    CGPoint currentPoint = [touch locationInView:self.view];
    //获取上一个点
    CGPoint prePoint = [touch previousLocationInView:self.view];
    //获取x轴偏移量
    CGFloat offsetX = currentPoint.x - prePoint.x;
    
    _mainView.frame = [self getCurrentFrameWithOffsetX:offsetX];

}

/**
 *  第四步，当手指偏移一点，根据x轴偏移计算frame
 */

#define NFLMaxOffsetY 60
- (CGRect)getCurrentFrameWithOffsetX:(CGFloat)offsetX
{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    //根据x轴偏移量计算y轴偏移量
    CGFloat offsetY = offsetX * NFLMaxOffsetY / screenW;
    
    CGFloat scale = (screenH - 2 * offsetY) / screenH;

    if (_mainView.frame.origin.x < 0) {
        scale = (screenH + 2 * offsetY) / screenH;
    }
    
    //获取之前dframe
    CGRect frame = _mainView.frame;
    frame.origin.x += offsetX;
    frame.size.width *= scale;
    frame.size.height *= scale;
    frame.origin.y = (screenH - frame.size.height) * 0.5;
    
    _isDraging = YES;

    
    return frame;
}

/**
 *  定位
 */
#define NFLRTarget 250
#define NFLLTarget -220
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //复位
    [UIView animateWithDuration:0.05 animations:^{
        if (_isDraging == NO &&_mainView.frame.origin.x != 0 ) {
            _mainView.frame = self.view.bounds;
        }
    }];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat target = 0;
    
    //如果拖拽超过半屏，直接定位到某个点
    if (_mainView.frame.origin.x > screenW * 0.5) {
        //定位到右边
        target = NFLRTarget;
    }else if(CGRectGetMaxX(_mainView.frame) < screenW * 0.5){
        //定位到左边
        target = NFLLTarget;
    }
    
    //添加延迟动画
    [UIView animateWithDuration:0.05 animations:^{
        if (target) {
            
            //获得偏移量offsetX,_mainView.frame.orgin.x为拖拽后还未松手的那个点
            CGFloat offsetX = target - _mainView.frame.origin.x;
            _mainView.frame = [self getCurrentFrameWithOffsetX:offsetX];
        }else{
            //还原
            _mainView.frame = self.view.bounds;
        }
    }];
    
    _isDraging = NO;
    
    
}
@end
