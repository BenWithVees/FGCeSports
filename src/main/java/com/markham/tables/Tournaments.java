package com.markham.tables;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "tournaments")
@NamedQuery(name = "Tournaments.getTournamets", query = "SELECT t FROM Tournaments t")
public class Tournaments {

	@Id
	@Column(name = "id")
	private int id;

	@Column(name = "tournament_name")
	private String tournamentName;

	@Column(name = "game_name")
	private String gameName;

	@Column(name = "first_place")
	private String firstPlace;

	@Column(name = "second_place")
	private String secondPlace;

	@Column(name = "third_place")
	private String thirdPlace;

	@Column(name = "fourth_place")
	private String fourthPlace;

	@Column(name = "fifth_place")
	private String fifthPlace;

	@Column(name = "fifth_place_second")
	private String fifthPlaceSecond;

	@Column(name = "seventh_place")
	private String seventhPlace;

	@Column(name = "seventh_place_second")
	private String seventhPlaceSecond;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTournamentName() {
		return tournamentName;
	}

	public void setTournamentName(String tournamentName) {
		this.tournamentName = tournamentName;
	}

	public String getGameName() {
		return gameName;
	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	public String getFirstPlace() {
		return firstPlace;
	}

	public void setFirstPlace(String firstPlace) {
		this.firstPlace = firstPlace;
	}

	public String getSecondPlace() {
		return secondPlace;
	}

	public void setSecondPlace(String secondPlace) {
		this.secondPlace = secondPlace;
	}

	public String getThirdPlace() {
		return thirdPlace;
	}

	public void setThirdPlace(String thirdPlace) {
		this.thirdPlace = thirdPlace;
	}

	public String getFourthPlace() {
		return fourthPlace;
	}

	public void setFourthPlace(String fourthPlace) {
		this.fourthPlace = fourthPlace;
	}

	public String getFifthPlace() {
		return fifthPlace;
	}

	public void setFifthPlace(String fifthPlace) {
		this.fifthPlace = fifthPlace;
	}

	public String getFifthPlaceSecond() {
		return fifthPlaceSecond;
	}

	public void setFifthPlaceSecond(String fifthPlaceSecond) {
		this.fifthPlaceSecond = fifthPlaceSecond;
	}

	public String getSeventhPlace() {
		return seventhPlace;
	}

	public void setSeventhPlace(String seventhPlace) {
		this.seventhPlace = seventhPlace;
	}

	public String getSeventhPlaceSecond() {
		return seventhPlaceSecond;
	}

	public void setSeventhPlaceSecond(String seventhPlaceSecond) {
		this.seventhPlaceSecond = seventhPlaceSecond;
	}

}
