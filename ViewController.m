//
//  ViewController.m
//  时钟demo
//
//  Created by amssy on 15/12/10.
//  Copyright © 2015年 amssy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *clockView;

@property (weak, nonatomic) IBOutlet UIImageView *clockHour;

@property (weak, nonatomic) IBOutlet UIImageView *clockMin;

@property (weak, nonatomic) IBOutlet UIImageView *clockSec;

@property (nonatomic, weak) NSTimer *time;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clockView.layer.cornerRadius = 90;
    self.clockView.contentMode = UIViewContentModeScaleAspectFill;
    self.clockView.layer.masksToBounds = YES;
    
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initView
{
    self.clockHour.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.clockMin.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.clockSec.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
    self.time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clock) userInfo:nil repeats:YES];
}

- (void)clock
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    long units = NSCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;

    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    
    self.clockHour.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.clockMin.transform = CGAffineTransformMakeRotation(minsAngle);
    self.clockSec.transform = CGAffineTransformMakeRotation(secsAngle);
}

@end
