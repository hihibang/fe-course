import AvatarImage from "../commons/AvatarImage.jsx"
import Menu from "../commons/Menu.jsx"

export default function Home({ data }) {  
    const { img, alt, title, name, description, href, menuName } = data || {};
    return (
        <section id="home">
            <AvatarImage img={img}
                            alt={alt}
                            style="home-avatar" />
            <h2 className="home-title">
                Hello<br/>
                I'm <strong className="home-title-strong">{title}</strong>,
                {name}
            </h2>
            <p className="home-description">{description}</p>
            <Menu   href={href}
                    style="home-contact"
                    name={menuName} />
        </section>
    )
}