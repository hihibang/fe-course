import Menu from "./Menu.jsx";

export default function MenuList({menus, style}) {
    return(
        <nav>
            <ul className={style}>
                {menus.map((menu, key)=>
                    <li key={key}>
                        <Menu href={menu.href}
                              style={menu.style}
                              name={menu.name} />
                    </li>    
                )}
            </ul>
        </nav>
    )
}