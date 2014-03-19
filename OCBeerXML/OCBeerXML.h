//
//  OCBeerXML.h
//  OCBeerXML
//
//  Created by Ola Rönnerup on 04/03/14.
//  Copyright (c) 2014 Ola Rönnerup. All rights reserved.
//

// Define BeerXMLErrors
#define BeerXMLErrorDomain @"BeerXMLErrorDomain"
#define BeerXMLErrorRequiredTagMissing	800
#define BeerXMLErrorUnknownError		1701

// Import...
#import <Foundation/Foundation.h>
#import "BXXmlTags.h"
// all entities...
#import "BXEquipments.h"
#import "BXFermentables.h"
#import "BXHops.h"
#import "BXMiscs.h"
#import "BXStyle.h"
#import "BXWaters.h"
#import "BXYeasts.h"
// ...but add recipie last.
#import "BXRecipe.h"

@interface OCBeerXML : NSObject

/*!
 *	Parses xml data and crunches it into an array with BXRecipies.
 *
 *	@param xml A NSString representing valid BeerXML data.
 *	@param error A NSError pointer pointer. Can be nil.
 *
 *	@returns Returns an array with recipes as BXRecipies that was found in the XML.
 */
+ (NSArray*)parseRecipes:(NSString*)xml error:(NSError* __autoreleasing*)error;

@end
