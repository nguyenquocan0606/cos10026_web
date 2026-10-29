// Keep native HTML validation and add calendar and checkbox-group checks.
const applicationForm = document.querySelector('#application-form');
const skillInputs = [...applicationForm.querySelectorAll('[name="skills[]"]')];
const birthDate = applicationForm.elements.date_of_birth;

function validateSkills() {
  skillInputs[0].setCustomValidity(
    skillInputs.some(input => input.checked) ? '' : 'Select at least one skill.'
  );
}

function validateBirthDate() {
  birthDate.setCustomValidity('');
  const parts = /^(\d{2})\/(\d{2})\/(\d{4})$/.exec(birthDate.value);
  if (!parts) return; // required and pattern handle empty or malformed values.
  const [, day, month, year] = parts.map(Number);
  const entered = new Date(0);
  entered.setFullYear(year, month - 1, day);
  entered.setHours(0, 0, 0, 0);
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  if (year < 1 || entered.getFullYear() !== year ||
      entered.getMonth() !== month - 1 || entered.getDate() !== day) {
    birthDate.setCustomValidity('Enter a real date in dd/mm/yyyy format.');
  } else if (entered > today) {
    birthDate.setCustomValidity('Your date of birth cannot be in the future.');
  }
}

skillInputs.forEach(input => input.addEventListener('change', validateSkills));
birthDate.addEventListener('input', validateBirthDate);
birthDate.addEventListener('change', validateBirthDate);
applicationForm.addEventListener('reset', () => {
  // The reset event fires before the browser restores the input values.
  setTimeout(() => {
    validateSkills();
    validateBirthDate();
  }, 0);
});
window.addEventListener('pageshow', () => {
  validateSkills();
  validateBirthDate();
});
validateSkills();
validateBirthDate();
