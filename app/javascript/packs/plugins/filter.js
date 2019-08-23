const initFilter = () => {
 //adds event listener for each checkbox
 document.querySelectorAll('.category-checkbox').forEach((category) =>{
   category.addEventListener('click',() => {
     let count = 0;
     console.log('clicked');
   //gets an array containing each selected category
    const cat = Array.from(document.querySelectorAll('.category-checkbox:checked')).map((selected) =>{
       console.log(selected.dataset.category);
       return selected.dataset.category;
     });
    //iterates over each item
     document.querySelectorAll('.item').forEach((item) => {
       //default is to set item to hidden
       item.style.display = 'none';
       //checks if item is found in category array
       const found = cat.find((selected) => {
         return (item.classList.contains(`category-${selected}`));
       });
       if (cat.length === 0 || found !== undefined){
         count += 1;
         item.style.display = 'block';
       }
     });
     console.log(count);
     document.getElementById("counter").innerHTML = `${count}`;
   });
 });
};

export { initFilter };
