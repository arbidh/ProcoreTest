//
//  GitPullDataService.swift
//  ProcoreCodingTest
//
//  Created by Rinie Ghazali on 7/27/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import Foundation
import Alamofire
import Unbox
import UnboxedAlamofire

public enum ResponsErrorType:String{
    
    case apiErrorType = "API Error"
    case otherErrorType = "Other Error"
}



public struct URLString{
    
     static let pullURL:String = "https://api.github.com/repos/JohnSundell/Unbox/pulls"
    
    
}



class GitPullDataService{
    
    func fetchPullDataFromGitHubWithURL(success:@escaping ((_ imageData:[GitPullModel])->Void) , fail:@escaping ((_ error:Error, _ errorType:ResponsErrorType)->Void)){
    
        
        Alamofire.request(URLString.pullURL).responseArray { (resp:DataResponse<[GitPullModel]>) in
      
            if let data:[GitPullModel] = resp.result.value{
                success(data)
            }
            else {
                if let error = resp.result.error{
                    fail(error,ResponsErrorType.apiErrorType)
                }
            }
    
        }
        
    }
    
    
    func fetchDiffDataFromGitHubWithURL(fileNumber:Int,   success:@escaping ((_ diffData:[Diff])->Void) , fail:@escaping ((_ error:Error, _ errorType:ResponsErrorType)->Void)){
        
        let diffURL = URLString.pullURL + "/\(fileNumber)/files"
        
        Alamofire.request(diffURL).responseArray { (resp:DataResponse<[Diff]>) in
            
            if let data:[Diff] = resp.result.value{
                success(data)
            }
            else {
                if let error = resp.result.error{
                    fail(error,ResponsErrorType.apiErrorType)
                }
            }
            
        }
        
    }
    
    
}
