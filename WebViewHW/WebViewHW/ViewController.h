//
//  ViewController.h
//  WebViewHW
//
//  Created by Kozaderov Ivan on 22.09.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

typedef enum {
    SourceTypeApple,
    SourceTypeGoogle,
    SourceTypeIpad,
    SourceTypeIWatch
} SourceType;

@interface ViewController : UIViewController <WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *sourceNameLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property(assign,nonatomic) SourceType sourceType;
@property (assign, nonatomic) NSInteger currentRow;
@end

