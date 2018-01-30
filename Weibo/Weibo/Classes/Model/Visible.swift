//
//	Visible.swift
//
//	Create by 旭 张 on 30/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Visible : NSObject, NSCoding{

	var listId : Int!
	var type : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		listId = dictionary["list_id"] as? Int
		type = dictionary["type"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if listId != nil{
			dictionary["list_id"] = listId
		}
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         listId = aDecoder.decodeObject(forKey: "list_id") as? Int
         type = aDecoder.decodeObject(forKey: "type") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if listId != nil{
			aCoder.encode(listId, forKey: "list_id")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}