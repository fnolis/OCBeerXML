//
//  OCBeerXML.h
//  OCBeerXML
//
//  Created by Ola Rönnerup on 04/03/14.
//  Copyright (c) 2014 Ola Rönnerup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BXRecipe.h"
#import "BXFermentables.h"
//TODO: Add all entities here.

#define BeerXMLErrorDomain @"BeerXMLErrorDomain"
#define BeerXMLErrorRequiredTagMissing	800
#define BeerXMLErrorUnknownError		1701

@interface OCBeerXML : NSObject

/*!
 *	Parses xml data and crunches it into an array with BXRecipies.
 *
 *	@param xml A NSString representing valid BeerXML data.
 *	@param error A NSError pointer pointer. Can be nil.
 *
 *	@returns Returns an array with recipes as BXRecipies that was found in the XML.
 */
+ (NSArray*)parseRecipes:(NSString*)xml error:(NSError**)error;



//! Unit testing...
+ (NSArray*)parseHops:(NSString*)xml;
+ (NSArray*)parseHops:(NSString*)xml error:(NSError**)error;


@end
