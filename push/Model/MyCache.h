//
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyCache : NSObject
+ (MyCache *)shared;

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

- (id)objectForKeyedSubscript:(id)key;
@end