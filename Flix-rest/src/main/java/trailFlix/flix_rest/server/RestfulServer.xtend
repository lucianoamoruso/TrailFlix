package trailFlix.flix_rest.server

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import trailFlix.flix.model.TrailFlix

@Controller
class RestfulServer {
	TrailFlix trailFlix
	
	extension JSONUtils = new JSONUtils
	
	new (TrailFlix trailFlix) {
		this.trailFlix = trailFlix
	}
}
