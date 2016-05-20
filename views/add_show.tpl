<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')

        <div class="container">
            <div class="row text-center">
                <h1> Blomstermåla RockFestival</h1>
            </div>
        </div>
        <ul class="nav nav-tabs nav-justified">
            <li role="navigation" class="active"><a href="/add_play">Lägg till spelning</a></li>
            <li role="navigation"><a href="/edith_play">Ändra/Ta bort spelning</a></li>
        </ul>
        <div id="show" class="col-md-8 col-md-offset-2">
            <h3>Lägg till spelning</h3>
            <form method="POST" action="/add_play">
            <div class="more_info new_show">
                <div class="form-group">
                    <label for="bandnamn">Band</label>
                    <select class="form-control" name="band_name">
                        <option></option>
                        %for band in bands:
                            <option>{{band[1]}}</option>
                        %end
                    </select>
                </div>
                <div class="form-group">
                    <label for="vilken_scen">Vilken scen</label>
                        <select class="form-control" name="stage_name">
                            <option></option>
                            %for scen in scener:
                                <option>{{scen[0]}}</option>
                            %end
                        </select>
                </div>
            </div>
            <div class="row col-md-3">
                <h3>Boka spelning</h3>
                <div class="form-inline" id="start_tid">
                    <label for="spel-start-tid"></label>
                    <input type="input" class="form-control" placeholder="Start-datum och tid" name="start_tid">
                </div>
                <div class="form-inline" id="slut_tid">
                    <label for="spel-start-tid"></label>
                    <input type="input" class="form-control"  placeholder="Slut-datum och tid" name="slut_tid">
                </div>
                <div class="form-inline" id="boka_spelning">
                    <label for="boka_spelning"></label>
                    <button type="submit" class="btn btn-default" id="do_booking">Boka</button>
                </div>
            </div>
        </form>
            <div class="table-responsive" id="spelschema">
                <div class="col-md-12">
                    <!-- Sortera efter scen och dag -->
                    <h1>Dag 1 </h1>
                    <table class="table">
                        <tr>
                            <th>Band</th>
                            <th>Start-tid</th>
                            <th>Slut-tid</th>
                            <th>Scen</th>
                        </tr>
                        %for each in spelschema:
                            <tr>
                                <td>{{each[1]}}</td>
                                <td>{{each[6]}}</td>
                                <td>{{each[7]}}</td>
                                <td>{{each[8]}}</td>
                            </tr>
                        %end
                    </table>
                </div>
            </div>
        </div>
        <footer class="col-md-12 text-center">
            <hr>
            <h4>Blomstermåla Rockfestival AB</h2>
        </footer>
        %include('footer.tpl')
    </body>
</html>
