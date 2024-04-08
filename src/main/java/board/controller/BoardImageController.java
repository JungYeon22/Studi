package board.controller;

import board.service.ObjectStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "board")
public class BoardImageController {

    @Autowired
    private ObjectStorage objectStorage;
    private String bucketName="bitcamp-6th-bucket-102";

    @PostMapping(value = "/boardImageUpload")
    public String boardImageUpload(@RequestParam("file") MultipartFile file){

        String fileName=objectStorage.uploadFile(bucketName,"storage/",file);
        return fileName;
    }
}
