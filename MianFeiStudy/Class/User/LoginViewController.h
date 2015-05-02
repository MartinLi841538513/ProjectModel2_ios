//
//  LoginViewController.h
//  MianFeiStudy
//
//  Created by Gao Huang on 15/5/1.
//  Copyright (c) 2015年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LoginViewControllerDelegate <NSObject>

@optional
-(void)loginSuccessedActionWithViewController:(UIViewController *)viewController;

@end
@interface LoginViewController : UIViewController
@property (nonatomic,retain)id<LoginViewControllerDelegate> delegate;

@end
