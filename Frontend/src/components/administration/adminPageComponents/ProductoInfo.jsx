import React, { useState, useEffect } from 'react';
import useComponentVisible from '../../../hooks/useComponentVisible';
import axios from 'axios';
import { apiCategory, apiCountry } from '../../../utils/apiEndpoints';
import SelectorTarget from '../../Home/searcher/SelectorTarget';

const ProductoInfo = ({ props }) => {
  const { styles, productName, setProductName, setProductCategory, productAddress, setProductAddress, setProductCity, productDescription, setProductDescription } = props;

  const [selected, setSelected] = useState('')
  const [categories, setCategories] = useState([]);
  const [categoryInput, setCategoryInput] = useState('');
  const [filteredCategories, setFilteredCategories] = useState([]);
  const { selectorRef, isActive, setIsActive } = useComponentVisible(false);


  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const response = await axios.get(apiCategory)
        setCategories(response.data)
      } catch (error) {
        console.log('Error al obtener datos de la API. Usando datos estáticos...')
        const fallbackData = await axios.get('/apiCategories.json')
        setCategories(fallbackData.data)
      }
    }
    fetchCategories()
  }, [])

  useEffect(() => {
    setFilteredCategories(
      categories.filter((category) =>
        category.title.toLowerCase().indexOf(categoryInput.toLowerCase()) !== -1
      )
    );
  }, [categoryInput, categories]);

  const inputClass = (baseClass) => `${styles.adminGridItem} ${styles[baseClass]}`;

  const handleCategoryInputChange = (e) => {
    setCategoryInput(e.target.value);
  };

  const formElements = [
    { label: 'Nombre de la propiedad', placeholder: 'Hotel Hermirage', baseClass: 'productName', elementType: 'input' },
    { label: 'Categoria', placeholder: 'Hotel', baseClass: 'productCategory', elementType: 'customSelectCategory' },
    { label: 'Dirección', placeholder: 'Av. colón 1643', baseClass: 'productAddress', elementType: 'input' },
    { label: 'Ciudad', placeholder: 'Montevideo', baseClass: 'productCity', elementType: 'customSelectCity' },
    { label: 'Descripcion', placeholder: 'Escriba aquí', baseClass: 'productDescription', elementType: 'textarea' },
  ];

  return (
    <div className={styles.adminGridContainer}>
      {formElements.map(({ label, placeholder, baseClass, elementType }) => (
        <div key={label} className={inputClass(baseClass)} >
          <div>{label}</div>
          {elementType === 'input' ? (
            baseClass === 'productName' ? 
            (
              <input
              placeholder={placeholder}
              value={productName}
              onChange={(e) => {
                setProductName(e.target.value)
              }
            }
            required
              />
              )
              : (
                <input
                placeholder={placeholder}
                value={productAddress}
                onChange={(e) => {
                  setProductAddress(e.target.value)
                }
                }
                required
                />
                )
            ) : elementType === 'textarea' ? (
            <textarea 
              placeholder={placeholder} 
              value={productDescription}
              className={styles.textarea}
              onChange={(e) => setProductDescription(e.target.value)}
              required
              >
            </textarea>
          ) : elementType === 'customSelectCategory' ? (
            <div ref={selectorRef}
              className={styles.selectCategoryInput}
              onClick={() => setIsActive((prev) => !prev)}
            >
              <input
                placeholder={placeholder}
                value={categoryInput}
                onChange={handleCategoryInputChange}
                onClick={() => {
                  setFilteredCategories(categories);
                }}
                required
              />
              {filteredCategories.length > 0 && (
                <div id={styles.showCategoriesList} className={isActive ? `${styles.active}` : `${styles.inactive}`}>
                  {filteredCategories.map((category) => (
                    <div
                      key={category.id}
                      onClick={() => {
                        setCategoryInput(category.title);
                        setProductCategory(category.id)
                        setFilteredCategories([]);
                      }}
                    >
                      {category.title}
                    </div>
                  ))}
                </div>
              )}
            </div>
          ) : <SelectorTarget styles={styles} setSelected={setSelected} setProductCity={setProductCity} /> }
        </div>
      ))}
    </div>
  );
};

export default ProductoInfo;