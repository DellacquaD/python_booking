import React, {useState} from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faTimes } from '@fortawesome/free-solid-svg-icons';

const ProductInputImages = ({ props }) => {
  const { styles, setProductImages } = props
    const [inputValue, setInputValue] = useState("");
  const [imageUrls, setImageUrls] = useState([]);

  const handleInputChange = (event) => {
    setInputValue(event.target.value);
  };

  const handleAddButtonClick = () => {
    if (inputValue.trim() !== "") {
      setImageUrls([...imageUrls, inputValue]);
      setProductImages([...imageUrls, inputValue])
      setInputValue("");
    }
  };

  const handleDeleteButtonClick = (indexToDelete) => {
    setImageUrls(imageUrls.filter((_, index) => index !== indexToDelete));
  };

  return (
    <div className={styles.urlImagesGridContainer}>
      <h3>Cargar Imágenes</h3>
      <div className={styles.urlContainer}>
        <div className={styles.imagesInputContainer}>
          <input
              className={styles.imageInput}
              type="text"
              placeholder="Ingrese la URL de la imagen"
              value={inputValue}
              onChange={handleInputChange}
          />
        <FontAwesomeIcon id={styles.addFeatureButton} type="button" onClick={handleAddButtonClick} icon={faPlus} />
        </div>
        {imageUrls.length > 0 ? (
          <div className={styles.imagePreviewContainer}>
            {imageUrls.map((url, index) => (
              <div key={index} className={styles.imageContainer}>
                <div className={styles.imageWrapper}>
                  <img src={url} alt="" />
                  <FontAwesomeIcon className={styles.removeImageButton} type="button" onClick={() => handleDeleteButtonClick(index)} icon={faTimes}/>
                </div>  
              </div>
            ))}
          </div>
        ) : null}
      </div>
    </div>
  )
}

export default ProductInputImages