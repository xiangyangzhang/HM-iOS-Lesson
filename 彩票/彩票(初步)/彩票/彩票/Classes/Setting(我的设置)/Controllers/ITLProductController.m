//
//  ITLProductController.m
//  
//
//  Created by 倪凡乐 on 16/2/9.
//
//

#import "ITLProductController.h"
#import "ITLProduct.h"
#import "ITLProductCell.h"

@interface ITLProductController ()

@property (nonatomic, copy)NSMutableArray *products;

@end

@implementation ITLProductController

static NSString * const reuseIdentifier = @"Cell";

- (NSMutableArray *)products
{
    if (_products == nil) {
        _products = [NSMutableArray array];
        
        NSString *fileName = [[NSBundle mainBundle]pathForResource:@"products.json" ofType:nil];
                              
        NSData *data = [NSData dataWithContentsOfFile:fileName];
        
        //将json数据转化为数组
        NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                              
        for (NSDictionary *dict in jsonArr) {
            [_products addObject:[ITLProduct productWithDict:dict]];
        }
    }
    return _products;
}

- (id)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    //每个cell尺寸
    layout.itemSize = CGSizeMake(80, 80);
    //垂直边距
    //layout.minimumLineSpacing = 10;
    //水平边距
    //layout.minimumInteritemSpacing = 10;
    
    //内边距
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    return  [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //注册UICollectionView，如果缓存池中没有，就创建
    /**
     *  此处xib连线错误，导致找bug找了一天，不应该连file's owner
     */
    UINib *xib = [UINib nibWithNibName:@"ITLProductCell" bundle:nil];
    [self.collectionView registerNib:xib forCellWithReuseIdentifier:reuseIdentifier];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ITLProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        
    ITLProduct *product = self.products[indexPath.item];
    
    cell.product = product;
    
    return cell;
}

//选择后执行方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ITLProduct *product = self.products[indexPath.item];
    NSLog(@"%@",product.title);

}


@end
