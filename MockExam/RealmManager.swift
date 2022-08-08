//
//  RealmManager.swift
//  ToDo
//
//  Created by Jessie sihota on 2022-07-18.
//

/// Reference: https://github.com/HarmanTiwana901/realmdbapp/blob/main/realmdb/ToDo/RealmManager.swift

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published var users: [User] = []

    // On initialize of the class, we'll open a Realm and get the tasks saved in the Realm
    init() {
        openRealm()
        
    }

    // Function to open a Realm (like a box) - needed for saving data inside of the Realm
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)

            Realm.Configuration.defaultConfiguration = config

            // Trying to open a Realm and saving it into the localRealm variable
            localRealm = try Realm()
        } catch {
            print("Error opening Realm", error)
        }
    }

    
    // Function to add a task
    func addUser(email: String, password: String) {
        if let localRealm = localRealm { // Need to unwrap optional, since localRealm is optional
            do {
                // Trying to write to the localRealm
                try localRealm.write {
                    // Creating a new Task
                
                    let newUser = User(value: ["email": email, "password": password])
                   
                    // Adding newTask to localRealm
                    localRealm.add(newUser)
                    
                    // Re-setting the tasks array
                  
                    print("Added new user to Realm!", newUser)
                }
            } catch {
                print("Error adding user to Realm: \(error)")
            }
        }
    }
    
    func getUser(email: String, password: String) -> Int {
        if let localRealm = localRealm {
            
            let allUsers = localRealm.objects(User.self).sorted(byKeyPath: "email")
            
            // Resetting the tasks array
            users = []
            
            // Append each task to the tasks array
            allUsers.forEach { user in
                users.append(user)
            }
            
            for user in users {
                if email == user.email && password == user.password {
                    print("Logged In!")
                    return 1
                }
            }
            
            return 0
            
            
        }
        return 0
    }
}

