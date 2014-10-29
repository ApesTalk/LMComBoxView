

//
//  LMContainsLMComboxScrollView.m
//  YouLan
//
//  Created by tkinghr on 14-8-14.
//  Copyright (c) 2014年 YL. All rights reserved.
//

#import "LMContainsLMComboxScrollView.h"
#import "LMComBoxView.h"

@implementation LMContainsLMComboxScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)closeAllTheComBoxView
{
    for(UIView *subView in self.subviews)
    {
        if([subView isKindOfClass:[LMComBoxView class]])
        {
            LMComBoxView *combox = (LMComBoxView *)subView;
            if(combox.isOpen)
            {
                [UIView animateWithDuration:0.3 animations:^{
                    CGRect frame = combox.listTable.frame;
                    frame.size.height = 0;
                    [combox.listTable setFrame:frame];
                } completion:^(BOOL finished){
                    [combox.listTable removeFromSuperview];
                    combox.isOpen = NO;
                    combox.arrow.transform = CGAffineTransformRotate(combox.arrow.transform, DEGREES_TO_RADIANS(180));
                }];
            }
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self closeAllTheComBoxView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
