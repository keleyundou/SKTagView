//
// Created by Shaokang Zhao on 15/1/12.
// Copyright (c) 2015 Shaokang Zhao. All rights reserved.
//

#import "SKTagButton.h"
#import "SKTag.h"

@implementation SKTagButton

+ (instancetype)buttonWithTag:(SKTag *)tag
{
	SKTagButton *btn = [super buttonWithType:UIButtonTypeCustom];
    //add by 冰点
    btn.selected = tag.selected;
	if (tag.attributedText) {
		[btn setAttributedTitle:tag.attributedText forState:UIControlStateNormal];
	} else {
		[btn setTitle:tag.text forState:UIControlStateNormal];
		[btn setTitleColor:tag.textColor forState:UIControlStateNormal];
		btn.titleLabel.font = tag.font ?: [UIFont systemFontOfSize:tag.fontSize];
	}
    //add by 冰点
    if (tag.selectedTextColor) {
        [btn setTitleColor:tag.selectedTextColor forState:UIControlStateSelected];
    }
    
    
	btn.backgroundColor = tag.bgColor;
	btn.contentEdgeInsets = tag.padding;
	btn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
	
    if (tag.bgImg)
    {
        [btn setBackgroundImage:tag.bgImg forState:UIControlStateNormal];
    }
    if (tag.bgSelectedImg) {
        [btn setBackgroundImage:tag.bgSelectedImg forState:UIControlStateSelected];
    }
    
    if (tag.borderColor)
    {
        btn.layer.borderColor = tag.borderColor.CGColor;
    }
    
    if (tag.borderWidth)
    {
        btn.layer.borderWidth = tag.borderWidth;
    }
    
    btn.userInteractionEnabled = tag.enable;
    
    btn.layer.cornerRadius = tag.cornerRadius;
    btn.layer.masksToBounds = YES;
    
    return btn;
}

@end
