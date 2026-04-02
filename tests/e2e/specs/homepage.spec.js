// Example E2E test using Playwright
const { test, expect } = require('@playwright/test');

test.describe('Homepage', () => {
  test.beforeEach(async ({ page }) => {
    // Navigate to the homepage before each test
    await page.goto('/');
  });

  test('should display the main heading', async ({ page }) => {
    // Arrange
    const expectedHeading = '8-bit RPG Adventure';

    // Act
    const heading = await page.locator('h1').textContent();

    // Assert
    expect(heading).toEqual(expectedHeading);
  });

  test('should navigate to gameplay section when clicking play button', async ({ page }) => {
    // Act
    await page.click('text=Play Game');
    
    // Assert
    await expect(page).toHaveURL('/game');
  });

  test('should display character selection after login', async ({ page }) => {
    // Arrange
    await page.click('text=Login');
    await page.fill('[placeholder="Username"]', 'testuser');
    await page.fill('[placeholder="Password"]', 'password123');
    
    // Act
    await page.click('button[type="submit"]');
    
    // Assert
    await expect(page.locator('text=Select Your Character')).toBeVisible();
  });
});