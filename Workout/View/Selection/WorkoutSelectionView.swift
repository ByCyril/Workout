//
//  WorkoutSelectionView.swift
//  Workout
//
//  Created by rnathan on 3/13/21.
//

import Foundation
import SwiftUI

struct WorkoutSelectionView: View {
    private let viewModel: WorkoutSelectionViewModel
    @ObservedObject private(set) var state: WorkoutSelectionViewModel.State

    init(viewModel: WorkoutSelectionViewModel = .init()) {
        self.viewModel = viewModel
        self.state = viewModel.state
    }

    var body: some View {
        NavigationView {
            List{
                ForEach(state.workouts, id:\.title) { workout in
                    WorkoutSelectionItemView(workout: workout)
                }
            }.navigationBarTitle(Text("Workouts"), displayMode: .large)
        }.onAppear {
            viewModel.onAppear()
        }.onDisappear {
            viewModel.onDisappear()
        }
    }
}

private struct WorkoutSelectionItemView: View {
    let workout: Workout

    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(workout.title)
                .font(.headline)
            Text(workout.difficulty.rawValue)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
