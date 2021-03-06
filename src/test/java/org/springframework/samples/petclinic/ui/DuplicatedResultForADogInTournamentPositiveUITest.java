package org.springframework.samples.petclinic.ui;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.extension.ExtendWith;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.context.junit.jupiter.SpringExtension;

//Prueba 3


@ExtendWith(SpringExtension.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class DuplicatedResultForADogInTournamentPositiveUITest {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @LocalServerPort
	private int port;
  
  @BeforeEach
  public void setUp() throws Exception {
//		String pathToGeckoDriver="C:\\Users\\Alvaro\\geckodriver-v0.26.0-win64";
		String value = System.getenv("webdriver.gecko.driver");
		
		System.setProperty("webdriver.gecko.driver", value );
//	
		driver = new FirefoxDriver();
		
		baseUrl = "https://www.google.com/";
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }
  
  @Test
  public void testHistoriaDeUsuario3() throws Exception {
    driver.get("http://localhost:"+ this.port);
    driver.findElement(By.xpath("//div[@id='main-navbar']/ul[2]/li/a")).click();
    driver.findElement(By.id("username")).click();
    driver.findElement(By.xpath("//div")).click();
    driver.findElement(By.id("username")).sendKeys("admin1");
    driver.findElement(By.id("password")).click();
    driver.findElement(By.xpath("//div")).click();
    driver.findElement(By.id("password")).sendKeys("4dm1n");
    driver.findElement(By.xpath("//button[@type='submit']")).click();
    driver.findElement(By.xpath("//div[@id='main-navbar']/ul/li[4]/a/span[2]")).click();
    driver.findElement(By.linkText("Beauty ConTEST")).click();
    driver.findElement(By.linkText("Add Dog Result")).click();
    driver.findElement(By.id("haircut")).click();
    driver.findElement(By.id("haircut")).clear();
    driver.findElement(By.id("haircut")).sendKeys("7");
    driver.findElement(By.id("haircutdif")).click();
    driver.findElement(By.id("haircutdif")).clear();
    driver.findElement(By.id("haircutdif")).sendKeys("7");
    driver.findElement(By.id("technique")).click();
    driver.findElement(By.id("technique")).clear();
    driver.findElement(By.id("technique")).sendKeys("7");
    driver.findElement(By.id("posture")).click();
    driver.findElement(By.id("posture")).clear();
    driver.findElement(By.id("posture")).sendKeys("7");
    driver.findElement(By.xpath("//button[@type='submit']")).click();
    driver.findElement(By.linkText("Show results")).click();
    assertEquals("Basil", driver.findElement(By.xpath("//table[@id='beautyResultTable']/tbody/tr[2]/td[2]")).getText());
    assertEquals("7", driver.findElement(By.xpath("//table[@id='beautyResultTable']/tbody/tr[2]/td[3]")).getText());
    assertEquals("7", driver.findElement(By.xpath("//table[@id='beautyResultTable']/tbody/tr[2]/td[4]")).getText());
    assertEquals("7", driver.findElement(By.xpath("//table[@id='beautyResultTable']/tbody/tr[2]/td[5]")).getText());
    assertEquals("7", driver.findElement(By.xpath("//table[@id='beautyResultTable']/tbody/tr[2]/td[6]")).getText());
    assertEquals("28", driver.findElement(By.xpath("//table[@id='beautyResultTable']/tbody/tr[2]/td[7]")).getText());
    assertEquals("28", driver.findElement(By.xpath("//table[@id='beautyResultTable']/tbody/tr[2]/td[7]")).getText());
  }

  @AfterEach
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
