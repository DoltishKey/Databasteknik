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
                            <th>Band</th>
                            <th>Start-tid</th>
                            <th>Slut-tid</th>
                            <th>Scen</th>
                        </tr>
                        %for each in spelschema:
                            <tr>
                                <td>{{each[0]}}</td>
                                <td>{{each[3]}}</td>
                                <td>{{each[4]}}</td>
                                <td>{{each[5]}}</td>
                                <td><button type="submit" class="btn btn-default">ändra/ta bort</button><td>
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
