package com.conygre.training.spring.boot;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("breakit")
@CrossOrigin
public class BreakItController  {


	// Totally kill the server!!!
	@RequestMapping(method = RequestMethod.GET, value="/kill")
	public void theEnd() {
		System.exit(0);
	}

	

	@RequestMapping(value="/cpu", method=RequestMethod.GET)
	public void increaseCPU() {
		 int count = Runtime.getRuntime().availableProcessors();
         for (int i = 0; i < count; i++) {
            new Thread(new Runnable() {
                public void run() {
                    while (true);
                }
            }).start();
         }
	}
}