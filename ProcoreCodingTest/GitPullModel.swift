//
//  GitPullModel.swift
//  ProcoreCodingTest
//
//  Created by Arbi Derhartunian on 7/27/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import Foundation
import Unbox


//this is the Data model I am populating the data from jason and converting to classes using
//unbox library

struct Diff:Unboxable{
    
    var sha:String?
    var filename:String?
    var status:String?
    var additions:Int?
    var deletions:Int?
    var changes:Int?
    var blob_url:String?
    var raw_url:String?
    var contents_url:String?
    var patch:String?
    
    
    init(unboxer: Unboxer) throws {
        
        self.sha =  unboxer.unbox(key: "sha")
        self.filename = unboxer.unbox(key: "filename")
        self.status = unboxer.unbox(key: "status")
        self.additions = unboxer.unbox(key: "additions")
        self.deletions = unboxer.unbox(key: "additions")
        self.changes = unboxer.unbox(key: "changes")
        self.blob_url = unboxer.unbox(key: "blob_url")
        self.raw_url = unboxer.unbox(key: "raw_url")
        self.contents_url = unboxer.unbox(key: "contents_url")
        self.patch = unboxer.unbox(key: "patch")
    }
    
}


struct repo:Unboxable{
    
    
    var id: Int?
    var name: String?
    var full_name:String?
    var owner:user?
 
    init(unboxer: Unboxer) throws {
        
        self.id =  unboxer.unbox(key: "id")
        self.name = unboxer.unbox(key: "name")
        self.full_name = unboxer.unbox(key: "full_name")
        self.owner = unboxer.unbox(key: "owner")
    }
    
    
}

struct user:Unboxable{
    
    
    var login:String?
    var id:Int?
    var avatar_url:String?
    var gravatar_id:String?
    var url:String?
    var html_url:String?
    var followers_url:String?
    var following_url:String?
    var gists_url:String?
    var starred_url:String?
    var subscriptions_url:String?
    var organizations_url:String?
    var repos_url:String?
    var events_url:String?
    var received_events_url:String?
    var type:String?
    var site_admin:Bool?
    
    
    init(unboxer: Unboxer) throws {
         self.id =  unboxer.unbox(key: "id")
         self.login = unboxer.unbox(key: "login")
         self.avatar_url = unboxer.unbox(key: "avatar_url")
         self.gravatar_id = unboxer.unbox(key: "gravatar_id")
         self.url = unboxer.unbox(key: "url")
         self.html_url = unboxer.unbox(key: "html_url")
         self.followers_url = unboxer.unbox(key: "followers_url")
         self.gists_url = unboxer.unbox(key: "gists_url")
         self.starred_url = unboxer.unbox(key: "starred_url")
         self.subscriptions_url = unboxer.unbox(key: "subscription_url")
         self.organizations_url = unboxer.unbox(key: "organization_url")
         self.repos_url = unboxer.unbox(key: "repos_url")
         self.events_url = unboxer.unbox(key: "events_url")
         self.received_events_url = unboxer.unbox(key: "received_events_url")
         self.type = unboxer.unbox(key: "type")
         self.site_admin = unboxer.unbox(key: "site_admin")
    }
   
}



struct GitPullModel{
    
    
    
    var url:String?
    var id:Int?
    var html_url:String?
    var diff_url:String?
    var patch_url:String?
    var issue_url:String?
    var number:Int?
    var state:String?
    var locked:Bool?
    var title:String?
    var user:user?
    var body:String?
    var created_at:Date?
    var updated_at:Date?
    var closed_at:Date?
    var merged_at:Date?
    var review_comments_url:String?
    var review_comment_url:String?
    var comments_url:String?
    var statuses_url:String?
    var assignes:[String]?
    var commits_url:String?
    var requested_reviewers:[String]?
    var repos_url:String?
    var event_url:String?
    var received_events_url:String?
    var type:String?
    var repo:repo?
    let dateFormatter = DateFormatter()
 

}


extension GitPullModel:Unboxable{
    
    
    init(unboxer: Unboxer) throws {
    
    dateFormatter.dateFormat = "YYYY-MM-dd"
    
    self.title =  unboxer.unbox(key: "title")
    self.url =  unboxer.unbox(key: "url")
    self.id =  unboxer.unbox(key: "id")
    self.html_url =  unboxer.unbox(key: "html_url")
    self.patch_url = unboxer.unbox(key: "patch_url")
    self.issue_url = unboxer.unbox(key: "issue_url")
    self.number = unboxer.unbox(key: "number")
    self.state = unboxer.unbox(key: "state")
    self.locked = unboxer.unbox(key: "locked")
    self.user = unboxer.unbox(key: "user")
    self.body = unboxer.unbox(key: "body")
    self.created_at = unboxer.unbox(key: "created_at", formatter: dateFormatter)
    self.updated_at = unboxer.unbox(key: "updated_at", formatter: dateFormatter)
    self.closed_at = unboxer.unbox(key: "closed_at", formatter: dateFormatter)
    self.merged_at = unboxer.unbox(key: "merged_at", formatter: dateFormatter)
    self.review_comment_url = unboxer.unbox(key: "review_comment_url")
    self.review_comments_url = unboxer.unbox(key: "review_comments_url")
    self.comments_url = unboxer.unbox(key: "comments_url")
    self.statuses_url = unboxer.unbox(key: "statuses_url")
    self.assignes = unboxer.unbox(key: "assignes")
    self.commits_url = unboxer.unbox(key: "commits_url")
    self.requested_reviewers =  unboxer.unbox(key: "requestd_reviewers")
    self.repos_url = unboxer.unbox(key: "repos_url")
    self.event_url = unboxer.unbox(key: "event_url")
    self.received_events_url = unboxer.unbox(key: "received_events_url")
    self.type = unboxer.unbox(key: "type")
    self.repo = unboxer.unbox(key: "repo")
    }
    
    
}

