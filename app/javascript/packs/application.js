import "bootstrap";

document.querySelectorAll('.category-checkbox').forEach((category) =>{
  category.addEventListener('click',() => {
   const cat = Array.from(document.querySelectorAll('.category-checkbox:checked')).map((selected) =>{
      return selected.dataset.category
    })
    console.log(cat)
    document.querySelectorAll('.item').forEach((item) => {
      item.style.display = 'none'
      const found = cat.find((selected) => {
        return (item.classList.contains(`category-${selected}`))
      })
      if (cat.length === 0 || found !== undefined){
        item.style.display = 'block'
      }

    })
  })
})


