import "bootstrap";

document.querySelectorAll('.category-checkbox').forEach((category) =>{
  category.addEventListener('click',() => {
    let count = 0
    console.log('clicked')

   const cat = Array.from(document.querySelectorAll('.category-checkbox:checked')).map((selected) =>{
      console.log(selected.dataset.category)
      return selected.dataset.category
    })
    document.querySelectorAll('.item').forEach((item) => {
      item.style.display = 'none'
      const found = cat.find((selected) => {
        return (item.classList.contains(`category-${selected}`))
      })
      if (cat.length === 0 || found !== undefined){
        count += 1
        item.style.display = 'block'
      }

    })
    console.log(count)
    document.getElementById("counter").innerHTML = `Item Count = ${count}`;
  })
})


