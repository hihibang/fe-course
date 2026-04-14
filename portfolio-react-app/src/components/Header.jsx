import Logo from "./header/Logo.jsx"
import MenuList from "./commons/MenuList.jsx"
import ToggleButton from "./header/ToggleButton.jsx"

export default function Header( {data} ) {
    // data 객체가 존재하는 경우에만 구조분해할당
    // 구조분해 할당으로 반환하는 타입이 객체인 경우 초기화 작업 필수
    const {menus = []} = data || {}

    return (
        <header class="header">
        <Logo img="images/favicon.ico"
              alt="header-logo"
              style="header-logo-img"
              title="Judy" />
        <MenuList menus={menus} style="header-menu open" />
        <ToggleButton />
    </header>
    )
}