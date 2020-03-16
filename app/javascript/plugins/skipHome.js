const skip = () => {
  const button = document.getElementById('skip-btn');
  setTimeout(() => button.click(), 4500)
}

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
