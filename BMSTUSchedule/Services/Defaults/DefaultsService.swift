//
//  DefaultsService.swift
//  BMSTUSchedule
//
//  Created by Artem Belkov on 17/05/2019.
//  Copyright © 2019 BMSTU Team. All rights reserved.
//

import Foundation

class DefaultsService {

    private let database = UserDefaults.standard
    
    private let userEmailKey = "userEmail"
    private let userGroupIDKey = "userGroupID"
    private let userScheduleIDKey = "userScheduleID"
    private let sessionTokenKey = "sessionToken"
    private let sessionExpiresAtKey = "sessionExpiresAt"
    private let offlineModeKey = "offlineMode"

    /// User e-mail
    var userEmail: String? {
        get {
            return database.string(forKey: userEmailKey)
        }
        
        set(newValue) {
            guard let newEmail = newValue else { return }
            
            // Save email to UserDefaults
            database.set(newEmail, forKey: userEmailKey)
        }
    }
    
    /// User group ID
    var userGroupID: Model.ID? {
        get {
            let groupID = database.integer(forKey: userGroupIDKey)
            guard groupID != 0 else { return nil }
            return groupID
        }
        
        set(newValue) {
            guard let newID = newValue else { return }
            
            // Save group ID to UserDefaults
            database.set(newID, forKey: userGroupIDKey)
        }
    }
    
    /// User schedule ID
    var userScheduleID: Model.ID? {
        get {
            let scheduleID = database.integer(forKey: userScheduleIDKey)
            guard scheduleID != 0 else { return nil }
            return scheduleID
        }
        
        set(newValue) {
            guard let newID = newValue else { return }
            
            // Save schedule ID to UserDefaults
            database.set(newID, forKey: userScheduleIDKey)
        }
    }
    
    /// Session
    var session: Session? {
        get {
            guard let email = userEmail, let token = database.string(forKey: sessionTokenKey), let expiresAt = database.object(forKey: sessionExpiresAtKey) as? Date else {
                return nil
            }
            
            return Session(email: email, token: token, expiresAt: expiresAt)
        }
        
        set(newValue)  {
            guard let newSession = newValue else { return }

            userEmail = newSession.email
            database.set(newSession.token, forKey: sessionTokenKey)
            database.set(newSession.expiresAt, forKey: sessionExpiresAtKey)
        }
    }
    
    /// Offline mode
    var offlineMode: Bool {
        get {
            let mode = database.bool(forKey: offlineModeKey)
            return mode
        }
        
        set(newValue) {
            database.set(newValue, forKey: offlineModeKey)
        }
    }
}