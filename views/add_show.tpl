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
                    <select class="form-control" name="band_name" required>
                        <option></option>
                        %for band in bands:
                            <option>{{band[1]}}</option>
                        %end
                    </select>
                </div>
                <div class="form-group">
                    <label for="vilken_scen">Vilken scen</label>
                        <select class="form-control" name="stage_name" required>
                            <option></option>
                            %for scen in scener:
                                <option>{{scen[0]}}</option>
                            %end
                        </select>
                </div>
            </div>
            <div class="row col-md-3">

                <h3>Boka spelning</h3>
                <div class="form-inline" id="day_to_play">
                    <select class="form-control" name="play_day">
                        <option>Dag 1</option>
                        <option>Dag 2</option>
                        <option>Dag 3</option>
                    </select>
                        <p> <em>Starttid:</em></p>
                        <select class="form-control" name="start_tid_timmar" required>
                            %for i in xrange(24):
                        		%if len(str(i))==1:
                        			<option>{{"0"+str(i)}}</option>
                        		%else:
                        			<option>{{str(i)}}</option>
                                %end
                            %end
                        </select>
                        :
                        <select class="form-control" name="start_tid_minuter" required>
                            <option>00</option>
                            <option>10</option>
                            <option>20</option>
                            <option>30</option>
                            <option>40</option>
                            <option>50</option>
                        </select>
                        <h3> Speltid: </h3>
                    <div class="form-inline" id="slut_tid">
                        <label for="spel-start-tid"></label>
                        <select class="form-control" name="slut_tid_timmar" required>
                            <option>Timmar</option>
                            <option>0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                        <select class="form-control" name="slut_tid_minuter" required>
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
