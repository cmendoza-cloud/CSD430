/*
 * Carmen Mendoza
 * CSD 430
 * Module 4 - JavaBean for Movie Data
 */

package beans;

import java.io.Serializable;

// This JavaBean class holds movie information.
public class MovieBean implements Serializable {

    // Fields for movie details
    private String title;
    private String director;
    private int year;
    private String genre;
    private double rating;

    // Default constructor (required for JavaBeans)
    public MovieBean() {
    }

    // Getter and setter for title
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    // Getter and setter for director
    public String getDirector() {
        return director;
    }
    public void setDirector(String director) {
        this.director = director;
    }

    // Getter and setter for year
    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
    }

    // Getter and setter for genre
    public String getGenre() {
        return genre;
    }
    public void setGenre(String genre) {
        this.genre = genre;
    }

    // Getter and setter for rating
    public double getRating() {
        return rating;
    }
    publ
