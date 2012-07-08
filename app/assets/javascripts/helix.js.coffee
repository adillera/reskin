$ ->
  $(".project-item").live "click", ->
    projectHolder = $("#projects-holder")
    nucleusClone = $("#nucleus").clone().attr("id", "project-main")
    element = $(this)
    elementOffset = element.offset()
    elementTitleClone = element.find(".title").clone()
    elementClone = $("#item-clone").clone().attr("id", "element-clone")
    element.before(elementClone)

    $("#element-clone").html(elementTitleClone).css
      position: "absolute"
      top: elementOffset.top
      left: elementOffset.left
      margin: 0

    $(".project-item").animate
      opacity: 0.3

    $(".project-item").queue ->
      $(this).animate
        left: "-9000", ->
          $(this).hide()

      $("#element-clone").animate
        left: ($(window).innerWidth() / 2) - ($("#element-clone").css("width").split("px")[0] / 2)
        top: ($(window).innerHeight() / 2) - ($("#element-clone").css("height").split("px")[0] / 2)

      $("#element-clone").fadeOut "slow", ->
        header = element.find(".title").text()

        $("#holder").append(nucleusClone)

        $("#project-main").html("<h1>" + header + "</h1>")

        $("#project-main").css
          left: ($(window).innerWidth() / 2) - ($("#project-main").css("width").split("px")[0] / 2)
          top: ($(window).innerHeight() / 2) - ($("#project-main").css("height").split("px")[0] / 2)

        $("#project-main").fadeIn("slow")

      $(this).dequeue()
