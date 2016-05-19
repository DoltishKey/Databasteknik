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
            <li role="navigation"><a href="/add_play">Lägg till spelning</a></li>
            <li role="navigation" class="active"><a href="/edith_play">Ändra/Ta bort spelning</a></li>
        </ul>
        <div id="show" class="col-md-10">
            <div class="more_info col-md-3">
                <h3>Ändra spelning</h3>
                <div class="form-group">
                    <label for="bandnamn">Välj Band</label>
                    <select class="form-control">
                        <option></option>
                        <option>Lasse Stefanz</option>
                        <option>Metallica</option>
                        <option>Håkan Hellström</option>
                        <option>Prince</option>
                    </select>
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
                            <td><button type="submit" class="btn btn-default">ändra/ta bort</button><td>
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
