<?php

namespace App\Listeners;

use App\Events\MovieDataReceived;
use App\Models\Movie;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Log;

class SyncMovieData implements ShouldQueue
{
    /**
     * Handle the event.
     */
    public function handle(MovieDataReceived $event): void
    {
        // Extract the movie data from the event
        $data = json_decode($event->data);

        Movie::updateOrCreate(['movie_id' => $data->movie_id], [
            'movie_id' => $data->movie_id,
            'title' => $data->title,
            'release_year' => $data->release_year,
            'country' => $data->country,
            'actors' => $data->actors,
            'genres' => $data->genres
        ]);

        Log::info('Movie data synchronized: ' . $data->movie_id);
    }
}
