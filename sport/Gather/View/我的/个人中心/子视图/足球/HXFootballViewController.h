//
//  HXFootballViewController.h
//  QCGlobalSport
//
//  Created by test on 2020/2/12.
//  Copyright © 2020 com.qqty. All rights reserved.
//






#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXFootballViewController : UIViewController
{
UISegmentedControl *segmentedControl;
UIView *sview;
}
@property(nonatomic,strong)UITableView *leftTableView;
@property(nonatomic,strong)UITableView *centerTableView;
@property(nonatomic,strong)UITableView *cellTableView;
@end


NS_ASSUME_NONNULL_END
