#import "WebBrowserViewController.h"

@implementation WebBrowserViewController
@synthesize webView = mWebView;

- (void)dealloc
{
    [mWebView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    NSURL* url = [NSURL URLWithString:@"http://rainy-today.appspot.com"];
    // @todo pass location with query string
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


- (void)viewDidUnload
{
    self.webView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

// MARK: -
// MARK: Debugging methods
- (NSString*)navigationTypeToString:(UIWebViewNavigationType)navigationType
{
    switch(navigationType)
    {
        case UIWebViewNavigationTypeFormSubmitted:
            return @"UIWebViewNavigationTypeFormSubmitted";
        case UIWebViewNavigationTypeBackForward:
            return @"UIWebViewNavigationTypeBackForward";
        case UIWebViewNavigationTypeReload:
            return @"UIWebViewNavigationTypeReload";
        case UIWebViewNavigationTypeFormResubmitted:
            return @"UIWebViewNavigationTypeReload";
        case UIWebViewNavigationTypeOther:
            return @"UIWebViewNavigationTypeOther";
            
    }
    return @"Unexpected/unknown";
}

@end
