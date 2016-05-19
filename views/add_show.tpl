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
            <div class="more_info new_show">
                <div class="form-group">
                    <label for="bandnamn">Band</label>
                    <select class="form-control">
                        <option></option>
                        <option>Lasse Stefanz</option>
                        <option>Metallica</option>
                        <option>Håkan Hellström</option>
                        <option>Prince</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="vilken_scen">Vilken scen</label>
                        <select class="form-control">
                            <option></option>
                            <option>Mallorca-scenen</option>
                            <option>Dieseltältet</option>
                            <option>Åkanten</option>
                        </select>
                </div>
                <div class="form-group">
                    <label for="vilken_dag">Dag</label>
                        <select class="form-control">
                            <option></option>
                            <option>Dag 1</option>
                            <option>Dag 2</option>
                            <option>Dag 3</option>
                        </select>
                </div>
            </div>
            <div class="row col-md-3">
                <h3>Boka spelning</h3>
                <div class="form-inline" id="start_tid">
                    <label for="spel-start-tid"></label>
                    <input type="input" class="form-control" placeholder="Start-tid">
                </div>
                <div class="form-inline" id="slut_tid">
                    <label for="spel-start-tid"></label>
                    <input type="input" class="form-control"  placeholder="Slut-tid">
                </div>
                <div class="form-inline" id="boka_spelning">
                    <label for="boka_spelning"></label>
                    <button type="submit" class="btn btn-default" id="do_booking">Boka</button>
                </div>
            </div>
            <div class="table-responsive" id="spelschema">
                <div class="col-md-12">
                    <!-- Sortera efter scen och dag -->
                    <h1>Dag 1 </h1>
                    <table class="table">
                        <tr>
                            <th>Bandnamn</th>
                            <th>Start-tid</th>
                            <th>Slut-tid</th>
                            <th>Scen</th>
                        </tr>
                        <tr>
                            <td>Lasse Stefanz</td>
                            <td>18.00</td>
                            <td>20:00</td>
                            <td>Mallorca</td>
                        </tr>
                        <tr>
                            <td>Metallica</td>
                            <td>21.00</td>
                            <td>23:59</td>
                            <td>Dieseltältet</td>
                        </tr>
                        <tr>
                            <td>Håkan Hellström</td>
                            <td>22:30</td>
                            <td>23:59</td>
                            <td>Åkanten</td>
                        </tr>
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
