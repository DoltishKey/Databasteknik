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
        <div class="table-responsive" id="bandinfo">
            <div class="col-md-8 col-md-offset-2">
                <!-- For each in (tuple med band sorterat per dag) -->

                <h1>{{bandinfo[0][0]}}</h1>
                <h3> Ursprungsland: {{bandinfo[0][2]}}</h3>
                <h4> Musikstil: {{bandinfo[0][1]}}</h4>
                <h2> Medlemmar </h2>
                %for every in artister:
                <div class="row col-xs-3" id="band_info">
                    <h3>{{every[1]}}</h3>
                    <p> Lite kul information: {{every[4]}}</p>
                </div>
                %end
                </table>
            </div>
        </div>

        %include('footer.tpl')
    </body>
</html>
