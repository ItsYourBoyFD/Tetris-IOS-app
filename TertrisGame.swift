import Foundation

// Tetromino-vormen (7 klassieke vormen)
enum TetrominoType: CaseIterable +AHs-
    case I, O, T, S, Z, J, L
+AH0-

struct Tetromino +AHs-
    let type: TetrominoType
    var position: (x: Int, y: Int)
    var shape: +AFsAWw-Int+AF0AXQ- // 4x4 matrix voor de vorm
    
    static func random() -+AD4- Tetromino +AHs-
        let type +AD0- TetrominoType.allCases.randomElement()+ACE-
        let shapes: +AFs-TetrominoType: +AFsAWw-Int+AF0AXQBd- +AD0- +AFs-
            .I: +AFsAWw-0,0,0,0+AF0-,+AFs-1,1,1,1+AF0-,+AFs-0,0,0,0+AF0-,+AFs-0,0,0,0+AF0AXQ-,
            .O: +AFsAWw-1,1+AF0-,+AFs-1,1+AF0AXQ-,
            .T: +AFsAWw-0,1,0+AF0-,+AFs-1,1,1+AF0-,+AFs-0,0,0+AF0AXQ-,
            .S: +AFsAWw-0,1,1+AF0-,+AFs-1,1,0+AF0-,+AFs-0,0,0+AF0AXQ-,
            .Z: +AFsAWw-1,1,0+AF0-,+AFs-0,1,1+AF0-,+AFs-0,0,0+AF0AXQ-,
            .J: +AFsAWw-1,0,0+AF0-,+AFs-1,1,1+AF0-,+AFs-0,0,0+AF0AXQ-,
            .L: +AFsAWw-0,0,1+AF0-,+AFs-1,1,1+AF0-,+AFs-0,0,0+AF0AXQ-
        +AF0-
        return Tetromino(type: type, position: (x: 4, y: 0), shape: shapes+AFs-type+AF0AIQ-)
    +AH0-
    
    func rotated() -+AD4- Tetromino +AHs-
        var newShape +AD0- shape
        let n +AD0- shape.count
        for i in 0..+ADw-n +AHs-
            for j in 0..+ADw-n +AHs-
                newShape+AFs-i+AF0AWw-j+AF0- +AD0- shape+AFs-n-1-j+AF0AWw-i+AF0-
            +AH0-
        +AH0-
        return Tetromino(type: type, position: position, shape: newShape)
    +AH0-
+AH0-

class TetrisGame +AHs-
    let width +AD0- 10
    let height +AD0- 20
    var board: +AFsAWw-Int+AF0AXQ- // 0 +AD0- leeg, 1 +AD0- bezet
    var currentTetromino: Tetromino?
    var score +AD0- 0
    var level +AD0- 1
    var highScore: Int +AHs-
        get +AHs- UserDefaults.standard.integer(forKey: +ACI-highScore+ACI-) +AH0-
        set +AHs- UserDefaults.standard.set(newValue, forKey: +ACI-highScore+ACI-) +AH0-
    +AH0-
    var gameOver +AD0- false
    var fallSpeed: Double +AHs- 1.0 - Double(level) +ACo- 0.1 +AH0- // Sneller per level
    
    init() +AHs-
        board +AD0- Array(repeating: Array(repeating: 0, count: width), count: height)
        spawnTetromino()
    +AH0-
    
    func spawnTetromino() +AHs-
        currentTetromino +AD0- Tetromino.random()
        if +ACE-isValidPosition(tetromino: currentTetromino+ACE-) +AHs-
            gameOver +AD0- true
        +AH0-
    +AH0-
    
    func isValidPosition(tetromino: Tetromino) -+AD4- Bool +AHs-
        for y in 0..+ADw-tetromino.shape.count +AHs-
            for x in 0..+ADw-tetromino.shape+AFs-y+AF0-.count +AHs-
                if tetromino.shape+AFs-y+AF0AWw-x+AF0- +AD0APQ- 1 +AHs-
                    let boardX +AD0- tetromino.position.x  x
                    let boardY +AD0- tetromino.position.y  y
                    if boardX +ADw- 0 +AHwAfA- boardX +AD4APQ- width +AHwAfA- boardY +AD4APQ- height +AHwAfA- (boardY +AD4APQ- 0 +ACYAJg- board+AFs-boardY+AF0AWw-boardX+AF0- +AD0APQ- 1) +AHs-
                        return false
                    +AH0-
                +AH0-
            +AH0-
        +AH0-
        return true
    +AH0-
    
    func moveTetromino(dx: Int, dy: Int) -+AD4- Bool +AHs-
        guard let tetromino +AD0- currentTetromino else +AHs- return false +AH0-
        let newTetromino +AD0- Tetromino(type: tetromino.type, position: (x: tetromino.position.x  dx, y: tetromino.position.y  dy), shape: tetromino.shape)
        if isValidPosition(tetromino: newTetromino) +AHs-
            currentTetromino +AD0- newTetromino
            return true
        +AH0-
        return false
    +AH0-
    
    func rotateTetromino() -+AD4- Bool +AHs-
        guard let tetromino +AD0- currentTetromino else +AHs- return false +AH0-
        let newTetromino +AD0- tetromino.rotated()
        if isValidPosition(tetromino: newTetromino) +AHs-
            currentTetromino +AD0- newTetromino
            return true
        +AH0-
        return false
    +AH0-
    
    func dropTetromino() +AHs-
        while moveTetromino(dx: 0, dy: 1) +AHsAfQ-
        mergeTetromino()
        clearLines()
        spawnTetromino()
    +AH0-
    
    func mergeTetromino() +AHs-
        guard let tetromino +AD0- currentTetromino else +AHs- return +AH0-
        for y in 0..+ADw-tetromino.shape.count +AHs-
            for x in 0..+ADw-tetromino.shape+AFs-y+AF0-.count +AHs-
                if tetromino.shape+AFs-y+AF0AWw-x+AF0- +AD0APQ- 1 +AHs-
                    let boardX +AD0- tetromino.position.x  x
                    let boardY +AD0- tetromino.position.y  y
                    if boardY +AD4APQ- 0 +AHs-
                        board+AFs-boardY+AF0AWw-boardX+AF0- +AD0- 1
                    +AH0-
                +AH0-
            +AH0-
        +AH0-
    +AH0-
    
    func clearLines() +AHs-
        var linesCleared +AD0- 0
        for y in (0..+ADw-height).reversed() +AHs-
            if board+AFs-y+AF0-.allSatisfy(+AHs- +ACQ-0 +AD0APQ- 1 +AH0-) +AHs-
                linesCleared +AD0- 1
                board.remove(at: y)
                board.insert(Array(repeating: 0, count: width), at: 0)
            +AH0-
        +AH0-
        if linesCleared +AD4- 0 +AHs-
            score +AD0- linesCleared +ACo- 100 +ACo- level
            level +AD0- score / 1000  1
            if score +AD4- highScore +AHs-
                highScore +AD0- score
            +AH0-
        +AH0-
    +AH0-
+AH0-