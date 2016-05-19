<!DOCTYPE html>
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')
        <div class="container-fluid ">
            <div class="row">
                <form class="col-md-6 col-md-offset-3" action="/do_book_band" method="post">
                    <h1>Boka band</h1>
                    <ul class="list-group inputs">
                        <li class="list-group-item">
                            <div id="band">
                                <h3>Bandet</h3>
                                <div class="more_info new_band">
                                    <div class="form-group">
                                        <label for="bandnamn">Bandnamn</label>
                                        <input type="input" class="form-control" id="bandnamn" name="bandnamn" placeholder="Bandnamn">
                                    </div>
                                    <div class="form-group">
                                        <label for="land">Ursprungsland</label>
                                        <input type="input" class="form-control" id="land" name="land" placeholder="Ursprungsland">
                                    </div>
                                    <div class="form-group">
                                        <label for="loge">Loge</label>
                                        <input type="input" class="form-control" id="loge" name="loge" placeholder="Loge">
                                    </div>
                                    <div class="form-group">
                                        <label for="stil">Stil</label>
                                        <select class="form-control" id="stil" name="stil">
                                            <option>Pop</option>
                                            <option>Rock</option>
                                            <option>Dansband</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item artist" data-nr="1">
                            <h4>Ny medlem <span style="" class="pull-right show_more_info btn btn-primary">+</span></h4>

                            <div class="more_info new_artist">
                                <div class="form-group">
                                    <label for="artist-namn">Namn</label>
                                    <input type="input" class="form-control artist_name-1" id="artist-namn" name="artist-namn" placeholder="Namn">
                                </div>
                                <div class="form-group">
                                    <label for="pers_nr">Personnummer</label>
                                    <input type="input" class="form-control pers_nr" id="pers_nr" name="pers_nr" placeholder="Personnummer">
                                </div>
                                <div class="form-group">
                                    <label for="artist-tele">Tele</label>
                                    <input type="input" class="form-control artist-tele-1" id="artist-tele" name="artist-tele" placeholder="Tele">
                                </div>
                                <div class="form-group">
                                    <label for="artist-important">Viktig info</label>
                                    <textarea class="form-control artist-important-1" rows="3" id="artist-important" name="artist-important" placeholder="Kul info"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="artist-kul">Kul info</label>
                                    <textarea class="form-control artist-kul-1" rows="3" id="artist-kul" name="artist-kul" placeholder="Kul info"></textarea>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <button type="button" class="btn btn-link" id="add_artist">Lägg till ytterligare medlem +</button>
                    <button type="submit" class="btn btn-primary col-xs-12">Genomför bokning</button>
                </form>
            </div>
        </div>

        %include('footer.tpl')
    </body>
</html>
