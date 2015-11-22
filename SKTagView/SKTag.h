//
// Created by Shaokang Zhao on 15/1/12.
// Copyright (c) 2015 Shaokang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SKTag : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSAttributedString *attributedText;
@property (nonatomic, strong) UIColor *textColor;
//add by 冰点
@property (nonatomic, strong) UIColor *selectedTextColor;
///backgound color
@property (nonatomic, strong) UIColor *bgColor;
///background image
@property (nonatomic, strong) UIImage *bgImg;
//add by 冰点
@property (nonatomic, strong) UIImage *bgSelectedImg;
@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic) CGFloat borderWidth;
///like padding in css
@property (nonatomic) UIEdgeInsets padding;
@property (nonatomic, strong) UIFont *font;
///if no font is specified, system font with fontSize is used
@property (nonatomic) CGFloat fontSize;
///default:YES
@property (nonatomic) BOOL enable;
///default:NO -add by 冰点
@property (nonatomic, assign) BOOL selected;

- (instancetype)initWithText:(NSString *)text;
+ (instancetype)tagWithText:(NSString *)text;

//add by 冰点
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;
- (UIImage *)imageWithColor:(UIColor *)color;
@end
