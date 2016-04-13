//
//  ViewController.m
//  DairyNote
//
//  Created by 刘帅 on 3/28/16.
//  Copyright © 2016 刘帅. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()
@property (nonatomic,strong)  LoginViewController *loginView;
@end

@implementation ViewController {
    NSDate *_dueDate;
    BOOL _datePickerVisible;
    UIBarButtonItem *_personalCenterItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _personalCenterItem = [[UIBarButtonItem alloc]init];
//    _personalCenterItem.image = [UIImage imageNamed:@"PersonalCenter_icon"];
//    self.navigationItem.leftBarButtonItem = _personalCenterItem;
////    _personalCenterItem.action = @selector(loginClick:);
//    self.navigationItem.leftBarButtonItem.action = @selector(loginClick:);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"PersonalCenter_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(loginClick:)];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
//    
//    return cell;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 3;
//}

#pragma mark - tableViewDataSource 
//5
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        if (!_datePickerVisible) {
            [self showDatePicker];
        }else {
            [self hideDatePicker];
        }
    }
}
//2
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 && _datePickerVisible) {
        return 2;
    }else {
        return [super tableView:tableView numberOfRowsInSection:section];
    }
}
//3
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath;
}
//1
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 1) {
        return 217.0f;
    }else {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}

//4
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //1,定位
    if(indexPath.section ==0 &&indexPath.row ==1){
        
        //2 获取cell
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DatePickerCell"];
        
        if(cell == nil){
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DatePickerCell"];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            //3
            
            UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f,216.0f)];
            datePicker.tag =100;
            [cell.contentView addSubview:datePicker];
            
            //4
//            [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
            
            
        }
        return cell;
        
        //5
    }else{
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
}

//6
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section ==0 &&indexPath.row ==1){
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
        return [super tableView:tableView indentationLevelForRowAtIndexPath:newIndexPath];
    }else{
        return [super tableView:tableView indentationLevelForRowAtIndexPath:indexPath];
    }
    
}

#pragma mark - date Picker
-(void)showDatePicker{
    
    _datePickerVisible = YES;
    
    NSIndexPath *indexPathDateRow = [NSIndexPath indexPathForRow:0 inSection:0];
    
    NSIndexPath *indexPathDatePicker = [NSIndexPath indexPathForRow:1 inSection:0];
    
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPathDateRow];
//    cell.detailTextLabel.textColor = cell.detailTextLabel.tintColor;
    
    [self.tableView beginUpdates];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPathDatePicker] withRowAnimation:UITableViewRowAnimationFade];
    
//    [self.tableView reloadRowsAtIndexPaths:@[indexPathDateRow] withRowAnimation:UITableViewRowAnimationNone];
    
    
    [self.tableView endUpdates];
    
    UITableViewCell *datePickerCell = [self.tableView cellForRowAtIndexPath:indexPathDatePicker];
    
    //获取datePickerCell 的指针，使其显示时间与_dueDate相同
//    UIDatePicker *datePicker = (UIDatePicker*)[datePickerCell viewWithTag:100];
//    [datePicker setDate:_dueDate animated:NO];
    
}

-(void)hideDatePicker{
    
    if(_datePickerVisible){
        _datePickerVisible = NO;
        
        NSIndexPath *indexPathDateRow = [NSIndexPath indexPathForRow:0 inSection:0];
        NSIndexPath *indexPathDatePicker = [NSIndexPath indexPathForRow:1 inSection:0];
        
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPathDateRow];
        cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
        
        [self.tableView beginUpdates];
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPathDateRow] withRowAnimation:UITableViewRowAnimationNone];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPathDatePicker] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.tableView endUpdates];
        
    }
    
}

- (void)loginClick:(UIBarButtonItem *)barButton {
//    NSLog(@"login");
    self.loginView =[[LoginViewController alloc]init];
    [self.navigationController pushViewController:self.loginView animated:YES];
}


//关闭键盘方法，此处不管用，原因？？？？？？
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.view endEditing:YES];
//}
@end
