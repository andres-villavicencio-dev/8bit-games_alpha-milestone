// Jest setup file
// This file runs once before all tests

// Set up global test utilities
global.TestUtils = {
  // Utility to create mock game objects
  createMockGameObject: (properties = {}) => {
    return {
      name: 'MockGameObject',
      ...properties,
      destroy: jest.fn(),
      emitSignal: jest.fn()
    };
  },
  
  // Utility to create mock nodes
  createMockNode: (name = 'MockNode', properties = {}) => {
    return {
      name: name,
      ...properties,
      addChild: jest.fn(),
      removeChild: jest.fn(),
      queueFree: jest.fn()
    };
  }
};

// Console spying for testing error logging
global.console = {
  log: jest.fn(),
  error: jest.fn(),
  warn: jest.fn(),
  info: jest.fn()
};

// Clean up after each test
afterEach(() => {
  jest.clearAllMocks();
});