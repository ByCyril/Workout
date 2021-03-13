//
//  WorkoutSelectionViewModel.swift
//  Workout
//
//  Created by rnathan on 3/13/21.
//

import Combine
import Foundation

struct WorkoutSelectionViewModel {
    final class State: ObservableObject {
        @Published var workouts: [Workout] = []
    }

    private(set) var state: WorkoutSelectionViewModel.State = .init()
}

// MARK: - View lifecycle

extension WorkoutSelectionViewModel {
    func onAppear() {
        state.workouts = WorkoutFactory.makeAll()
    }

    func onDisappear() {
        state.workouts = []
    }
}

