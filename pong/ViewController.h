//
//  ViewController.h
//  pong
//
//  Created by Marcelo Sampaio on 2/1/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *ball;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (strong,nonatomic) NSTimer *timer;

@property int X;
@property int Y;


// 
-(void)ballMovement;




@end
