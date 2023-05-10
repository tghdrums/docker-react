// This is the file referenced when we run the "docker run -it 7ee425c2200a npm run test" command

import { render, screen } from '@testing-library/react';
import App from './App';

// This is the part of the code that runs the test
test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});

// The above was copied to demonstrate that the test was only run once because
// the original App.test.js file was copied into the container and this change
//will not have bee reflected inside there yet.
test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});

