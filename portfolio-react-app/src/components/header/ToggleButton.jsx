import {FontAwesomeIcon} from '@fortawesome/react-fontawesome'
import {faBars} from '@fortawesome/free-solid-svg-icons'

export default function ToggleButton() {
    return(
        <button class="header-toggle" id="menu-toggle">
            <FontAwesomeIcon icon={faBars} />
        </button>
    )
}