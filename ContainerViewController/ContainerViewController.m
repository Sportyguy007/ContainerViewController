//
//  ViewController.m
//  ContainerViewController
//
//  Created by Joseph Collins on 2/11/12.
//  Copyright (c) 2012 Joseph Collins. All rights reserved.
//

#import "ContainerViewController.h"

@implementation ContainerViewController

@synthesize currentViewController, nextViewController;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (void)setupNavigationBar
{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44.0f)];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"ContainerView"];
    navItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(switchViewControllers)];
    navBar.items = [NSArray arrayWithObject:navItem];
    [self.view addSubview:navBar];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // This is just for the purpose of calling the switch method.
    [self setupNavigationBar];
    
    CGRect rect = CGRectMake(0, 44, 320, 436);
    
    currentViewController = [[UIViewController alloc] init];
    currentViewController.view.frame = rect;
    currentViewController.view.backgroundColor = [UIColor blueColor];
    
    nextViewController = [[UIViewController alloc] init];
    nextViewController.view.frame = rect;
    nextViewController.view.backgroundColor = [UIColor redColor];
    
    [self addChildViewController:currentViewController];
    [self addChildViewController:nextViewController];
    
    [self.view addSubview:currentViewController.view];
}

- (void)switchViewControllers
{
    [self transitionFromViewController:currentViewController toViewController:nextViewController duration:3.0 options:UIViewAnimationTransitionFlipFromRight | UIViewAnimationOptionCurveEaseInOut animations:nil completion:^(BOOL finished) {
        UIViewController *tempViewController = currentViewController;
        currentViewController = nextViewController;
        nextViewController = tempViewController;
        tempViewController = nil;
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
