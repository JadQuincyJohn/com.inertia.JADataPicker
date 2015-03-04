//
//  CustomDataPicker.m
//  com.inertia.JADataPicker
//
//  Created by Jad on 06/02/2015.
//  Copyright (c) 2015 Inertia. All rights reserved.
//

#import "CustomDataPickerView.h"
#import "UIImage+ImageEffects.h"
#import "TransparentToolbar.h"


@interface CustomDataPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, weak) IBOutlet TransparentToolbar * toolbar;
@property (nonatomic, weak) IBOutlet UIPickerView * pickerView;

@end

@implementation CustomDataPickerView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor redColor];
    label.text = @"Select item";
    label.font = [UIFont fontWithName:@"Avenir-Book" size:18.0];
    
    UIBarButtonItem * cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonTapped:)];
    
    UIBarButtonItem *flexibleSpace1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *toolBarTitle = [[UIBarButtonItem alloc] initWithCustomView:label];
    UIBarButtonItem *flexibleSpace2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem * okButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(okButtonTapped:)];
    self.toolbar.items = [NSArray arrayWithObjects:cancelButton,flexibleSpace1,toolBarTitle,flexibleSpace2,okButton, nil];

    
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        
    visualEffectView.frame = self.frame;
    [self insertSubview:visualEffectView atIndex:0];
    
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(CustomDataPickerView *)pickerView{
    NSInteger numberOfComponentsInPickerView = 0;
    if ([self.delegate respondsToSelector:@selector(numberOfComponentsInPickerView:)]) {
        numberOfComponentsInPickerView = [self.delegate numberOfComponentsInPickerView:self];
    }
    return numberOfComponentsInPickerView;
}

- (NSInteger)pickerView:(CustomDataPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger numberOfRowsInComponent = 0;
    if ([self.delegate respondsToSelector:@selector(pickerView:numberOfRowsInComponent:)]) {
        numberOfRowsInComponent = [self.delegate pickerView:self numberOfRowsInComponent:component];
    }
    return numberOfRowsInComponent;
}

- (CGFloat)pickerView:(CustomDataPickerView *)pickerView widthForComponent:(NSInteger)component{
    CGFloat widthForComponent = 0;
    if ([self.delegate respondsToSelector:@selector(pickerView:widthForComponent:)]) {
        widthForComponent = [self.delegate pickerView:self widthForComponent:component];
    }
    return widthForComponent;
}

- (CGFloat)pickerView:(CustomDataPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    CGFloat rowHeightForComponent = 0;
    if ([self.delegate respondsToSelector:@selector(pickerView:rowHeightForComponent:)]) {
        rowHeightForComponent = [self.delegate pickerView:self rowHeightForComponent:component];
    }
    return rowHeightForComponent;
}

- (NSString *)pickerView:(CustomDataPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString * titleForRow = nil;
    if ([self.delegate respondsToSelector:@selector(pickerView:titleForRow:forComponent:)]) {
        titleForRow = [self.delegate pickerView:self titleForRow:row forComponent:component];
    }
    return titleForRow;
}

- (NSAttributedString *)pickerView:(CustomDataPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSAttributedString * attributedTitleForRow = nil;
    if ([self.delegate respondsToSelector:@selector(pickerView:attributedTitleForRow:forComponent:)]) {
        attributedTitleForRow = [self.delegate pickerView:self attributedTitleForRow:row forComponent:component];
    }
    return attributedTitleForRow;
}

- (UIView *)pickerView:(CustomDataPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UIView * viewForRow = nil;
    if ([self.delegate respondsToSelector:@selector(pickerView:viewForRow:forComponent:reusingView:)]) {
        viewForRow = [self.delegate pickerView:self viewForRow:row forComponent:component reusingView:view];
    }
    return viewForRow;
}

- (void)pickerView:(CustomDataPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if ([self.delegate respondsToSelector:@selector(pickerView:didSelectRow:inComponent:)]) {
        [self.delegate pickerView:self didSelectRow:row inComponent:component];
    }
}

#pragma mark - Actions
- (void)cancelButtonTapped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(pickerViewDidCancelPicking:)]) {
        [self.delegate pickerViewDidCancelPicking:self];
    }
}

- (void)okButtonTapped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(pickerView:didSelectItemAtIndex:)]) {
        [self.delegate pickerView:self didSelectItemAtIndex:[self.pickerView selectedRowInComponent:0]];
    }
}


@end
