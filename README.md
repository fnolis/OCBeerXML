OCBeerXML v1.0
=========

A simple to use BeerXML parser written in Objective-C.

Usage
--
Example:
```objc
#import "OCBeerXML.h"

int main(int argc, char *argv[]) {
  NSError *error;
  NSString *xml = @"..."; // BeerXML data as string.

  NSArray *recipies = [OCBeerXML parseRecipes:xml error:&error];

  for(BXRecipe *recipe in recipes) {
      ...
  }
}
```


Roadmap
--
####Version 1.1####
- Add entity extensions (Appendix A)

####Future####
- XML write support
- BeerXML 2
- Create more unit tests
- More documentation
- Better examples


What is BeerXML?
--
BeerXML is a free, fully defined XML data description designed for the exchange of beer brewing recipes and other brewing data.

Read more about BeerXML at http://www.beerxml.com.
