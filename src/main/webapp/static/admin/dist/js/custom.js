$(function () {
  $("#myTable").DataTable();
});

function confirmDelete(text) {
  if (!window.confirm("Are you sure you want to delete this " + text + " ?")) {
    return false;
  }
}