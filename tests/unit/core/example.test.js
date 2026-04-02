// Example unit test for a core utility function
describe('StringUtils', () => {
  // Import the utility being tested
  // const { StringUtils } = require('../../../src/core/utils/stringUtils');
  
  describe('truncate', () => {
    test('should truncate long text with suffix', () => {
      // Arrange
      const text = 'This is a very long text that needs to be truncated';
      const maxLength = 20;
      const expected = 'This is a very l...';
      
      // Act
      // const result = StringUtils.truncate(text, maxLength);
      
      // Assert
      // expect(result).toBe(expected);
    });
    
    test('should not modify text shorter than max length', () => {
      // Arrange
      const text = 'Short text';
      const maxLength = 20;
      const expected = 'Short text';
      
      // Act
      // const result = StringUtils.truncate(text, maxLength);
      
      // Assert
      // expect(result).toBe(expected);
    });
  });
});