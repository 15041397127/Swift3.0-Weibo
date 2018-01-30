//
//	RootClass.swift
//
//	Create by 旭 张 on 30/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import YYModel

class RootClass : NSObject, NSCoding{

	var ad : [AnyObject]!
	var advertises : [AnyObject]!
	var hasUnread : Int!
	var hasvisible : Bool!
	var interval : Int!
	var maxId : Int!
	var nextCursor : Int!
	var previousCursor : Int!
	var sinceId : Int!
	var statuses : [Statuse]!
	var totalNumber : Int!
	var uveBlank : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		ad = dictionary["ad"] as? [AnyObject]
		advertises = dictionary["advertises"] as? [AnyObject]
		hasUnread = dictionary["has_unread"] as? Int
		hasvisible = dictionary["hasvisible"] as? Bool
		interval = dictionary["interval"] as? Int
		maxId = dictionary["max_id"] as? Int
		nextCursor = dictionary["next_cursor"] as? Int
		previousCursor = dictionary["previous_cursor"] as? Int
		sinceId = dictionary["since_id"] as? Int
		statuses = [Statuse]()
		if let statusesArray = dictionary["statuses"] as? [[String:Any]]{
			for dic in statusesArray{
				let value = Statuse(fromDictionary: dic)
				statuses.append(value)
			}
		}
		totalNumber = dictionary["total_number"] as? Int
		uveBlank = dictionary["uve_blank"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if ad != nil{
			dictionary["ad"] = ad
		}
		if advertises != nil{
			dictionary["advertises"] = advertises
		}
		if hasUnread != nil{
			dictionary["has_unread"] = hasUnread
		}
		if hasvisible != nil{
			dictionary["hasvisible"] = hasvisible
		}
		if interval != nil{
			dictionary["interval"] = interval
		}
		if maxId != nil{
			dictionary["max_id"] = maxId
		}
		if nextCursor != nil{
			dictionary["next_cursor"] = nextCursor
		}
		if previousCursor != nil{
			dictionary["previous_cursor"] = previousCursor
		}
		if sinceId != nil{
			dictionary["since_id"] = sinceId
		}
		if statuses != nil{
			var dictionaryElements = [[String:Any]]()
			for statusesElement in statuses {
				dictionaryElements.append(statusesElement.toDictionary())
			}
			dictionary["statuses"] = dictionaryElements
		}
		if totalNumber != nil{
			dictionary["total_number"] = totalNumber
		}
		if uveBlank != nil{
			dictionary["uve_blank"] = uveBlank
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         ad = aDecoder.decodeObject(forKey: "ad") as? [AnyObject]
         advertises = aDecoder.decodeObject(forKey: "advertises") as? [AnyObject]
         hasUnread = aDecoder.decodeObject(forKey: "has_unread") as? Int
         hasvisible = aDecoder.decodeObject(forKey: "hasvisible") as? Bool
         interval = aDecoder.decodeObject(forKey: "interval") as? Int
         maxId = aDecoder.decodeObject(forKey: "max_id") as? Int
         nextCursor = aDecoder.decodeObject(forKey: "next_cursor") as? Int
         previousCursor = aDecoder.decodeObject(forKey: "previous_cursor") as? Int
         sinceId = aDecoder.decodeObject(forKey: "since_id") as? Int
         statuses = aDecoder.decodeObject(forKey :"statuses") as? [Statuse]
         totalNumber = aDecoder.decodeObject(forKey: "total_number") as? Int
         uveBlank = aDecoder.decodeObject(forKey: "uve_blank") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if ad != nil{
			aCoder.encode(ad, forKey: "ad")
		}
		if advertises != nil{
			aCoder.encode(advertises, forKey: "advertises")
		}
		if hasUnread != nil{
			aCoder.encode(hasUnread, forKey: "has_unread")
		}
		if hasvisible != nil{
			aCoder.encode(hasvisible, forKey: "hasvisible")
		}
		if interval != nil{
			aCoder.encode(interval, forKey: "interval")
		}
		if maxId != nil{
			aCoder.encode(maxId, forKey: "max_id")
		}
		if nextCursor != nil{
			aCoder.encode(nextCursor, forKey: "next_cursor")
		}
		if previousCursor != nil{
			aCoder.encode(previousCursor, forKey: "previous_cursor")
		}
		if sinceId != nil{
			aCoder.encode(sinceId, forKey: "since_id")
		}
		if statuses != nil{
			aCoder.encode(statuses, forKey: "statuses")
		}
		if totalNumber != nil{
			aCoder.encode(totalNumber, forKey: "total_number")
		}
		if uveBlank != nil{
			aCoder.encode(uveBlank, forKey: "uve_blank")
		}

	}

}
