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
                            <td>{{each[0]}}</td>
                            <td>{{each[3]}}</td>
                            <td>{{each[4]}}</td>
                            <td>{{each[5]}}</td>
                        </tr>
                    %end
                </table>
            </div>
        </div>

        %include('footer.tpl')
    </body>
</html>
