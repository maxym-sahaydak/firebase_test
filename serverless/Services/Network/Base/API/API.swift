//
//  API.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/20/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation


typealias FailureCallback = (_ errorText: String?) -> ()
typealias SuccessCallback = () -> ()
typealias SuccessWithItemCallback<A> = (A) -> ()
typealias SuccessWithItemsCallback<A> = ([A]) -> ()


//class BaseApi {
//    let referense 
//}
