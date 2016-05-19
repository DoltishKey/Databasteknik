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

        %include('footer.tpl')
    </body>
</html>
