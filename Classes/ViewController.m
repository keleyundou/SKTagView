//
//  ViewController.m
//  WrapViewWithAutolayout
//
//  Created by shiweifu on 12/9/14.
//  Copyright (c) 2014 shiweifu. All rights reserved.
//

#import "ViewController.h"
#import "SKTagView.h"
#import <Masonry/Masonry.h>
#import <HexColors/HexColor.h>

@interface ViewController ()
@property (strong, nonatomic) SKTagView *tagView;
@property (nonatomic, strong) NSArray *colorPool;

@property (weak, nonatomic) IBOutlet UITextField *index;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.colorPool = @[@"#7ecef4", @"#84ccc9", @"#88abda",@"#7dc1dd",@"#b6b8de"];
    
    [self setupTagView];
}

- (void)setupTagView
{
    self.tagView = ({
        SKTagView *view = [SKTagView new];
        view.backgroundColor = UIColor.whiteColor;
        view.padding    = UIEdgeInsetsMake(12, 12, 12, 12);
        view.insets    = 15;
        view.lineSpace = 10;
        __weak SKTagView *weakView = view;(void)weakView;
        view.didClickTagAtIndex = ^(NSUInteger index, SKTagButton *btn){
            //Remove tag
//            [weakView removeTagAtIndex:index];
            btn.selected = !btn.selected;
        };
        view;
    });
    [self.view addSubview:self.tagView];
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *superView = self.view;
        make.centerY.equalTo(superView.mas_centerY).with.offset(0);
        make.leading.equalTo(superView.mas_leading).with.offset(0);
        make.trailing.equalTo(superView.mas_trailing);
    }];
    
    //Add Tags
    [@[@"Python", @"Javascript", @"Python", @"HTML", @"Go", @"Objective-C",@"C", @"PHP"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         SKTag *tag = [SKTag tagWithText:obj];
         tag.textColor = [UIColor colorWithHexString:@"#0a70ba"];
         tag.selectedTextColor = [UIColor whiteColor];
         tag.fontSize = 15;
         tag.font = [UIFont fontWithName:@"Courier" size:15];
         tag.padding = UIEdgeInsetsMake(13.5, 12.5, 13.5, 12.5);
         tag.bgColor = tag.bgColor = [UIColor whiteColor];
         //[UIColor colorWithHexString:self.colorPool[idx % self.colorPool.count]];
         tag.bgSelectedImg = [tag imageWithColor:[UIColor colorWithHexString:@"#0a70ba"]];
         tag.cornerRadius = 5;
         tag.borderWidth = 1;
         tag.borderColor = [UIColor colorWithHexString:@"#0a70ba"];
         if (idx == 1 || idx == 3) {
             tag.selected = YES;
         }
         [self.tagView addTag:tag];
     }];
}

#pragma mark - User interactions
- (IBAction)onAdd:(id)sender
{
    SKTag *tag = [SKTag tagWithText:@"New Lang"];
    tag.textColor = [UIColor whiteColor];
    tag.fontSize = 15;
    tag.padding = UIEdgeInsetsMake(13.5, 12.5, 13.5, 12.5);
    tag.bgColor = [UIColor colorWithHexString:self.colorPool[arc4random() % self.colorPool.count]];
    tag.cornerRadius = 5;
    
    [self.tagView addTag:tag];
}

- (IBAction)onInsert:(id)sender
{
    SKTag *tag = [SKTag tagWithText:[NSString stringWithFormat:@"Insert(%ld)",(long)self.index.text.integerValue]];
    tag.textColor = [UIColor whiteColor];
    tag.fontSize = 15;
    tag.padding = UIEdgeInsetsMake(13.5, 12.5, 13.5, 12.5);
    tag.bgColor = [UIColor colorWithHexString:self.colorPool[arc4random() % self.colorPool.count]];
    tag.cornerRadius = 5;
    
    [self.tagView insertTag:tag atIndex:self.index.text.integerValue];
}

- (IBAction)onRemove:(id)sender
{
    [self.tagView removeTagAtIndex:self.index.text.integerValue];
}

- (IBAction)onRemoveAll:(id)sender
{
    [self.tagView removeAllTags];
}

- (IBAction)onTapBg:(id)sender
{
    [self.view endEditing:YES];
}

@end
