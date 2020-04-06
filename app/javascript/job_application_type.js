$(document).ready(function() {
  $('input[type="radio"][name="job[job_application_type]"]').change(function() {
      if (this.value == 'Email') {
          $('.form-group.show-job-url').addClass('form-group--inactive');
          $('.form-group.show-job-email').removeClass('form-group--inactive');
      }
      else if (this.value == 'Url') {
          $('.form-group.show-job-url').removeClass('form-group--inactive');
          $('.form-group.show-job-email').addClass('form-group--inactive');
      }
  });
});
