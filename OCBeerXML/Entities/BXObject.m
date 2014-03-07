#import "BXObject.h"
#import "OCBeerXML.h"

@implementation BXObject

- (id)objectInDictionary:(NSDictionary*)data forTag:(NSString*)tag required:(BOOL)required error:(NSError**)error {
	if( [[data objectForKey:tag] objectForKey:@"text"] )
		return [[data objectForKey:tag] objectForKey:@"text"];
	else {
		if( error && required )
			*error = [NSError errorWithDomain:BeerXMLErrorDomain code:BeerXMLErrorRequiredTagMissing userInfo:[NSDictionary dictionaryWithObject:tag forKey:@"MissingTagData"]];
		return nil;
	}
}

@end
