//
//  Workout.swift
//  Workout
//
//  Created by rnathan on 3/13/21.
//

import Foundation

enum WorkoutDifficulty: String {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

protocol Workout {
    var title: String { get }
    var difficulty: WorkoutDifficulty { get }
}
