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
        <div id="show" class="col-md-8 col-md-offset-2">
            <form method="POST" action="/edith_play/{{show_info[0][0]}}/{{show_info[0][7]}}">
            <div class="more_info new_show">
                <div class="form-group">
                    <h1> Ändra spelning för {{show_info[0][1]}}
                </div>
                <div class="form-group">
                    <label for="vilken_scen">Vilken scen</label>
                        <select class="form-control" name="stage_name">
                            <option></option>
                            %for scen in scener:
                                %if scen[0]==show_info[0][6]:
                                    <option selected>{{scen[0]}}</option>
                                %else:
                                    <option>{{scen[0]}}
                                %end
                            %end
                        </select>
                </div>
            </div>
            <div class="row col-md-3">
                <h3>Ändra spelning</h3>
                <div class="form-inline" id="start_tid">
                    <label for="spel-start-tid"></label>
                    <input type="input" class="form-control" placeholder="Start-datum och tid" name="start_tid" value="{{show_info[0][4]}}">
                </div>
                <div class="form-inline" id="slut_tid">
                    <label for="spel-start-tid"></label>
                    <input type="input" class="form-control"  placeholder="Slut-datum och tid" name="slut_tid" value="{{show_info[0][5]}}">
                </div>
                <div class="form-inline" id="change_del_show">
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
