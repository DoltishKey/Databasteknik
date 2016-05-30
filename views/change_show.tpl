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
                    %if len(day1)>0:
                        <table class="table">
                            <tr>
                                <th>Band</th>
                                <th>Start-tid</th>
                                <th>Slut-tid</th>
                                <th>Scen</th>
                            </tr>
                            %for each_play in day1:
                                <tr>
                                    <td>{{each_play[1]}}</td>
                                    <td>{{each_play[6]}}</td>
                                    <td>{{each_play[7]}}</td>
                                    <td>{{each_play[8]}}</td>
                                    <form method="GET" action="/edith_play/{{each_play[0]}}">
                                        <td><button type="submit" class="btn btn-default">ändra</button><td>
                                    </form>
                                    <form method="POST" action="/edith_play/{{each_play[0]}}/{{each_play[9]}}/{{each_play[4]+ " " + each_play[6]}}/del">
                                        <td><button type="submit" class="btn btn-default">ta bort</button><td>
                                    </form>
                                </tr>
                            %end
                        </table>
                    %else:
                     <h3 class="text-center"> Inga bokade spelningar </h3>
                    %end
                    <h1>Dag 2 </h1>
                    %if len(day2)>0:
                        <table class="table">
                            <tr>
                                <th>Band</th>
                                <th>Start-tid</th>
                                <th>Slut-tid</th>
                                <th>Scen</th>
                            </tr>
                            %for each_play in day2:
                                <tr>
                                    <td>{{each_play[1]}}</td>
                                    <td>{{each_play[6]}}</td>
                                    <td>{{each_play[7]}}</td>
                                    <td>{{each_play[8]}}</td>
                                    <form method="GET" action="/edith_play/{{each_play[0]}}">
                                        <td><button type="submit" class="btn btn-default">ändra</button><td>
                                    </form>
                                    <form method="POST" action="/edith_play/{{each_play[0]}}/{{each_play[9]}}/{{each_play[4]+ " " + each_play[6]}}/del">
                                        <td><button type="submit" class="btn btn-default">ta bort</button><td>
                                    </form>
                                </tr>
                            %end
                        </table>
                    %else:
                     <h3 class="text-center"> Inga bokade spelningar </h3>
                    %end
                    <h1>Dag 3 </h1>
                    %if len(day3)>0:
                        <table class="table">
                            <tr>
                                <th>Band</th>
                                <th>Start-tid</th>
                                <th>Slut-tid</th>
                                <th>Scen</th>
                            </tr>
                            %for each_play in day3:
                                <tr>
                                    <td>{{each_play[1]}}</td>
                                    <td>{{each_play[6]}}</td>
                                    <td>{{each_play[7]}}</td>
                                    <td>{{each_play[8]}}</td>
                                    <form method="GET" action="/edith_play/{{each_play[0]}}">
                                        <td><button type="submit" class="btn btn-default">ändra</button><td>
                                    </form>
                                    <form method="POST" action="/edith_play/{{each_play[0]}}/{{each_play[9]}}/{{each_play[4]+ " " + each_play[6]}}/del">
                                        <td><button type="submit" class="btn btn-default">ta bort</button><td>
                                    </form>
                                </tr>
                            %end
                        </table>
                    %else:
                     <h3 class="text-center"> Inga bokade spelningar </h3>
                    %end
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
