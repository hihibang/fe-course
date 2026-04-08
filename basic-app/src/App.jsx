import AvatarImage from "./components/avatar/AvatarImage.jsx"
import AvatarImageList from "./components/avatar/AvatarImageList.jsx"
import AvatarList from "./components/avatar/AvatarList.jsx"
import Avatar from "./components/avatar/Avatar.jsx"
import people1 from './assets/people1.webp';
import people2 from './assets/people2.webp';
import people3 from './assets/people3.webp';
import Menu from "./components/menu/Menu.jsx";
import mstyle from './components/avatar/Avatar.module.css'
import style from './components/menu/Menu.module.css'

export default function App() {
  const list = [
    {img: people1},
    {img: people2},
    {img: people3}
  ]
  const alist = [
    {img: people1, name:'smith'},
    {img: people2, name:'smith'},
    {img: people3, name:'smith'}
  ]
  return ( 
    <>
      <AvatarImage img={people3} style={mstyle.avatar_img_circle}/>
      <AvatarImageList imgList={list}/>
      <AvatarList imgAlist={alist}/> 
    </>
  )
}

