//
//  WorkoutFactory.swift
//  Workout
//
//  Created by rnathan on 3/13/21.
//

import Foundation

enum WorkoutFactory {
    static func makeAll() -> [Workout] {
        EasyWorkout.workouts() +
        MediumWorkout.workouts() +
        HardWorkout.workouts()
    }

    static func makeWorkouts(difficulty: WorkoutDifficulty) -> [Workout] {
        switch difficulty {
            case .easy:
                return EasyWorkout.workouts()
            case .medium:
                return MediumWorkout.workouts()
            case .hard:
                return HardWorkout.workouts()
        }
    }
}
