//
//  LoginViewController.m
//  DairyNote
//
//  Created by 刘帅 on 4/13/16.
//  Copyright © 2016 刘帅. All rights reserved.
//

#import "LoginViewController.h"

#define SCREEN [[UIScreen mainScreen]bounds].size


@interface LoginViewController ()
@property (nonatomic,strong) UITextField *usernameTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _usernameTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 64+40, SCREEN.width-100, 44) ];
    _usernameTextField.placeholder = @"用户名";
    [_usernameTextField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:_usernameTextField];
    _usernameTextField.layer.borderWidth = 2.0;
    _usernameTextField.layer.borderColor = [UIColor blueColor].CGColor;
    _usernameTextField.layer.cornerRadius = 20.0;
    _usernameTextField.textAlignment = NSTextAlignmentCenter;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event  {
    [self.view endEditing:YES];
}

@end
