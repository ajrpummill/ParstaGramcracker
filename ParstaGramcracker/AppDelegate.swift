//
//  AppDelegate.swift
//  ParstaGramcracker
//
//  Created by Anthony Pummill on 11/10/19.
//  Copyright © 2019 ajrpummill@gmail.com. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   
    // this function is called once, right when the application opens.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //This connects your client app to your parse server you set up
        Parse.initialize(
        with: ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) -> Void in
            // below is what was made when heroku was setup
            configuration.applicationId = "ParstaGramcracker"
            // below is the URL that was given by heroku (Parse Server)
            configuration.server = "https://parstagramcracker.herokuapp.com/parse"
        })
    )
       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

