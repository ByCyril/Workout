//
//  Hard.swift
//  Workout
//
//  Created by rnathan on 3/13/21.
//

import Foundation

enum HardWorkout {
    struct Pushup: Workout, Hashable {
        let title: String = "Push ups"
        let difficulty: WorkoutDifficulty = .hard
    }

    static func workouts() -> [Workout] {
        return [Pushup()]
    }
}
