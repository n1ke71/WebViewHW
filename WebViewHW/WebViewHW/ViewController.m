//
//  ViewController.m
//  WebViewHW
//
//  Created by Kozaderov Ivan on 22.09.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController () 

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.navigationDelegate = self;
    [self.indicator startAnimating];
    
    self.sourceType = (SourceType)self.currentRow;
    self.sourceNameLabel.text = [self stringFromSorceType:self.sourceType];

    if (self.sourceType == SourceTypeApple || self.sourceType == SourceTypeGoogle) {
        [self loadWEB];
    }else if (self.sourceType == SourceTypeIpad || self.sourceType == SourceTypeIWatch){
        [self loadPDF];
    }

}

- (void)loadWEB{
  
  NSURL *url = [NSURL URLWithString:[self stringFromSorceType:self.sourceType]];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [self.webView loadRequest:request];
    
}

- (void)loadPDF{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[self stringFromSorceType:self.sourceType] ofType:nil];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    [self.webView loadData:fileData MIMEType:@"application/pdf" characterEncodingName:@"UTF-8" baseURL:nil];
    
}

- (NSString *)stringFromSorceType:(SourceType) sourceType{
    
    switch (sourceType) {
        case SourceTypeApple:
            return @"https://www.apple.com";
        case SourceTypeGoogle:
            return @"https://www.google.com";
        case SourceTypeIpad:
            return @"iPad.pdf";
        case SourceTypeIWatch:
            return @"iWatch.pdf";
        default:
            break;
    }
}
#pragma mark - UIWebViewDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;
}


@end
