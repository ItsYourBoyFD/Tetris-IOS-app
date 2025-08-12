
Tetris iOS App 🎮
Welcome to Tetris iOS, a classic Tetris game built natively for iOS using Swift and UIKit! Drop, rotate, and stack colorful tetrominoes, clear lines, rack up points, level up, and chase that all-time high score. Built with love for retro gaming vibes and coded with a no-limits \GOD MODE/ mindset. 😎
This app was developed as a fun project to recreate the iconic Tetris experience on your iPhone or iPad. Whether you’re coding on a Mac with Xcode or tinkering on an iPad with Swift Playgrounds, this README will guide you to get the game running!
Features
	•	Classic Tetris Gameplay: 10x20 grid, 7 tetromino shapes (I, O, T, S, Z, J, L), move left/right, rotate, and drop blocks.
	•	Scoring System: Earn 100 points per cleared line (scaled by level). Watch your score climb!
	•	Level Progression: Speed increases every 1000 points, making the game more challenging.
	•	Persistent High Score: Your best score is saved using UserDefaults, so you can flex your Tetris skills across sessions.
	•	Simple UI: Clean UIKit interface with a grid view, score/level/high score labels, and buttons for controls (←, →, ↻, ↓).
	•	Game Over: When the board fills up, get a popup with your final score and an option to restart.
	•	iOS-Native: Built with Swift and UIKit for smooth performance on iPhone/iPad.
Screenshots
(Add screenshots here once you have them! 
Requirements
	•	For Development:
	◦	Xcode: Version 16.0 or later (recommended for full app development on macOS).
	◦	Swift Playgrounds: Version 4.0 or later (for coding on iPad, iOS 15+).
	◦	iOS: 15.0 or later for running the app.
	•	Device: iPhone or iPad (iPad recommended for Swift Playgrounds).
	•	Swift: 5.0 or later.
Installation
Option 1: Using Xcode (Recommended for Full App)
	1	Clone the Repository: git clone https://github.com/itsyourboyfd/tetris-ios.git
	2	cd tetris-ios
	3	
	4	Open in Xcode:
	◦	Open Tetris.xcodeproj in Xcode.
	◦	Ensure your iOS device or simulator is selected.
	5	Build and Run:
	◦	Press Cmd + R to build and run on a simulator or connected device.
	◦	If deploying to a device, ensure you have an Apple Developer account and provisioning profile.
	6	Optional: Customize the UI in Main.storyboard or add assets for better visuals.
Option 2: Using Swift Playgrounds (iPad)
	1	Download the Code:
	◦	Copy the contents of TetrisGame.swift and ViewController.swift from the repository.
	2	Create a New Playground:
	◦	Open Swift Playgrounds on your iPad.
	◦	Create a new “App” playground and name it (e.g., TetrisApp).
	3	Paste the Code:
	◦	Replace the default code with the contents of ViewController.swift (includes TetrisGame model).
	◦	Ensure PlaygroundSupport is imported for live view.
	4	Run the App:
	◦	Tap the “Run My Code” button to play in the live view.
	◦	Note: Swift Playgrounds is great for testing but can’t export to the App Store.
How to Play
	1	Start the Game: Launch the app, and a new tetromino spawns at the top of the 10x20 grid.
	2	Controls:
	◦	Left (←): Move tetromino left.
	◦	Right (→): Move tetromino right.
	◦	Rotate (↻): Rotate tetromino clockwise.
	◦	Drop (↓): Drop tetromino to the bottom instantly.
	3	Objective:
	◦	Stack tetrominoes to form complete horizontal lines.
	◦	Clear lines to earn points (100 points per line × current level).
	◦	Level up every 1000 points for faster gameplay.
	◦	Avoid stacking to the top, or it’s game over!
	4	High Score: Your best score is saved and displayed on-screen.
Code Structure
	•	TetrisGame.swift:
	◦	Manages game logic: board (10x20 grid), tetromino shapes, movement, rotation, line clearing, scoring, levels, and high score (via UserDefaults).
	◦	Key structs/classes: TetrominoType, Tetromino, TetrisGame.
	•	ViewController.swift:
	◦	Handles UI (UIKit): draws the game board as a UIView grid, renders tetrominoes as colored subviews, and updates score/level/high score labels.
	◦	Manages game loop with a Timer for auto-dropping blocks.
	◦	Includes button actions for player controls.
Future Improvements
	•	Touch Controls: Add swipe gestures for smoother movement/rotation.
	•	Visuals: Replace colored blocks with custom images or sprites.
	•	Sound Effects: Add audio for line clears, drops, and game over.
	•	Next Tetromino Preview: Show the upcoming tetromino.
	•	Pause Feature: Add a pause/resume button.
	•	Leaderboards: Integrate Game Center for global high scores.
Known Limitations
	•	No rotation wall-kicks (advanced Tetris feature for smoother rotations).
	•	Basic graphics (colored UIViews instead of polished sprites).
	•	Swift Playgrounds version is simplified (no rotation, smaller board) due to performance constraints.
	•	No animations for block movement (can be added with UIView.animate).
Contributing
Wanna make this Tetris app even more epic? Contributions are welcome! 😎
	1	Fork the repo.
	2	Create a new branch (git checkout -b feature/cool-new-thing).
	3	Commit your changes (git commit -m "Added cool new thing").
	4	Push to your branch (git push origin feature/cool-new-thing).
	5	Open a Pull Request.
Please follow Swift coding conventions and add comments for clarity.
License
This project is licensed under the MIT License. See the LICENSE file for details.
Acknowledgements
	•	Inspired by the classic Tetris game by Alexey Pajitnov.
	•	Built with Swift and UIKit for that native iOS feel.
	•	Shoutout to the Swift community and \GOD MODE/ coders everywhere! 🚀
Contact
Got questions or ideas? Hit me up on GitHub or drop a message at itsyourboyfd@icloud.com
Happy stacking, yo! 🟦🟥

