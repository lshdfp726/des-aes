//
//  ViewController.h
//  desAndAes
//
//  Created by 刘松洪 on 16/10/10.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *inputText;

@property (strong, nonatomic) IBOutlet UILabel *EncryptLabel;
@property (strong, nonatomic) IBOutlet UILabel *DecryptLabel;
@property (strong, nonatomic) IBOutlet UIButton *EncryptBtn;
@property (strong, nonatomic) IBOutlet UIButton *DecryptBtn;

@end

