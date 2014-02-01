//
//  ViewController.m
//  pong
//
//  Created by Marcelo Sampaio on 2/1/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

@synthesize ball,startButton,timer;
@synthesize X,Y;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)startButton:(UIButton *)sender
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(ballMovement) userInfo:nil repeats:YES];
    
}


-(void)ballMovement
{
    self.ball.center=CGPointMake(self.ball.center.x + X, self.ball.center.y + Y);
    
    
    
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
