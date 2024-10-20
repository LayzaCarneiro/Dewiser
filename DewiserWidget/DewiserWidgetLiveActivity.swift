//
//  DewiserWidgetLiveActivity.swift
//  DewiserWidget
//
//  Created by Joao Roberto Fernandes Magalhaes on 03/10/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DewiserWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct DewiserWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DewiserWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hey \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension DewiserWidgetAttributes {
    fileprivate static var preview: DewiserWidgetAttributes {
        DewiserWidgetAttributes(name: "World")
    }
}

extension DewiserWidgetAttributes.ContentState {
    fileprivate static var smiley: DewiserWidgetAttributes.ContentState {
        DewiserWidgetAttributes.ContentState(emoji: "😀")
     }

     fileprivate static var starEyes: DewiserWidgetAttributes.ContentState {
         DewiserWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: DewiserWidgetAttributes.preview) {
   DewiserWidgetLiveActivity()
} contentStates: {
    DewiserWidgetAttributes.ContentState.smiley
    DewiserWidgetAttributes.ContentState.starEyes
}
