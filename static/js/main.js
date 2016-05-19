$(document).ready(function () {
    $('.new_artist').hide();
    $('.inputs').on('click', '.show_more_info', function(){
        $(this).parents('.list-group-item.artist').find('.new_artist').toggle();
        if ($(this).text() == '+'){
            $(this).text('-');
        }
        else{
            $(this).text('+');
        }

    });
    $('#add_artist').click(function(){
        $('.inputs').append('<li class="list-group-item artist">\
                <h4>Ny medlem <span style="" class="pull-right show_more_info btn btn-primary">-</span></h4> \
                <div class="new_artist"> \
                    <div class="form-group"> \
                        <label for="artist-namn">Namn</label> \
                        <input type="input" class="form-control" id="artist-namn" placeholder="Namn"> \
                    </div> \
                    <div class="form-group"> \
                        <label for="artist-tele">Tele</label> \
                        <input type="input" class="form-control" id="artist-tele" placeholder="Tele"> \
                    </div>  \
                    <div class="form-group"> \
                        <label for="artist-important">Viktig info</label> \
                        <textarea class="form-control" rows="3" id="artist-important" placeholder="Kul info"></textarea> \
                    </div> \
                    <div class="form-group"> \
                        <label for="artist-kul">Kul info</label> \
                        <textarea class="form-control" rows="3" id="artist-kul" placeholder="Kul info"></textarea> \
                    </div> \
                </div> \
            </li>'
        );
    });

    $('.list-group').on('keyup', '.artist_name', function(){
        if ($(this).val().length > 2){
            var this_item = $(this);
            artists = ['Nisse', 'Kalle', 'Pelle']
            $.each(artists, function(index, value) {
                if(value.indexOf(this_item.val()) != -1){
                    this_item.siblings('.existing_artists').append('<li class="list-group-item ">'+value+'</li>');
                }
            });
        }
    });

    $('.more_staff_info').hide();

    $('.staff').on('click', '.show_more_info', function(){
        $(this).parents('.list-group-item').find('.more_staff_info').toggle();
        if ($(this).text() == '+'){
            $(this).text('-');
        }
        else{
            $(this).text('+');
        }

    });

    $('.add_new_staff_member').hide();
    $('#add_staff').click(function(){
        $(this).hide();
        $('.add_new_staff_member').show();
    });

    $('.change_staff_security').hide();

    $('.change_security').click(function(){
        $(this).removeClass('btn-primary');
        $(this).addClass('btn-success');
        $(this).text('Spara');
        $(this).parents('td').prev().find('.selected_staff_securoty').hide();
        $(this).parents('td').prev().find('.change_staff_security').show();
    });

    $('.get_security_info').click(function(){
        $(this).popover('toggle');
    });



});
