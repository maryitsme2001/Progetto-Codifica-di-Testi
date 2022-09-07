$(document).ready(function () {
  clicked = 0;
  click1 = 0;
  click2 = 0;
  click3 = 0;
  click4 = 0;
  click5 = 0;
  click6 = 0;

  click7 = 0;
  click8 = 0;
  click9 = 0;
  click10 = 0;
  click11 = 0;



  function control(click, vettore, color) {
    if (click % 2 == 1) {
      for (i = 0; i <= vettore.length; i++) {
        vettore[i].style.background = color;
      }
    }

    if (click % 2 == 0) {
      for (i = 0; i <= vettore.length; i++) {
        vettore[i].style.background = "none";
      }
    }
  }
/*terminologia gialla*/
  $("#term").on("click", function () {
    clicked += 1;

    vect = $(".termini");

    control(clicked, vect, "yellow");
  });

  $("reg").hide();

  $("#reg").on("click", function () {
    click1 += 1;

    $("reg").fadeIn();

    vect = $("reg");

    if (click1 % 2 == 1) {
      $("orig").hide();
      $("reg").fadeIn();
    }

    if (click1 % 2 == 0) {
      $("orig").fadeIn();
      $("reg").hide();
    }

    control(click1, vect, "#FFA500");
  });

/*esempi lingustici*/
  $("#el").each(function () {
    $(this).on("click", function (e) {
      click2 += 1;

      vect = $("mentioned");

      control(click2, vect, "#00FFFF");
    });
  });


  /*glottonimi*/
  $("#lang").on("click", function () {
    click3 += 1;

    vect = $(".lang");

    control(click3, vect, "#556B2F");
  });

  $('#lang').click(function () {
    if ($(this).prop("checked") == true) {
      langs = $(".lang");

      for (i = 0; i <= langs.length; i++) {
        langs[i].style.background = "#556B2F";
      }
    } else if ($(this).prop("checked") == false) {
      for (i = 0; i <= langs.length; i++) {
        langs[i].style.background = "none";
      }
    }
  }); 

  /*toponimi*/
  $("#nomiluogo").on("click", function () {
    click4 += 1;

    vect = $(".place");

    control(click4, vect, "#A52A2A");
  });

  $('#nomiluogo').click(function () {
    if ($(this).prop("checked") == true) {
      nomiluogos = $(".place");

      for (i = 0; i <= nomiluogos.length; i++) {
        nomiluogos[i].style.background = "#FF6347";
      }
    } else if ($(this).prop("checked") == false) {
      for (i = 0; i <= nomiluogos.length; i++) {
        nomiluogos[i].style.background = "none";
      }
    }
  }); 
  
  /*antroponimi*/

  $("#nomipersona").on("click", function () {
    click5 += 1;

    vect = $(".nome");

    control(click5, vect, "#B8860B");
  });

  $('#nomipersona').click(function () {
    if ($(this).prop("checked") == true) {
      nomipersonas = $(".nome");

      for (i = 0; i <= nomipersonas.length; i++) {
        nomipersonas[i].style.background = "lightpink";
      }
    } else if ($(this).prop("checked") == false) {
      for (i = 0; i <= nomipersonas.length; i++) {
        nomipersonas[i].style.background = "none";
      }
    }
  }); 

/*istituzione*/
$("#orgName").on("click", function () {
  click6 += 1;

  vect = $(".istituzione");

  control(click6, vect, "#800080");
});

$('#orgName').click(function () {
  if ($(this).prop("checked") == true) {
    istituzionis = $(".istituzione");

    for (i = 0; i <= istituzionis.length; i++) {
      istituzionis[i].style.background = "#800080";
    }
  } else if ($(this).prop("checked") == false) {
    for (i = 0; i <= istituzionis.length; i++) {
      istituzionis[i].style.background = "none";
    }
  }
}); 


/*cancellazioni e gap*/
$("del").hide();
  $(".gap").hide();
 

  $("#del").on("click", () => {
    click7 += 1;
    

    if (click7 % 2 == 1) {
      $("del").fadeIn();
      $(".gap").show();
      $(".gap").css("background","pink");
      

 }
    if (click7 % 2 == 0) {
      $("del").fadeOut();
      $(".gap").fadeOut();
    }
  });


  $(".expan").hide();

/*cambia visualizzazione abbreviazioni*/
  $("#abbreviazioni").on("click", function () {
    click8 += 1;

    if (click8 % 2 == 1) {
      $(".abbr").css("font-weight", "bold");
      $(".expan").fadeIn();
    }

    if (click8 % 2 == 0) {
      $(".abbr").css("font-weight", "normal");
      $(".expan").fadeOut();
    }
  });

  $('#abbreviazioni').click(function () {
    if ($(this).prop("checked") == true) {
      abbreviazionis = $(".abbr");

      for (i = 0; i <= abbreviazionis.length; i++) {
        abbreviazionis[i].style.background = "#3399FF";
      }
    } else if ($(this).prop("checked") == false) {
      for (i = 0; i <= abbreviazionis.length; i++) {
        abbreviazionis[i].style.background = "none";
      }
    }
  }); 


  $('.abbr').on("mouseover",function () {
    
    $(this).css("font-weight", "bold");
    $(this).next().fadeIn();

  });

  $('.abbr').on("mouseleave", function () {
  
    $(this).next().hide();
    $(this).css("font-weight", '');

  });

   $("add").hide();

  $('#add').on("click",function () {

    click9+=1;

    if(click9 % 2 == 1) {
    
    $("add").fadeIn();
    $("add").css("background", "grey");


    }

    if(click9 % 2 == 0) {

      $("add").fadeOut();

    }
    

  });


});

$('#add').click(function () {
  if ($(this).prop("checked") == true) {
    adds = $(".add");

    for (i = 0; i <= adds.length; i++) {
      adds[i].style.background = "#f0e4f5";
    }
  } else if ($(this).prop("checked") == false) {
    for (i = 0; i <= adds.length; i++) {
      adds[i].style.background = "none";
    }
  }
}); 
