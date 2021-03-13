//
//  Easy.swift
//  Workout
//
//  Created by rnathan on 3/13/21.
//

import Foundation

enum EasyWorkout {
    struct BicepCurl: Workout, Hashable {
        let title: String = "Bicep curl"
        let difficulty: WorkoutDifficulty = .easy
    }

    static func workouts() -> [Workout] {
        return [BicepCurl()]
    }
}
