jQuery.getJSON('http://localhost:9000/allSeries')
    .then(function(r) {console.log(r)})

    .then(response => {
        response.foreach(element => {
            $('#table-body').append(`<tr>'
            <th scope="row">${element.id}</th>
            <td>)${element.nombre}</td>
            <td>)${element.temporadas}</td>
            <td>)${element.actores.map(actor => actor.nombre).join(' - ')}</td>
            <td><button onClick="remove
            `
            return
        })
    })














    .catch(error => Promise.reject(error))