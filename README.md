OCBeerXML
=========

A BeerXML parser written in Objective-C.

Example:
NSError *error;
NSString *xml = @"..."; // BeerXML data as string.
NSArray *recipies = [OCBeerXML parseRecipes:xml error:&error];
