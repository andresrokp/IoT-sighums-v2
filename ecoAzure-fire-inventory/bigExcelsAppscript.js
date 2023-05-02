/**
 * Identifica elementos únicos y retorna un arreglo ordenado segun la cantidad de apariciones
 * Por: andresrokp
 *
 * @param {range} a range of strings
 * @return A sorted array according to uniques counting
 * @customfunction
 */

function sortedUnique(range){
  let resourcesArray = range.flat()
  let counterDict = {}

  for(let rsr of resourcesArray){
      counterDict[rsr] = (counterDict[rsr] || 0) + 1
  }

  return dictToSortedMatrix(counterDict)
}

/**
* Helper
*/

function dictToSortedMatrix(dict){
  let keysArray = Object.keys(dict)
  let cuountsArray = Object.values(dict)
  let jointMatrix = keysArray.map( (nomatter, idx) => [cuountsArray[idx], keysArray[idx]])
  
  return jointMatrix.sort( (pairA, pairB) => pairB[0] - pairA[0]).map(pair=>pair[1])
    // if delete the maping, returns the matrix with quantities
}




  