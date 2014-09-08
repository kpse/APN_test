//
//  ViewController.m
//  push
//
//  Created by kpse on 9/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    BOOL _didSet;
    UILabel* _label;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    _label = [[UILabel alloc] init];
    _label.text = @"will show the push content here";
    _label.textAlignment = UIBaselineAdjustmentAlignCenters;
    [self.view addSubview:_label];
//    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    [self setUpAutoLayout];
    [super updateViewConstraints];
}

- (void)setUpAutoLayout {
    if (_didSet) {
        return;
    }
    _didSet = YES;

    NSDictionary *views =
        @{@"label1" : _label};

    NSArray *layouts = @[@"|-15-[label1]-15-|", @"V:|-15-[label1]-15-|"];

    [layouts enumerateObjectsUsingBlock:^(NSString *layout, NSUInteger idx, BOOL *stop) {
        NSArray *constraint = [NSLayoutConstraint constraintsWithVisualFormat:layout
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views];
        [self.view addConstraints:constraint];
    }];

    NSArray *vLayouts = @[@"[label1(>=50)]", @"V:[label1(>=40)]"];
    [vLayouts enumerateObjectsUsingBlock:^(NSString *layout, NSUInteger idx, BOOL *stop) {
        NSArray *constraint = [NSLayoutConstraint constraintsWithVisualFormat:layout
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views];
        [_label addConstraints:constraint];
    }];

}

@end
