import CurrentPlayer from '../components/CurrentPlayer';
import ServerHealthCheck from '../components/ServerHealthCheck';

const Tictactoe = () => {
  return(
    <div>
      Tictactoe
      <ServerHealthCheck />
      <CurrentPlayer />
    </div>
  )
}

export default Tictactoe;