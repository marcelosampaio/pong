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
        self.Y=arc4random() %5;
        self.Y=0-self.Y;
    }
    
    if (CGRectIntersectsRect(self.ball.frame, self.computer.frame)) {
        self.Y=arc4random() %5;
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

    
    self.Y = arc4random() %11;  // (eleven possibilities including 0 and 10)
    self.Y = self.Y-5;
    
    self.X = arc4random() %11;
    self.X = self.X-5;
    
    if (self.Y==0) {
        self.Y=1;
    }

    if (self.X==0) {
        self.X=1;
    }
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(ballMovement) userInfo:nil repeats:YES];
    
}


-(void)ballMovement
{
    
    [self computerMovement];
    [self collision];
    
    
    
    
    self.ball.center=CGPointMake(self.ball.center.x + X, self.ball.center.y + Y);
    
    if (self.ball.center.x<15) {
        self.X=0-self.X;
    }
    if (self.ball.center.x>305) {
        self.X=0-self.X;
    }

    
    
    
    
    if (self.ball.center.y<15) {
        self.X=0-self.X;
    }
    if (self.ball.center.y>self.view.frame.size.height) {
        self.Y=0-self.Y;
    }
    
    
    
    
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
