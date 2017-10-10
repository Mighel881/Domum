#import "DOMController.h"

@implementation DOMController

+ (instancetype)mainController {
    static DOMController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.button = [[DOMButton alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];

        self.window = [[DOMWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.window addSubview:self.button];
    }

    return self;
}

- (void)updateButtonOpacity:(CGFloat)opacity {
    self.button.alpha = opacity;
}

- (void)updateWindowVisibility:(BOOL)visible {
    self.window._secure = visible;
}

- (void)hideButtonForScreenshot {
    if (self.button.hidden) {
        return;
    }

    self.button.hidden = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.button.hidden = NO;
    });
}

@end
