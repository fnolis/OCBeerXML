OCBeerXML 
=========

A BeerXML parser, in the making, written in Objective-C.

Example:
```objc
NSError *error;
NSString *xml = @"..."; // BeerXML data as string.
NSArray *recipies = [OCBeerXML parseRecipes:xml error:&error];
```

This library is in progress...
