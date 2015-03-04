//
//  ViewController.m
//  com.inertia.JADataPicker
//
//  Created by Jad on 06/02/2015.
//  Copyright (c) 2015 Inertia. All rights reserved.
//

#import "JAViewController.h"
#import "CustomDataPickerView.h"

#define kPickerRowHeight 26

@interface JAViewController ()<CustomDataPickerViewDelegate>

@property (nonatomic, strong) NSArray * model;
@property (nonatomic, weak) IBOutlet UIButton * button;

@end

@implementation JAViewController

#pragma mark - View Lifecyle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    self.model = [NSArray arrayWithObjects:@"Paris",@"London",@"Berlin",@"Budapest",@"Oslo",@"Tunis",@"Moscou", nil];
}

#pragma mark - CustomPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(CustomDataPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(CustomDataPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.model count];
}

- (CGFloat)pickerView:(CustomDataPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 50;
}
- (CGFloat)pickerView:(CustomDataPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return kPickerRowHeight;
}

- (NSString *)pickerView:(CustomDataPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.model objectAtIndex:row];
}

- (NSAttributedString *)pickerView:(CustomDataPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return nil;
}

- (UIView *)pickerView:(CustomDataPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel * pickerLabel = (UILabel *)view;
    
    if (pickerLabel == nil) {
        pickerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kPickerRowHeight)];
        pickerLabel.backgroundColor = [UIColor clearColor];
        pickerLabel.font = [UIFont fontWithName:@"Avenir-Book" size:16];
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        pickerLabel.text = [self.model objectAtIndex:row];
    }
    return pickerLabel;
}

- (void)pickerView:(CustomDataPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString * item = [self.model objectAtIndex:row];
    [self.button setTitle:item forState:UIControlStateNormal];
    NSLog(@"%@",item);
}

- (void)pickerViewDidCancelPicking:(CustomDataPickerView *)pickerView{
    [self hidePickerView];
}

- (void)pickerView:(CustomDataPickerView *)pickerView didSelectItemAtIndex:(NSUInteger)index{
    [self hidePickerView];
}

@end
