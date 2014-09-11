//
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MyCache.h"

@interface MyCache ()
@property(nonatomic, strong) NSMutableDictionary *storage;
@end

@implementation MyCache {

}

static MyCache *_instance = nil;

+ (MyCache *)shared {
    if (!_instance) {
        _instance = [[MyCache alloc] init];
    }
    return _instance;
}

- (id)init {
    self = [super init];
    if (self) {
        _storage = [[NSMutableDictionary alloc] init];
    }

    return self;
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key {
    _storage[key] = obj;
}

- (id)objectForKeyedSubscript:(id)key {
    return _storage[key];
}
@end