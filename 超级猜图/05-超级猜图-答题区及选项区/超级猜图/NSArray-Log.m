//
//  NSArray-Log.m
//  
//
//  Created by 倪凡乐 on 15/10/12.
//
//

#import "NSArray-Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    for (id obj in self) {
        [strM appendFormat:@"\t%@,\n",obj];
    }
    
    [strM appendFormat:@")\n"];
    
    return strM;
}

@end
