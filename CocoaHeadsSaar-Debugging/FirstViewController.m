//
//  FirstViewController.m
//  CocoaHeadsSaar-Debugging
//
//  Created by Philip Schneider on 25.02.16.
//  Copyright © 2016 Philip Schneider. All rights reserved.
//

#import "FirstViewController.h"
#import "NSLogger.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self addSampleViews];
    
    LoggerStart(LoggerGetDefaultLogger());   
    LoggerApp(1, @"Hello world! Today is: %@", [NSDate date]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) addSampleViews
{
    for (int i=0; i < 100; i++)
    {
        CGFloat x = arc4random() % 255;
        CGFloat y = arc4random() % 255;
        CGFloat w = arc4random() % 255;
        CGFloat h = arc4random() % 255;

        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x,y,w,h)];
        view.backgroundColor = [UIColor colorWithRed:x/255 green:y/255 blue:w/255 alpha:0.5];
        [self.view addSubview:view];
    }
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
 
    for (UIView *view in self.view.subviews)
    {
        LoggerApp(1, @"%p %@", view, NSStringFromCGRect(view.frame));
    }
}

@end
