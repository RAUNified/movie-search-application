const apiUrl = "http://localhost/movie-search-application/connection.php"; 

document.getElementById("search-button").addEventListener("click", () => {
    const movieInput = document.getElementById("movie-input").value.trim();
    const resultsDiv = document.getElementById("results");

    
    resultsDiv.innerHTML = "";

    if (!movieInput) {
        resultsDiv.innerHTML = "<p>Please enter a movie title to search.</p>";
        return;
    }

    
    fetch(`${apiUrl}?q=${encodeURIComponent(movieInput)}`)
        .then(response => {
           
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
           
            if (data.error) {
                resultsDiv.innerHTML = `<p>${data.error}</p>`;
                return;
            }

         
            if (!data.title) {
                resultsDiv.innerHTML = `<p>No movie found with the title "${movieInput}".</p>`;
                return;
            }

          
            resultsDiv.innerHTML = `
                <div class="movie">
                    <img src="${data.poster !== null ? data.poster : "placeholder.jpg"}" alt="${data.title}">
                    <div class="movie-details">
                        <div class="movie-title">${data.title}</div>
                        <div class="movie-year">Year: ${data.year}</div>
                        <div class="movie-overview">${data.plot}</div>
                    </div>
                </div>
            `;
        })
        .catch(error => {
            
            resultsDiv.innerHTML = "<p>Failed to fetch data. Please try again later.</p>";
            console.error("Error fetching movie data:", error);
        });
});
