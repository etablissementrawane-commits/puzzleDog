#import <AppTrackingTransparency/AppTrackingTransparency.h>

extern "C"
{
    int PDMTrackingAuthorizationStatus()
    {
        if (@available(iOS 14.0, *))
        {
            return (int)[ATTrackingManager trackingAuthorizationStatus];
        }

        // iOS versions before ATT do not show this prompt.
        return 1;
    }

    void PDMRequestTrackingAuthorization()
    {
        if (@available(iOS 14.0, *))
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
                    // Unity Ads reads the resulting system setting. No action is needed here.
                }];
            });
        }
    }
}
