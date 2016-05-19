<!DOCTYPE html>
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')
        <div class="container-fluid ">
            <div class="row">
                <form class="col-md-6 col-md-offset-3">
                    <h1>Boka band</h1>
                    <ul class="list-group inputs">
                        <li class="list-group-item">
                            <div id="band">
                                <h3>Bandet</h3>
                                <div class="more_info new_band">
                                    <div class="form-group">
                                        <label for="bandnamn">Bandnamn</label>
                                        <input type="input" class="form-control" id="bandnamn" placeholder="Bandnamn">
                                    </div>
                                    <div class="form-group">
                                        <label for="land">Ursprungsland</label>
                                        <input type="input" class="form-control" id="land" placeholder="Ursprungsland">
                                    </div>
                                    <div class="form-group">
                                        <label for="loge">Loge</label>
                                        <input type="input" class="form-control" id="loge" placeholder="Loge">
                                    </div>
                                    <div class="form-group">
                                        <label for="stil">Stil</label>
                                        <select class="form-control" id="stil">
                                            <option>Pop</option>
                                            <option>Rock</option>
                                            <option>Dansband</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item artist">
                            <h4>Ny medlem <span style="" class="pull-right show_more_info btn btn-primary">+</span></h4>

                            <div class="more_info new_artist">
                                <div class="form-group">
                                    <label for="artist-namn">Namn</label>
                                    <input type="input" class="form-control artist_name" id="artist-namn" placeholder="Namn">
                                    <ul class="list-group existing_artists">

                                    </ul>
                                </div>
                                <div class="form-group">
                                    <label for="artist-tele">Tele</label>
                                    <input type="input" class="form-control" id="artist-tele" placeholder="Tele">
                                </div>
                                <div class="form-group">
                                    <label for="artist-important">Viktig info</label>
                                    <textarea class="form-control" rows="3" id="artist-important" placeholder="Kul info"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="artist-kul">Kul info</label>
                                    <textarea class="form-control" rows="3" id="artist-kul" placeholder="Kul info"></textarea>
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
