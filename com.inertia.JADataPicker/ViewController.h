//
//  ViewController.h
//  com.inertia.JADataPicker
//
//  Created by Jad on 02/03/2015.
//  Copyright (c) 2015 Inertia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomDataPickerView.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) CustomDataPickerView * pickerView;

- (void)showPickerView;
- (void)hidePickerView;

@end
