//
//  Medium.swift
//  Workout
//
//  Created by rnathan on 3/13/21.
//

import Foundation

enum MediumWorkout {
    struct Squat: Workout, Hashable {
        let title: String = "Squats"
        let difficulty: WorkoutDifficulty = .medium
    }

    static func workouts() -> [Workout] {
        return [Squat()]
    }
}
