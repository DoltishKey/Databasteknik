<!DOCTYPE html>
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')

        <div class="container">
            <div class="row text-center">
                <h1> Spelschema för {{spelschema[0][1]}}</h1>
            </div>
        </div>
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
                                <td>{{each_play[4][11:]}}</td>
                                <td>{{each_play[5][11:]}}</td>
                                <td>{{each_play[6]}}</td>
                                <td><a href="/bandinfo/{{each_play[0]}}"><button type="button" class="btn btn-default"
                                data-container="body" data-toggle="popover" data-placement="right"
                                data-html="true">Info
                            </button></a></td>
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
                                <td>{{each_play[4][11:]}}</td>
                                <td>{{each_play[5][11:]}}</td>
                                <td>{{each_play[6]}}</td>
                                <td><a href="/bandinfo/{{each_play[0]}}"><button type="button" class="btn btn-default"
                                data-container="body" data-toggle="popover" data-placement="right"
                                data-html="true">Info
                            </button></a></td>
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
                                <td>{{each_play[4][11:]}}</td>
                                <td>{{each_play[5][11:]}}</td>
                                <td>{{each_play[6]}}</td>
                                <td><a href="/bandinfo/{{each_play[0]}}"><button type="button" class="btn btn-default"
                                data-container="body" data-toggle="popover" data-placement="right"
                                data-html="true">Info
                            </button></a></td>
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
