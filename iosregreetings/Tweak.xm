/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
	%orig;
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello word" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];

   //  CNFRegController *controller = [CNFRegController controllerForServiceType:1];
   //  IMAccount *account =[controller beginAccountSetupWithLogin:@"yuansc@being.com" password:@"niHao2015" foundExisting:NO];
   // if ([controller setAliases:@[@"yuansc@being.com"] onAccount:account])
   // {
  	// 	if ([account CNFRegSignInComplete])
  	// 	 	{
  	// 	 		/* code */
  	// 	 		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"IMessage login succeed" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
   //  			[alertView show];
  	// 	 	} 	
   // }
}

%end