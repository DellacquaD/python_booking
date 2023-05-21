import React, { useState, useEffect } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faTimes, faKitchenSet, faWifi, faPersonSwimming, faSnowflake, faPaw, faCar, faTv } from '@fortawesome/free-solid-svg-icons';
import useComponentVisible from '../../../hooks/useComponentVisible'

const FeatureSelector = ({ props }) => {
  const { styles, features, setFeatures } = props;
  const [featureInput, setFeatureInput] = useState([{ feature: 'Wifi', iconName: faWifi }]);
  const [newFeature, setNewFeature] = useState({ feature: '', iconName: '' });
  const [search, setSearch] = useState("");
  const [iconSelected, setIconSelected] = useState('')

  const featureOptions = [
    { id: 1, feature: 'WiFi', iconName: faWifi },
    { id: 2, feature: 'Pileta', iconName: faPersonSwimming },
    { id: 3, feature: 'Cocina', iconName: faKitchenSet },
    { id: 4, feature: 'Televisor', iconName: faTv },
    { id: 5, feature: 'Apto mascotas', iconName: faPaw },
    { id: 6, feature: 'Aire acondicionado', iconName: faSnowflake },
    { id: 7, feature: 'Estacionamiento gratuito', iconName: faCar }
  ]

  const [availableFeatures, setAvailableFeatures] = useState(featureOptions.map(option => option.feature));
  const [filteredFeatures, setFilteredFeatures] = useState(featureOptions.map(option => option.feature));
  const { selectorRef, isActive, setIsActive } = useComponentVisible(false);


  useEffect(() => {
    const filterFeatures = () => {
      const inputValue = search.toLowerCase();
      const filtered = availableFeatures.filter((option) =>
        option.toLowerCase().includes(inputValue)
      );
      setFilteredFeatures(filtered);
    };

    filterFeatures();
  }, [search, availableFeatures]);

  const handleAddFeatureClick = () => {
    if (!newFeature.feature) {
      return;
    }
    setFeatureInput([...featureInput, newFeature]);
    setNewFeature({ id: '', feature: '', iconName: '' });
    setAvailableFeatures(availableFeatures.filter(option => option !== newFeature.feature));
    setIconSelected('')
    setFeatures([...features, newFeature.id]);
  };

  const handleRemoveFeatureClick = (e) => {
    const index = e.target.getAttribute('index');
    const list = [...featureInput];
    const removedFeature = list[index];
    list.splice(index, 1);
    setFeatureInput(list);
    setAvailableFeatures([...availableFeatures, removedFeature.feature]);
  };

  return (
    <div className={styles.featureListContainer}>
      <h3>Agregar atributos</h3>
          <div className={styles.iconForm}>
            <div
            className={styles.featureShowContainer}
              ref={selectorRef}
              onClick={() => setIsActive((prev) => !prev)}
            >
              <input type="text" 
                name="feature"
                className={styles.featureInput}
                value={newFeature.feature}
                placeholder='Selecciona un feature'
                onChange={(e) => {
                  setSearch(e.target.value);
                  setNewFeature(prevState => ({ ...prevState, feature: e.target.value }))
                }}
              />
              <div id={styles.featureOptions} className={isActive ? `${styles.active}` : `${styles.inactive}`}>
                {filteredFeatures.map((filteredOption) => (
                  <div
                  key={filteredOption}
                  value={filteredOption}
                  onClick={() => {
                    const selectedOption = featureOptions.find(
                      (option) => option.feature === filteredOption
                    );
                    setNewFeature((prevState) => ({
                      ...prevState,
                      id: selectedOption.id,
                      feature: selectedOption.feature,
                      iconName: selectedOption.iconName
                    }));
                    setIconSelected(selectedOption.iconName);
                  }}
                  >
                    {filteredOption}
                  </div>
                ))}
              </div>
            </div>
            <div className={styles.featureInputIcon}>{iconSelected && <FontAwesomeIcon icon={iconSelected} />}</div>  
            <FontAwesomeIcon id={styles.addFeatureButton} type="button" onClick={newFeature.feature ? handleAddFeatureClick : () => {}} icon={faPlus} />
          </div>
        {featureInput.map((input, i) => {
            if (i === 0) {
                return null;
            }
            return (
                <div className={styles.iconForm} key={i}>
                    <div className={styles.newFeatureSelected}>{input.feature}</div>
                    <div className={styles.featureInputIcon}><FontAwesomeIcon icon={input.iconName ? input.iconName : ''} /></div>            
                <FontAwesomeIcon 
                id={styles.removeFeatureButton} 
                type="button" 
                onClick={handleRemoveFeatureClick}
                index={i} 
                icon={faTimes} />
                </div>
            );
            })}
      </div>
  )
}

export default FeatureSelector