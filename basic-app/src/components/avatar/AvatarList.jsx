import Avatar from "./Avatar.jsx"
import style from "./Avatar.module.css"

export default function AvatarImageList( { imgAlist } ) {
    return(
        <div className={style.avatar_list}>
            {
                imgAlist.map(item=> <Avatar img={item.img} name={item.name} />)
            }
        </div>
    )
}