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
    var num_artists = 1
    $('#add_artist').click(function(){
        num_artists ++
        $('.inputs').append('<li class="list-group-item artist" data-nr="'+num_artists+'">\
                <h4>Ny medlem <span style="" class="pull-right show_more_info btn btn-primary">-</span></h4> \
                <div class="new_artist"> \
                    <div class="form-group"> \
                        <label for="artist-namn">Namn</label> \
                        <input type="input" class="form-control artist_name-'+ num_artists+'" id="artist-namn" name="artist-namn" placeholder="Namn"> \
                    </div> \
                    <div class="form-group"> \
                        <label for="pers_nr">Personnummer</label> \
                        <input type="input" class="form-control pers_nr" id="pers_nr" name="pers_nr" placeholder="Personnummer"> \
                    </div> \
                    <div class="form-group"> \
                        <label for="artist-tele">Tele</label> \
                        <input type="input" class="form-control artist-tele-'+ num_artists+'" id="artist-tele" name="artist-tele" placeholder="Tele"> \
                    </div>  \
                    <div class="form-group"> \
                        <label for="artist-important">Viktig info</label> \
                        <textarea class="form-control artist-important-'+ num_artists+'" rows="3" id="artist-important" name="artist-important" placeholder="Kul info"></textarea> \
                    </div> \
                    <div class="form-group"> \
                        <label for="artist-kul">Kul info</label> \
                        <textarea class="form-control artist-kul-'+ num_artists+'" rows="3" id="artist-kul" name="artist-kul" placeholder="Kul info"></textarea> \
                    </div> \
                </div> \
            </li>'
        );
    });

    $('.list-group').on('keyup', '.pers_nr', function(){
        if ($(this).val().length > 5){
            var this_item = $(this);
            num = this_item.parents('.artist').data('nr')
            $.ajax({
                type: 'POST',
                url: '/ajax_new_artist/' + num,
                dataType: 'json',
                data: $(this).serialize(),
                success: function(response) {
                    if(response['status'] == 'Finns'){
                        $('.artist_name-'+num).val(response['namn'])
                        $('.artist-tele-'+num).val(response['tele'])
                        $('.artist-important-'+num).val(response['viktig_info'])
                        $('.artist-kul-'+num).val(response['kul_info'])
                    }
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


    $('.change_staff_contact').hide();
    $('.save_contact').hide();
    $('.change_contact').click(function(){
        $(this).parents('td').find('.change_staff_contact').show();
        $(this).parents('td').find('.save_contact').show();
        $(this).hide();
    });



    $('.get_security_info').click(function(){
        $(this).popover('toggle');
    });

    $('.get_band_info').click(function(){
        $(this).popover('toggle');
    });

    $('.contacts_bands').hide()
    $('.contact_persons_band').click(function() {
        $(this).find('.contacts_bands').toggle()
    })


});
