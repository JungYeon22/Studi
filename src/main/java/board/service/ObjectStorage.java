package board.service;

import org.springframework.web.multipart.MultipartFile;

public interface ObjectStorage {
    public String uploadFile(String bucketName, String s, MultipartFile file);
}
