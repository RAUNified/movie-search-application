const apiKey = "2e693b36";
const apiUrl = `http://www.omdbapi.com/?apikey=${apiKey}`;

document.getElementById("search-button").addEventListener("click", () => {
    const movieInput = document.getElementById("movie-input").value.trim();
    const resultsDiv = document.getElementById("results");

    resultsDiv.innerHTML = ""; 

    if (!movieInput) {
        resultsDiv.innerHTML = "<p>Please enter a movie title to search.</p>";
        return;
    }

    fetch(`${apiUrl}&s=${movieInput}`)
        .then(response => response.json())
        .then(data => {
            if (data.Response === "False") {
                resultsDiv.innerHTML = `<p>${data.Error}</p>`;
                return;
            }

            const movies = data.Search;
            resultsDiv.innerHTML = movies
                .map(movie => `
                    <div class="movie">
                        <img src="${movie.Poster !== "N/A" ? movie.Poster : "placeholder.jpg"}" alt="${movie.Title}">
                        <div class="movie-details">
                            <div class="movie-title">${movie.Title}</div>
                            <div class="movie-year">Year: ${movie.Year}</div>
                            <div class="movie-overview">
                                <button onclick="fetchMovieDetails('${movie.imdbID}')">View Details</button>
                            </div>
                        </div>
                    </div>
                `).join("");
        })
        .catch(error => {
            resultsDiv.innerHTML = "<p>Failed to fetch data. Please try again later.</p>";
            console.error("Error fetching movie data:", error);
        });
});

function fetchMovieDetails(imdbID) {
    fetch(`${apiUrl}&i=${imdbID}&plot=short`)
        .then(response => response.json())
        .then(data => {
            alert(`
                Title: ${data.Title}
                Year: ${data.Year}
                Plot: ${data.Plot}
            `);
        })
        .catch(error => {
            console.error("Error fetching movie details:", error);
        });
}
