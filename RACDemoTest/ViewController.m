//
//  ViewController.m
//  RACDemoTest
//
//  Created by xiaohui on 2018/1/8.
//  Copyright © 2018年 XIAOHUI. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "TestModel.h"
#import "SecondViewController.h"
#import "FirstView.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) RACCommand *command;

@end

@implementation ViewController

- (void)btnClicked {
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.subject = [RACSubject subject];
    [vc.subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
        [_btn setTitle:x forState:UIControlStateNormal];
    }];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
//    [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [_btn setTitle:@"first" forState:UIControlStateNormal];
//    [_btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_btn];
    
    
    FirstView *firstView = [[FirstView alloc] initWithFrame:CGRectMake(10, 200, 200, 100)];
    [self.view addSubview:firstView];
    
    
//    //创建信号
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//        //block调用时刻：每当有订阅者订阅信号，就会调用block。
//
//        //发送信号
//        [subscriber sendNext:@"test"];
//        //如果不在发送数据，最好执行发送信号完成的方法，这样内部会自动调用[RACDisposable disposable]取消订阅信号。
//        [subscriber sendCompleted];
//        return [RACDisposable disposableWithBlock:^{
//            //block调用时刻：当信号发送完成或者发送错误，就会自动执行这个block,取消订阅信号。
//            //执行完Block后，当前信号就不在被订阅了。
//            NSLog(@"信号被销毁");
//        }];
//    }];
//    //订阅信号,才会激活信号.
//    [signal subscribeNext:^(id  _Nullable x) {
//        //block调用时刻：每当有信号发出数据，就会调用block
//        NSLog(@"接收到数据：%@",x);
//    }];
    
    
//    RACSubject *subject = [RACSubject subject];
//    [subject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"第一个订阅者接收到的数据%@",x);
//    }];
//    [subject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"第二个订阅者接收到的数据%@",x);
//    }];
//    [subject sendNext:@"test1"];
//    [subject sendNext:@"test2"];

    
//    RACReplaySubject *replaySubject = [RACReplaySubject subject];
//    [replaySubject sendNext:@"test1"];
//    [replaySubject sendNext:@"test2"];
//    [replaySubject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"第一个订阅者接收到的数据%@",x);
//    }];
//    [replaySubject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"第二个订阅者接收到的数据%@",x);
//    }];
    
    
//    //遍历数组
//    NSArray *arr = @[@1,@2,@3,@4];
//    [arr.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
    
    
//    //遍历字典
//    NSDictionary *dic = @{@"name":@"xiaohui", @"age":@18, @"gender":@"male"};
//    [dic.rac_sequence.signal subscribeNext:^(RACTuple *x) {
//
//        RACTupleUnpack(NSString *key, NSString *value) = x;
////        //等同于下面这种写法：
////        NSString *key = x[0];
////        NSString *value = x[1];
//        
//        NSLog(@"key=%@,value=%@",key,value);
//    }];
    
    
//    //字典转模型
//    NSArray *dicArr = @[@{@"name":@"xiaohui", @"age":@18, @"gender":@"male"}, @{@"name":@"xiaoming", @"age":@19, @"gender":@"male"}, @{@"name":@"xiaohong", @"age":@20, @"gender":@"female"}];
//    NSMutableArray *newArray = [NSMutableArray array];
//    [dicArr.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
//        TestModel *model = [[TestModel alloc] init];
//        [model setValuesForKeysWithDictionary:x];
//        [newArray addObject:model];
//        NSLog(@"内部：%@",model);
//    }];
//    NSLog(@"外部：%@",newArray);

//    NSArray *dicArr = @[@{@"name":@"xiaohui", @"age":@18, @"gender":@"male"}, @{@"name":@"xiaoming", @"age":@19, @"gender":@"male"}, @{@"name":@"xiaohong", @"age":@20, @"gender":@"female"}];
//    NSArray *newArray = [[dicArr.rac_sequence.signal map:^id _Nullable(id  _Nullable value) {
//        TestModel *model = [[TestModel alloc] init];
//        [model setValuesForKeysWithDictionary:value];
//        NSLog(@"内部：%@",model);
//        return model;
//    }] toArray];
//    NSLog(@"外部：%@",newArray);
    
    
//    //创建命令
//    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//        NSLog(@"执行命令");
//
//        //创建空信号,必须返回信号
////        return [RACSignal empty];
//
//        //创建信号,用来传递数据
//        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//            [subscriber sendNext:@"请求数据"];
//            //注意：数据传递完，最好调用sendCompleted，这时命令才执行完毕。
//            [subscriber sendCompleted];
//            return nil;
//        }];
//    }];
//
//    //强引用命令，不要被销毁，否则接收不到数据
//    _command = command;
//
//    //订阅RACCommand中的信号
//    [command.executionSignals subscribeNext:^(id  _Nullable x) {
//        [x subscribeNext:^(id  _Nullable x) {
//            NSLog(@"111%@",x);
//        }];
//    }];
//
//    //RAC高级用法(switchToLatest:用于signal of signals，获取signal of signals发出的最新信号,也就是可以直接拿到RACCommand中的信号)
//    [command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
//        NSLog(@"222%@",x);
//    }];
//
//    //监听命令是否执行完毕,默认会来一次，可以直接跳过，skip表示跳过第一次信号。
//    [[command.executing skip:1] subscribeNext:^(id  _Nullable x) {
//        if ([x boolValue] == YES) {
//            NSLog(@"正在执行！");
//        } else {
//            NSLog(@"执行完成！");
//        }
//    }];
//
//    //执行命令
//    [_command execute:@1];
}

@end
