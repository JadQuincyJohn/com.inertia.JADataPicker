//
//  ViewController.m
//  com.inertia.JADataPicker
//
//  Created by Jad on 02/03/2015.
//  Copyright (c) 2015 Inertia. All rights reserved.
//

#import "ViewController.h"

#define kAnimationDuration 0.2

@interface ViewController()
@property (nonatomic, strong) UIView * grayView;
@end

@implementation ViewController

#pragma mark - Accessors
- (CustomDataPickerView *)pickerView{
    if (!_pickerView) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([CustomDataPickerView class]) bundle:nil];
        _pickerView = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
        _pickerView.delegate = (id<CustomDataPickerViewDelegate>)self;
    }
    return _pickerView;
}
- (UIView *)grayView{
    if (!_grayView) {
        _grayView = [[UIView alloc] initWithFrame:self.view.bounds];
        _grayView.backgroundColor = [UIColor colorWithRed:(170.0/255.0) green:(170.0/255.0) blue:(170.0/255.0) alpha:0.6];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidePickerView)];
        [_grayView addGestureRecognizer:tap];
    }
    return _grayView;
}

#pragma mark - Hide & Show Picker View
- (void)hidePickerView{
    [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.grayView.alpha = 0;
        [UIView animateWithDuration:kAnimationDuration/2 delay:kAnimationDuration/2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.pickerView.frame = CGRectMake(0,self.view.frame.size.height,self.pickerView.frame.size.width, self.pickerView.frame.size.height);
        } completion:^(BOOL finished) {
            [self.pickerView removeFromSuperview];
        }];
    } completion:^(BOOL finished) {
        [self.grayView removeFromSuperview];
    }];
}

- (IBAction)showPickerView{
    
    [self.view addSubview:self.pickerView];
    CGRect r = self.view.frame;
    self.pickerView.frame = CGRectMake(0, r.size.height,  self.pickerView.frame.size.width, self.pickerView.frame.size.height);
    [self.view insertSubview:self.grayView belowSubview:self.pickerView];
    
    self.grayView.alpha = 0;
    CGFloat yOffset = r.size.height - self.pickerView.frame.size.height;
    [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.grayView.alpha = 1;
        
        [UIView animateWithDuration:kAnimationDuration/2 delay:kAnimationDuration/2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.pickerView.frame = CGRectMake(0,yOffset,self.pickerView.frame.size.width, self.pickerView.frame.size.height);
        } completion:nil];
    } completion:nil];
}

@end
