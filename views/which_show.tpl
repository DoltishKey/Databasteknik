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
                <div class="form-inline" id="day_to_play">
                    <select class="form-control" name="play_day">
                        %if show_info[0][4][0:10]=='2016-06-10':
                            <option selected>Dag 1</option>
                            <option>Dag 2</option>
                            <option>Dag 3</option>
                        %elif show_info[0][4][0:10]=='2016-06-11':
                            <option>Dag 1</option>
                            <option selected>Dag 2</option>
                            <option>Dag 3</option>
                        %elif show_info[0][4][0:10]=='2016-06-12':
                            <option>Dag 1</option>
                            <option>Dag 2</option>
                            <option selected>Dag 3</option>
                        %end
                    </select>
                        <input type="input" class="form-control" placeholder="Starttid" name="start_tid" maxlength="5" value="{{show_info[0][4][11:]}}">
                    <h3> Speltid: </h3>

                    <div class="form-inline" id="slut_tid">
                        <label for="spel-start-tid"></label>
                        <select class="form-control" name="slut_tid_timmar">
                            <option>Timmar</option>
                            <option>0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                        <select class="form-control" name="slut_tid_minuter">
                            <option>Minuter</option>
                            <option>00</option>
                            <option>10</option>
                            <option>20</option>
                            <option>30</option>
                            <option>40</option>
                            <option>50</option>
                        </select>
                    </div>
                </div>

                <div class="form-inline" id="boka_spelning">
                    <label for="boka_spelning"></label>
                    <button type="submit" class="btn btn-default" id="do_booking">Boka</button>
                </div>
            </div>
        </form>
        <div class="table-responsive" id="spelschema">
            <div class="col-md-8 col-md-offset-2">
                <!-- For each in (tuple med band sorterat per dag) -->
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
                            </tr>
                        %end
                    </table>
                %else:
                    <h3 class="text-center"> Inga bokade spelningar </h3>
                %end
            </div>
        </div>
        %include('footer.tpl')
    </body>
</html>
