//
//  main.m
//  MJ_TEST
//
//  Created by 卢育彪 on 2019/1/2.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

void test1()
{
    int age = 10;
    
    void(^block1)(void) = ^{
        NSLog(@"block1----");
    };
    
    void(^block2)(void) = ^{
        NSLog(@"block2----%d", age);
    };
    
    NSLog(@"block1-----\n%@ %@ %@ %@", [block1 class], [[block1 class] superclass], [[[block1 class] superclass] superclass], [[[[block1 class] superclass] superclass] superclass]);
    
    NSLog(@"block2-----\n%@ %@ %@ %@", [block2 class], [[block2 class] superclass], [[[block2 class] superclass] superclass], [[[[block2 class] superclass] superclass] superclass]);
    
    NSLog(@"block-----\n%@ %@ %@ %@", [^{
        NSLog(@"block----%d", age);
    } class], [[^{
        NSLog(@"block----%d", age);
    } class] superclass], [[[^{
        NSLog(@"block----%d", age);
    } class] superclass] superclass], [[[[^{
        NSLog(@"block----%d", age);
    } class] superclass] superclass] superclass]);
}

int weight = 20;

void test2()
{
    static int age = 10;
    
    void(^block1)(void) = ^{
        NSLog(@"-----%d", age);
    };
    
    void(^block2)(void) = ^{
        NSLog(@"-----%d", weight);
    };
    
    NSLog(@"%@ %@", [block1 class], [block2 class]);
}

void(^block)(void);

void test3()
{
    int age = 10;
    
    block = ^{
        NSLog(@"----%d", age);
    };
}

void test4()
{
    int age = 10;
    
    block = [^{
        NSLog(@"----%d", age);
    } copy];
    
    //错误写法
//    [block copy];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        test1();
//        test2();
//        test3();
        test4();
        block();
        
    }
    return 0;
}


