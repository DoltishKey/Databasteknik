<!DOCTYPE html>
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')

        <div class="container">
            <div class="row text-center">
                <h1> Blomstermåla RockFestival</h1>
            </div>
        </div>
        <div class="table-responsive" id="spelschema">
            <div class="col-md-8 col-md-offset-2">
                <!-- For each in (tuple med band sorterat per dag) -->
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
                            <td><a href="/bandinfo/{{each[0]}}"><button type="button" class="btn btn-default"
                            data-container="body" data-toggle="popover" data-placement="right"
                            data-html="true">Info
                        </button></a></td>
                        </tr>
                    %end
                </table>
            </div>
        </div>

        %include('footer.tpl')
    </body>
</html>
