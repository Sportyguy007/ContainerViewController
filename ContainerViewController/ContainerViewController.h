//
//  ViewController.h
//  ContainerViewController
//
//  Created by Joseph Collins on 2/11/12.
//  Copyright (c) 2012 Joseph Collins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerViewController : UIViewController

@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, strong) UIViewController *nextViewController;

@end
