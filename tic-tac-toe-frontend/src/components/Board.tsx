import { useEffect, useState } from "react"

interface BoardProps {
  boardState: (string | number)[][]
}

const Board: React.FC<BoardProps> = ({boardState}) => {
  const [currentBoard, setBoard] = useState(boardState)

  useEffect(() => {
    setBoard(boardState)
  }, [boardState]);

  return(
    <div>
      <div className="board">
        <h2 className="board-title">Board</h2>
        <div className="board-row-1">{currentBoard[0]}</div>
        <div className="board-row-2">{currentBoard[1]}</div>
        <div className="board-row-3">{currentBoard[2]}</div>
      </div>
    </div>
  )
}

export default Board;
