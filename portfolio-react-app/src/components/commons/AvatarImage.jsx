export default function Avatar({img, alt, style}) {
    return(
        <img src={img}
             alt={alt}
             className={style} />
    )
}