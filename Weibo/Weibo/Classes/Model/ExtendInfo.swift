//
//	ExtendInfo.swift
//
//	Create by 旭 张 on 30/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ExtendInfo : NSObject, NSCoding{

	var weiboCamera : WeiboCamera!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let weiboCameraData = dictionary["weibo_camera"] as? [String:Any]{
			weiboCamera = WeiboCamera(fromDictionary: weiboCameraData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if weiboCamera != nil{
			dictionary["weibo_camera"] = weiboCamera.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         weiboCamera = aDecoder.decodeObject(forKey: "weibo_camera") as? WeiboCamera

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if weiboCamera != nil{
			aCoder.encode(weiboCamera, forKey: "weibo_camera")
		}

	}

}