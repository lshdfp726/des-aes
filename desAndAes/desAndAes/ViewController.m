//
//  ViewController.m
//  desAndAes
//
//  Created by 刘松洪 on 16/10/10.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import "ViewController.h"
#import "DesAndAes.h"


static NSString *keyStr = @"12345678";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)EncryptAction:(id)sender {
    
   self.EncryptLabel.text =  [DesAndAes encrypt:self.inputText.text encryptOrDecrypt:Encrypt key:keyStr];
}

- (IBAction)DecryptAction:(id)sender {

   self.DecryptLabel.text = [DesAndAes encrypt:self.EncryptLabel.text encryptOrDecrypt:Decrypt key:keyStr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
