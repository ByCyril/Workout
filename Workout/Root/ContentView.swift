//
//  ContentView.swift
//  Workout
//
//  Created by rnathan on 3/13/21.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        return WorkoutSelectionView()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
