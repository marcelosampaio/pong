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
@synthesize computer,player;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}


-(void)collision
{
    
    if (CGRectIntersectsRect(self.ball.frame, self.player.frame)) {
        Y=arc4random() %5;
        Y=0-Y;
    }
    
    if (CGRectIntersectsRect(self.ball.frame, self.computer.frame)) {
        Y=arc4random() %5;
    }
    
    
}


-(void)computerMovement
{
    if (self.computer.center.x>self.ball.center.x) {
        self.computer.center=CGPointMake(self.computer.center.x-2, self.computer.center.y);
    }
    if (self.computer.center.x<self.ball.center.x) {
        self.computer.center=CGPointMake(self.computer.center.x+2, self.computer.center.y);
    }

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *drag=[[event allTouches]anyObject];
    self.player.center=[drag locationInView:self.view];
//  
//    if (self.player.center.y>536) {
//        self.player.center=CGPointMake(self.player.center.x, 536);
//    }
//    if (self.player.center.y<536) {
//        self.player.center=CGPointMake(self.player.center.x, 536);
//    }
    
    if (self.player.center.x<37) {
        self.player.center=CGPointMake(37, self.player.center.y);
    }
    if (self.player.center.x>283) {
        self.player.center=CGPointMake(283, self.player.center.y);
    }
    
    
}



- (IBAction)startButton:(UIButton *)sender
{
    
    // hide button
    self.startButton.hidden=YES;

    
    Y = arc4random() %11;  // (eleven possibilities including 0 and 10)
    Y = Y-5;
    
    X = arc4random() %11;
    X = X-5;
    
    if (Y==0) {
        Y=1;
    }

    if (X==0) {
        X=1;
    }
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(ballMovement) userInfo:nil repeats:YES];
    
}


-(void)ballMovement
{
    
    [self computerMovement];
    [self collision];
    
    
    
    
    self.ball.center=CGPointMake(self.ball.center.x + X, self.ball.center.y + Y);
    
    if (self.ball.center.x<15) {
        X=0-X;
    }
    if (self.ball.center.x>305) {
        X=0-X;
    }

    
    
    
    
    if (self.ball.center.y<15) {
        X=0-X;
    }
    if (self.ball.center.y>self.view.frame.size.height) {
        Y=0-Y;
    }
    
    
    
    
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
