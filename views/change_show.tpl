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

            <div class="table-responsive" id="spelschema">
                <div class="col-md-8 col-md-offset-2">
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
                                <form method="GET" action="/edith_play/{{each[0]}}">
                                    <td><button type="submit" class="btn btn-default">ändra</button><td>
                                </form>
                                <form method="POST" action="/edith_play/{{each[0]}}/{{each[9]}}/del">
                                    <td><button type="submit" class="btn btn-default">ta bort</button><td>
                                </form>
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
