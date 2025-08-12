import UIKit

class ViewController: UIViewController {
    let game = TetrisGame()
    var gameView: UIView!
    var scoreLabel: UILabel!
    var levelLabel: UILabel!
    var highScoreLabel: UILabel!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startGameLoop()
    }
    
    func setupUI() {
        view.backgroundColor = .black
        
        // Speelveld
        gameView = UIView(frame: CGRect(x: 20, y: 100, width: 300, height: 600))
        gameView.backgroundColor = .darkGray
        view.addSubview(gameView)
        
        // Labels
        scoreLabel = UILabel(frame: CGRect(x: 20, y: 50, width: 200, height: 30))
        scoreLabel.textColor = .white
        scoreLabel.text = "Score: 0"
        view.addSubview(scoreLabel)
        
        levelLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        levelLabel.textColor = .white
        levelLabel.text = "Level: 1"
        view.addSubview(levelLabel)
        
        highScoreLabel = UILabel(frame: CGRect(x: 20, y: 70, width: 200, height: 30))
        highScoreLabel.textColor = .white
        highScoreLabel.text = "High Score: \(game.highScore)"
        view.addSubview(highScoreLabel)
        
        // Knoppen
        let leftButton = UIButton(frame: CGRect(x: 20, y: 700, width: 60, height: 40))
        leftButton.setTitle("←", for: .normal)
        leftButton.addTarget(self, action: #selector(moveLeft), for: .touchUpInside)
        view.addSubview(leftButton)
        
        let rightButton = UIButton(frame: CGRect(x: 100, y: 700, width: 60, height: 40))
        rightButton.setTitle("→", for: .normal)
        rightButton.addTarget(self, action: #selector(moveRight), for: .touchUpInside)
        view.addSubview(rightButton)
        
        let rotateButton = UIButton(frame: CGRect(x: 180, y: 700, width: 60, height: 40))
        rotateButton.setTitle("↻", for: .normal)
        rotateButton.addTarget(self, action: #selector(rotate), for: .touchUpInside)
        view.addSubview(rotateButton)
        
        let dropButton = UIButton(frame: CGRect(x: 260, y: 700, width: 60, height: 40))
        dropButton.setTitle("↓", for: .normal)
        dropButton.addTarget(self, action: #selector(drop), for: .touchUpInside)
        view.addSubview(dropButton)
    }
    
    func startGameLoop() {
        timer = Timer.scheduledTimer(withTimeInterval: game.fallSpeed, repeats: true) { _ in
            if !self.game.moveTetromino(dx: 0, dy: 1) {
                self.game.mergeTetromino()
                self.game.clearLines()
                self.game.spawnTetromino()
                if self.game.gameOver {
                    self.timer?.invalidate()
                    let alert = UIAlertController(title: "Game Over", message: "Score: \(self.game.score)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
            self.updateUI()
        }
    }
    
    func updateUI() {
        // Verwijder oude blokken
        gameView.subviews.forEach { $0.removeFromSuperview() }
        
        // Teken speelveld
        let cellWidth = gameView.frame.width / CGFloat(game.width)
        let cellHeight = gameView.frame.height / CGFloat(game.height)
        
        for y in 0..<game.height {
            for x in 0..<game.width {
                if game.board[y][x] == 1 {
                    let cell = UIView(frame: CGRect(x: CGFloat(x) * cellWidth, y: CGFloat(y) * cellHeight, width: cellWidth, height: cellHeight))
                    cell.backgroundColor = .blue
                    cell.layer.borderWidth = 1
                    cell.layer.borderColor = UIColor.white.cgColor
                    gameView.addSubview(cell)
                }
            }
        }
        
        // Teken huidige tetromino
        if let tetromino = game.currentTetromino {
            for y in 0..<tetromino.shape.count {
                for x in 0..<tetromino.shape[y].count {
                    if tetromino.shape[y][x] == 1 {
                        let boardX = tetromino.position.x + x
                        let boardY = tetromino.position.y + y
                        if boardY >= 0 {
                            let cell = UIView(frame: CGRect(x: CGFloat(boardX) * cellWidth, y: CGFloat(boardY) * cellHeight, width: cellWidth, height: cellHeight))
                            cell.backgroundColor = .red
                            cell.layer.borderWidth = 1
                            cell.layer.borderColor = UIColor.white.cgColor
                            gameView.addSubview(cell)
                        }
                    }
                }
            }
        }
        
        // Update labels
        scoreLabel.text = "Score: \(game.score)"
        levelLabel.text = "Level: \(game.level)"
        highScoreLabel.text = "High Score: \(game.highScore)"
    }
    
    @objc func moveLeft() { game.moveTetromino(dx: -1, dy: 0); updateUI() }
    @objc func moveRight() { game.moveTetromino(dx: 1, dy: 0); updateUI() }
    @objc func rotate() { game.rotateTetromino(); updateUI() }
    @objc func drop() { game.dropTetromino(); updateUI() }
}
