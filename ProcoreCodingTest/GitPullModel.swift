//
//  GitPullModel.swift
//  ProcoreCodingTest
//
//  Created by Rinie Ghazali on 7/27/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import Foundation
import Unbox




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
 
//    "updated_at": "2017-07-18T10:08:35Z",
//    "closed_at": null,
//    "merged_at": null,
//    "merge_commit_sha": "3ce5aaf1a1e0502d957b9e1b46b3b5ee0bb4aab9",
//    "assignee": null,
//    "assignees": [
//    
//    ],
//    "requested_reviewers": [
//    
//    ],
//    "milestone": null,
//    "commits_url": "https://api.github.com/repos/JohnSundell/Unbox/pulls/199/commits",
//    "review_comments_url": "https://api.github.com/repos/JohnSundell/Unbox/pulls/199/comments",
//    "review_comment_url": "https://api.github.com/repos/JohnSundell/Unbox/pulls/comments{/number}",
//    "comments_url": "https://api.github.com/repos/JohnSundell/Unbox/issues/199/comments",
//    "statuses_url": "https://api.github.com/repos/JohnSundell/Unbox/statuses/7c40cb4ef5aca8bfc00eda3eeea5e246e9a15f52",
//    "head": {
//    "label": "mr-v:keypath_ending_issue",
//    "ref": "keypath_ending_issue",
//    "sha": "7c40cb4ef5aca8bfc00eda3eeea5e246e9a15f52",
//    "user": {
//    "login": "mr-v",
//    "id": 830743,
//    "avatar_url": "https://avatars2.githubusercontent.com/u/830743?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/mr-v",
//    "html_url": "https://github.com/mr-v",
//    "followers_url": "https://api.github.com/users/mr-v/followers",
//    "following_url": "https://api.github.com/users/mr-v/following{/other_user}",
//    "gists_url": "https://api.github.com/users/mr-v/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/mr-v/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/mr-v/subscriptions",
//    "organizations_url": "https://api.github.com/users/mr-v/orgs",
//    "repos_url": "https://api.github.com/users/mr-v/repos",
//    "events_url": "https://api.github.com/users/mr-v/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/mr-v/received_events",
//    "type": "User",
//    "site_admin": false
//    },
//    "repo": {
//    "id": 43841585,
//    "name": "Unbox",
//    "full_name": "mr-v/Unbox",
//    "owner": {
//    "login": "mr-v",
//    "id": 830743,
//    "avatar_url": "https://avatars2.githubusercontent.com/u/830743?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/mr-v",
//    "html_url": "https://github.com/mr-v",
//    "followers_url": "https://api.github.com/users/mr-v/followers",
//    "following_url": "https://api.github.com/users/mr-v/following{/other_user}",
//    "gists_url": "https://api.github.com/users/mr-v/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/mr-v/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/mr-v/subscriptions",
//    "organizations_url": "https://api.github.com/users/mr-v/orgs",
//    "repos_url": "https://api.github.com/users/mr-v/repos",
//    "events_url": "https://api.github.com/users/mr-v/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/mr-v/received_events",
//    "type": "User",
//    "site_admin": false
//    },
//    "private": false,
//    "html_url": "https://github.com/mr-v/Unbox",
//    "description": "The easy to use Swift JSON decoder",
//    "fork": true,
//    "url": "https://api.github.com/repos/mr-v/Unbox",
//    "forks_url": "https://api.github.com/repos/mr-v/Unbox/forks",
//    "keys_url": "https://api.github.com/repos/mr-v/Unbox/keys{/key_id}",
//    "collaborators_url": "https://api.github.com/repos/mr-v/Unbox/collaborators{/collaborator}",
//    "teams_url": "https://api.github.com/repos/mr-v/Unbox/teams",
//    "hooks_url": "https://api.github.com/repos/mr-v/Unbox/hooks",
//    "issue_events_url": "https://api.github.com/repos/mr-v/Unbox/issues/events{/number}",
//    "events_url": "https://api.github.com/repos/mr-v/Unbox/events",
//    "assignees_url": "https://api.github.com/repos/mr-v/Unbox/assignees{/user}",
//    "branches_url": "https://api.github.com/repos/mr-v/Unbox/branches{/branch}",
//    "tags_url": "https://api.github.com/repos/mr-v/Unbox/tags",
//    "blobs_url": "https://api.github.com/repos/mr-v/Unbox/git/blobs{/sha}",
//    "git_tags_url": "https://api.github.com/repos/mr-v/Unbox/git/tags{/sha}",
//    "git_refs_url": "https://api.github.com/repos/mr-v/Unbox/git/refs{/sha}",
//    "trees_url": "https://api.github.com/repos/mr-v/Unbox/git/trees{/sha}",
//    "statuses_url": "https://api.github.com/repos/mr-v/Unbox/statuses/{sha}",
//    "languages_url": "https://api.github.com/repos/mr-v/Unbox/languages",
//    "stargazers_url": "https://api.github.com/repos/mr-v/Unbox/stargazers",
//    "contributors_url": "https://api.github.com/repos/mr-v/Unbox/contributors",
//    "subscribers_url": "https://api.github.com/repos/mr-v/Unbox/subscribers",
//    "subscription_url": "https://api.github.com/repos/mr-v/Unbox/subscription",
//    "commits_url": "https://api.github.com/repos/mr-v/Unbox/commits{/sha}",
//    "git_commits_url": "https://api.github.com/repos/mr-v/Unbox/git/commits{/sha}",
//    "comments_url": "https://api.github.com/repos/mr-v/Unbox/comments{/number}",
//    "issue_comment_url": "https://api.github.com/repos/mr-v/Unbox/issues/comments{/number}",
//    "contents_url": "https://api.github.com/repos/mr-v/Unbox/contents/{+path}",
//    "compare_url": "https://api.github.com/repos/mr-v/Unbox/compare/{base}...{head}",
//    "merges_url": "https://api.github.com/repos/mr-v/Unbox/merges",
//    "archive_url": "https://api.github.com/repos/mr-v/Unbox/{archive_format}{/ref}",
//    "downloads_url": "https://api.github.com/repos/mr-v/Unbox/downloads",
//    "issues_url": "https://api.github.com/repos/mr-v/Unbox/issues{/number}",
//    "pulls_url": "https://api.github.com/repos/mr-v/Unbox/pulls{/number}",
//    "milestones_url": "https://api.github.com/repos/mr-v/Unbox/milestones{/number}",
//    "notifications_url": "https://api.github.com/repos/mr-v/Unbox/notifications{?since,all,participating}",
//    "labels_url": "https://api.github.com/repos/mr-v/Unbox/labels{/name}",
//    "releases_url": "https://api.github.com/repos/mr-v/Unbox/releases{/id}",
//    "deployments_url": "https://api.github.com/repos/mr-v/Unbox/deployments",
//    "created_at": "2015-10-07T20:00:56Z",
//    "updated_at": "2015-10-07T20:00:57Z",
//    "pushed_at": "2017-07-18T10:07:26Z",
//    "git_url": "git://github.com/mr-v/Unbox.git",
//    "ssh_url": "git@github.com:mr-v/Unbox.git",
//    "clone_url": "https://github.com/mr-v/Unbox.git",
//    "svn_url": "https://github.com/mr-v/Unbox",
//    "homepage": null,
//    "size": 865,
//    "stargazers_count": 0,
//    "watchers_count": 0,
//    "language": "Swift",
//    "has_issues": false,
//    "has_projects": true,
//    "has_downloads": true,
//    "has_wiki": true,
//    "has_pages": false,
//    "forks_count": 0,
//    "mirror_url": null,
//    "open_issues_count": 0,
//    "forks": 0,
//    "open_issues": 0,
//    "watchers": 0,
//    "default_branch": "master"
//    }
//    },
//    "base": {
//    "label": "JohnSundell:master",
//    "ref": "master",
//    "sha": "a6ba613c1b841ea40a34494b6ae2408f38a86552",
//    "user": {
//    "login": "JohnSundell",
//    "id": 2466701,
//    "avatar_url": "https://avatars3.githubusercontent.com/u/2466701?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/JohnSundell",
//    "html_url": "https://github.com/JohnSundell",
//    "followers_url": "https://api.github.com/users/JohnSundell/followers",
//    "following_url": "https://api.github.com/users/JohnSundell/following{/other_user}",
//    "gists_url": "https://api.github.com/users/JohnSundell/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/JohnSundell/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/JohnSundell/subscriptions",
//    "organizations_url": "https://api.github.com/users/JohnSundell/orgs",
//    "repos_url": "https://api.github.com/users/JohnSundell/repos",
//    "events_url": "https://api.github.com/users/JohnSundell/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/JohnSundell/received_events",
//    "type": "User",
//    "site_admin": false
//    },
//    "repo": {
//    "id": 36896680,
//    "name": "Unbox",
//    "full_name": "JohnSundell/Unbox",
//    "owner": {
//    "login": "JohnSundell",
//    "id": 2466701,
//    "avatar_url": "https://avatars3.githubusercontent.com/u/2466701?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/JohnSundell",
//    "html_url": "https://github.com/JohnSundell",
//    "followers_url": "https://api.github.com/users/JohnSundell/followers",
//    "following_url": "https://api.github.com/users/JohnSundell/following{/other_user}",
//    "gists_url": "https://api.github.com/users/JohnSundell/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/JohnSundell/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/JohnSundell/subscriptions",
//    "organizations_url": "https://api.github.com/users/JohnSundell/orgs",
//    "repos_url": "https://api.github.com/users/JohnSundell/repos",
//    "events_url": "https://api.github.com/users/JohnSundell/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/JohnSundell/received_events",
//    "type": "User",
//    "site_admin": false
//    },
//    "private": false,
//    "html_url": "https://github.com/JohnSundell/Unbox",
//    "description": "The easy to use Swift JSON decoder",
//    "fork": false,
//    "url": "https://api.github.com/repos/JohnSundell/Unbox",
//    "forks_url": "https://api.github.com/repos/JohnSundell/Unbox/forks",
//    "keys_url": "https://api.github.com/repos/JohnSundell/Unbox/keys{/key_id}",
//    "collaborators_url": "https://api.github.com/repos/JohnSundell/Unbox/collaborators{/collaborator}",
//    "teams_url": "https://api.github.com/repos/JohnSundell/Unbox/teams",
//    "hooks_url": "https://api.github.com/repos/JohnSundell/Unbox/hooks",
//    "issue_events_url": "https://api.github.com/repos/JohnSundell/Unbox/issues/events{/number}",
//    "events_url": "https://api.github.com/repos/JohnSundell/Unbox/events",
//    "assignees_url": "https://api.github.com/repos/JohnSundell/Unbox/assignees{/user}",
//    "branches_url": "https://api.github.com/repos/JohnSundell/Unbox/branches{/branch}",
//    "tags_url": "https://api.github.com/repos/JohnSundell/Unbox/tags",
//    "blobs_url": "https://api.github.com/repos/JohnSundell/Unbox/git/blobs{/sha}",
//    "git_tags_url": "https://api.github.com/repos/JohnSundell/Unbox/git/tags{/sha}",
//    "git_refs_url": "https://api.github.com/repos/JohnSundell/Unbox/git/refs{/sha}",
//    "trees_url": "https://api.github.com/repos/JohnSundell/Unbox/git/trees{/sha}",
//    "statuses_url": "https://api.github.com/repos/JohnSundell/Unbox/statuses/{sha}",
//    "languages_url": "https://api.github.com/repos/JohnSundell/Unbox/languages",
//    "stargazers_url": "https://api.github.com/repos/JohnSundell/Unbox/stargazers",
//    "contributors_url": "https://api.github.com/repos/JohnSundell/Unbox/contributors",
//    "subscribers_url": "https://api.github.com/repos/JohnSundell/Unbox/subscribers",
//    "subscription_url": "https://api.github.com/repos/JohnSundell/Unbox/subscription",
//    "commits_url": "https://api.github.com/repos/JohnSundell/Unbox/commits{/sha}",
//    "git_commits_url": "https://api.github.com/repos/JohnSundell/Unbox/git/commits{/sha}",
//    "comments_url": "https://api.github.com/repos/JohnSundell/Unbox/comments{/number}",
//    "issue_comment_url": "https://api.github.com/repos/JohnSundell/Unbox/issues/comments{/number}",
//    "contents_url": "https://api.github.com/repos/JohnSundell/Unbox/contents/{+path}",
//    "compare_url": "https://api.github.com/repos/JohnSundell/Unbox/compare/{base}...{head}",
//    "merges_url": "https://api.github.com/repos/JohnSundell/Unbox/merges",
//    "archive_url": "https://api.github.com/repos/JohnSundell/Unbox/{archive_format}{/ref}",
//    "downloads_url": "https://api.github.com/repos/JohnSundell/Unbox/downloads",
//    "issues_url": "https://api.github.com/repos/JohnSundell/Unbox/issues{/number}",
//    "pulls_url": "https://api.github.com/repos/JohnSundell/Unbox/pulls{/number}",
//    "milestones_url": "https://api.github.com/repos/JohnSundell/Unbox/milestones{/number}",
//    "notifications_url": "https://api.github.com/repos/JohnSundell/Unbox/notifications{?since,all,participating}",
//    "labels_url": "https://api.github.com/repos/JohnSundell/Unbox/labels{/name}",
//    "releases_url": "https://api.github.com/repos/JohnSundell/Unbox/releases{/id}",
//    "deployments_url": "https://api.github.com/repos/JohnSundell/Unbox/deployments",
//    "created_at": "2015-06-04T21:35:32Z",
//    "updated_at": "2017-07-24T22:52:22Z",
//    "pushed_at": "2017-07-18T10:08:36Z",
//    "git_url": "git://github.com/JohnSundell/Unbox.git",
//    "ssh_url": "git@github.com:JohnSundell/Unbox.git",
//    "clone_url": "https://github.com/JohnSundell/Unbox.git",
//    "svn_url": "https://github.com/JohnSundell/Unbox",
//    "homepage": null,
//    "size": 890,
//    "stargazers_count": 1641,
//    "watchers_count": 1641,
//    "language": "Swift",
//    "has_issues": true,
//    "has_projects": true,
//    "has_downloads": true,
//    "has_wiki": true,
//    "has_pages": false,
//    "forks_count": 115,
//    "mirror_url": null,
//    "open_issues_count": 18,
//    "forks": 115,
//    "open_issues": 18,
//    "watchers": 1641,
//    "default_branch": "master"
//    }
//    },
//    "_links": {
//    "self": {
//    "href": "https://api.github.com/repos/JohnSundell/Unbox/pulls/199"
//    },
//    "html": {
//    "href": "https://github.com/JohnSundell/Unbox/pull/199"
//    },
//    "issue": {
//    "href": "https://api.github.com/repos/JohnSundell/Unbox/issues/199"
//    },
//    "comments": {
//    "href": "https://api.github.com/repos/JohnSundell/Unbox/issues/199/comments"
//    },
//    "review_comments": {
//    "href": "https://api.github.com/repos/JohnSundell/Unbox/pulls/199/comments"
//    },
//    "review_comment": {
//    "href": "https://api.github.com/repos/JohnSundell/Unbox/pulls/comments{/number}"
//    },
//    "commits": {
//    "href": "https://api.github.com/repos/JohnSundell/Unbox/pulls/199/commits"
//    },
//    "statuses": {
//    "href": "https://api.github.com/repos/JohnSundell/Unbox/statuses/7c40cb4ef5aca8bfc00eda3eeea5e246e9a15f52"
//    }
//    }
//},


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

