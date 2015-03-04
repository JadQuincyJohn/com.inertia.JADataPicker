//
//  CustomDataPicker.h
//  com.inertia.JADataPicker
//
//  Created by Jad on 06/02/2015.
//  Copyright (c) 2015 Inertia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomDataPickerView;

@protocol CustomDataPickerViewDelegate <NSObject>

@required
- (NSInteger)numberOfComponentsInPickerView:(CustomDataPickerView *)pickerView;
- (NSInteger)pickerView:(CustomDataPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (void)pickerView:(CustomDataPickerView *)pickerView didSelectItemAtIndex:(NSUInteger)index;
- (void)pickerViewDidCancelPicking:(CustomDataPickerView *)pickerView;

@optional
- (CGFloat)pickerView:(CustomDataPickerView *)pickerView widthForComponent:(NSInteger)component;
- (CGFloat)pickerView:(CustomDataPickerView *)pickerView rowHeightForComponent:(NSInteger)component;
- (NSString *)pickerView:(CustomDataPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (NSAttributedString *)pickerView:(CustomDataPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (UIView *)pickerView:(CustomDataPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;
- (void)pickerView:(CustomDataPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

@end

@interface CustomDataPickerView : UIView

@property (nonatomic, weak) id<CustomDataPickerViewDelegate> delegate;

@end
