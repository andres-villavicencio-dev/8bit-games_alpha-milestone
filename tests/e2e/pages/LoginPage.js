// Page Object Model for Login Page
class LoginPage {
  constructor(page) {
    this.page = page;
    this.usernameInput = '[placeholder="Username"]';
    this.passwordInput = '[placeholder="Password"]';
    this.loginButton = 'button[type="submit"]';
    this.errorMessage = '.error-message';
    this.successMessage = '.success-message';
  }

  async navigate() {
    await this.page.goto('/login');
  }

  async login(username, password) {
    await this.page.fill(this.usernameInput, username);
    await this.page.fill(this.passwordInput, password);
    await this.page.click(this.loginButton);
  }

  async expectLoginSuccess() {
    await this.page.waitForSelector(this.successMessage);
  }

  async expectLoginFailure() {
    await this.page.waitForSelector(this.errorMessage);
  }

  async getErrorMessage() {
    return await this.page.textContent(this.errorMessage);
  }
}

module.exports = { LoginPage };