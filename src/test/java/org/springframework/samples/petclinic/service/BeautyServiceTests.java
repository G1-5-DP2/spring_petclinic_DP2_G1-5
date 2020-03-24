
package org.springframework.samples.petclinic.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.samples.petclinic.model.Beauty;
import org.springframework.samples.petclinic.model.Sponsor;
import org.springframework.samples.petclinic.repository.springdatajpa.BeautyRepository;
import org.springframework.samples.petclinic.service.exceptions.ReservedDateExeception;
import org.springframework.samples.petclinic.service.exceptions.SponsorAmountException;
import org.springframework.stereotype.Service;

@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
public class BeautyServiceTests {

	@Autowired
	protected BeautyService		beautyService;

	@Autowired
	protected BeautyRepository	beautyRepo;


	@ParameterizedTest
	@CsvSource({
		"8000,PLaceTest,2020-04-16,BeautyConTest2,1000", "8000,PLaceTest,2020-06-08,BeautyConTest,1000"
	})
	public void addNewBeauty(final Integer capacity, final String place, final LocalDate date, final String name, final Double rewardMoney) throws ReservedDateExeception {
		Beauty beauty = new Beauty();
		beauty.setCapacity(capacity);
		beauty.setPlace(place);
		beauty.setDate(date);
		beauty.setName(name);
		beauty.setRewardMoney(rewardMoney);

		try {
			this.beautyService.saveBeauty(beauty);
			Assertions.assertThat(beauty.getId()).isNotNull();
		} catch (ReservedDateExeception ex) {
			Logger.getLogger(PetServiceTests.class.getName()).log(Level.SEVERE, null, ex);
		}

	}

	@Test
	public void checkFirstPrize() {
		Beauty beauty = this.beautyRepo.findById(3).get();
		Assertions.assertThat(beauty.getFirstClassified()).isEqualTo(beauty.getRewardMoney() * 0.5);

	}

	@Test
	public void checkSecondPrize() {
		Beauty beauty = this.beautyRepo.findById(3).get();
		Assertions.assertThat(beauty.getSecondClassified()).isEqualTo(beauty.getRewardMoney() * 0.35);
	}

	@Test
	public void checkThirdPrize() {
		Beauty beauty = this.beautyRepo.findById(3).get();
		Assertions.assertThat(beauty.getThirdClassified()).isEqualTo(beauty.getRewardMoney() * 0.15);
	}

	@ParameterizedTest
	@CsvSource({
		"1,8000,PLaceTest,2020-04-16,BeautyConTest2,1000,DRAFT", "1,8000,PLaceTest,2020-06-08,BeautyConTest,1000,DRAFT", "1,8000,PLaceTest,2020-11-08,BeautyConTest,1000,PENDING"
	})
	public void editBeauty(final Integer id, final Integer capacity, final String place, final LocalDate date, final String name, final Double rewardMoney, final String status) throws ReservedDateExeception, SponsorAmountException {
		Beauty beauty = new Beauty();

		beauty.setId(id);
		beauty.setCapacity(capacity);
		beauty.setPlace(place);
		beauty.setDate(date);
		beauty.setName(name);
		beauty.setRewardMoney(rewardMoney);
		beauty.setStatus(status);
		List<Sponsor> sponsors = new ArrayList<>();
		beauty.setSponsors(sponsors);

		try {
			this.beautyService.editBeauty(beauty);
			Assertions.assertThat(beauty.getId()).isNotNull();
		} catch (ReservedDateExeception | SponsorAmountException ex) {
			Logger.getLogger(PetServiceTests.class.getName()).log(Level.SEVERE, null, ex);
			Assertions.assertThat(beauty.getId()).isNull();
		}

	}

	@ParameterizedTest
	@CsvSource({
		"PENDING", "FINISHED"
	})
	public void editBeautyWithSponsors(final String status) {
		Beauty beauty = new Beauty();

		beauty.setId(1);
		beauty.setCapacity(8000);
		beauty.setPlace("Place Test");
		beauty.setDate(LocalDate.now().plusMonths(1));
		beauty.setName("Beauty Test");
		beauty.setRewardMoney(1000.00);
		beauty.setStatus(status);
		List<Sponsor> sponsors = new ArrayList<Sponsor>();
		Sponsor sponsor = new Sponsor();
		sponsor.setName("Sponsor1");
		sponsor.setMoney(7000.0);
		sponsors.add(sponsor);
		beauty.setSponsors(sponsors);
		Assertions.assertThat(beauty.getId()).isNotNull();
		Assertions.assertThat(beauty.getSponsors().stream().mapToDouble(x -> x.getMoney()).sum()).isGreaterThanOrEqualTo(7000.00);

	}
}