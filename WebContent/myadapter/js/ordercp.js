/**
 * 医嘱执行频次对比脚本
 */
$("#example-advanced").treetable({ expandable: true });
 
// Highlight selected row
$("#example-advanced tbody tr").mousedown(function() {
  $("tr.selected").removeClass("selected");
  $(this).addClass("selected");
});
 
// Drag & Drop Example Code
$("#example-advanced .file, #example-advanced .folder").draggable({
  helper: "clone",
  opacity: .75,
  refreshPositions: true,
  revert: "invalid",
  revertDuration: 300,
  scroll: true
});
 
$("#example-advanced .folder").each(function() {
  $(this).parents("tr").droppable({
    accept: ".file, .folder",
    drop: function(e, ui) {
      var droppedEl = ui.draggable.parents("tr");
      $("#example-advanced").treetable("move", droppedEl.data("ttId"), $(this).data("ttId"));
    },
    hoverClass: "accept",
    over: function(e, ui) {
      var droppedEl = ui.draggable.parents("tr");
      if(this != droppedEl[0] && !$(this).is(".expanded")) {
        $("#example-advanced").treetable("expandNode", $(this).data("ttId"));
      }
    }
  });
});