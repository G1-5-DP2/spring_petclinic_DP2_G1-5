package org.springframework.samples.petclinic.service;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.samples.petclinic.model.Beauty;
import org.springframework.samples.petclinic.model.Pet;
import org.springframework.samples.petclinic.model.ResultScore;
import org.springframework.samples.petclinic.service.exceptions.DuplicatedResultForPetInTournament;
import org.springframework.stereotype.Service;



@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
public class BeautyResultServiceTests {

	
	@Autowired
	protected BeautyResultService beautyResultService;
	
	@Autowired
	protected BeautyService beautyService;
	
	@Autowired
	protected PetService petService;
	
	@Test
	void shouldSavePetResult() {
		ResultScore resultScore = new ResultScore();
		Pet petBasil = this.petService.findPetById(2);
		resultScore.setPet(petBasil);
		resultScore.setHaircut(10);
		resultScore.setHaircutdif(10);
		resultScore.setPosture(10);
		resultScore.setTechnique(10);
		Beauty beauty = this.beautyService.findBeautyById(3);
		resultScore.setTournament(beauty);
		
		try {
			this.beautyResultService.save(resultScore);
		}catch (DuplicatedResultForPetInTournament e) {
			Logger.getLogger(BeautyResultServiceTests.class.getName()).log(Level.SEVERE, null, e);
		}
		Assertions.assertThat(resultScore.getId()).isNotNull();
	}
	
	@Test
	void shouldNotSaveDuplicatedPetResult() {
		ResultScore resultScore = new ResultScore();
		Pet petRosy = this.petService.findPetById(3);
		resultScore.setPet(petRosy);
		resultScore.setHaircut(10);
		resultScore.setHaircutdif(10);
		resultScore.setPosture(10);
		resultScore.setTechnique(10);
		Beauty beauty = this.beautyService.findBeautyById(3);
		resultScore.setTournament(beauty);
		
		try {
			this.beautyResultService.save(resultScore);
		}catch (DuplicatedResultForPetInTournament e) {
			Logger.getLogger(BeautyResultServiceTests.class.getName()).log(Level.SEVERE, null, e);
		}
		
		Assertions.assertThat(resultScore.getId()).isNull();
	}
	
	@Test
	void petShouldBeInTournament() {
		Assertions.assertThat(this.beautyResultService.isInTournament(3, 3)).isTrue();
	}
	
	@Test
	void petShouldNotBeInTournament() {
		Assertions.assertThat(this.beautyResultService.isInTournament(3, 1)).isFalse();
	}
	
	
}