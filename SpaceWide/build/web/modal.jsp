

<head><link rel="stylesheet" href="https://jqueryvalidation.org/files/demo/site-demos.css"></head>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-light">
                <h1 class="modal-title fs-5 " id="exampleModalLabel">Enviar email promocional:</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="javamail.jsp" method="post">
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Remetente:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Assunto:</label>
                        <input type="text" name="assunto" class="form-control" id="recipient-name">
                    </div>
                    <div class="mb-3">
                        <label for="message-text" class="col-form-label">Messagem:</label>
                        <textarea name="comenta" class="form-control" id="message-text"></textarea>
                    </div>
                    <button type="submit" name="Submit" class="btn btn-primary" >Enviar</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Descartar</button>
                
            </div>
        </div>
    </div>
</div>