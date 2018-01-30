//
//	PicUrl.swift
//
//	Create by 旭 张 on 30/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class PicUrl : NSObject, NSCoding{

	var thumbnailPic : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		thumbnailPic = dictionary["thumbnail_pic"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if thumbnailPic != nil{
			dictionary["thumbnail_pic"] = thumbnailPic
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         thumbnailPic = aDecoder.decodeObject(forKey: "thumbnail_pic") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if thumbnailPic != nil{
			aCoder.encode(thumbnailPic, forKey: "thumbnail_pic")
		}

	}

}