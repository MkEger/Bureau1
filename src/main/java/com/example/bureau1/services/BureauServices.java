package com.example.bureau1.services;
import com.example.bureau1.models.Image;
import com.example.bureau1.models.Things;
import com.example.bureau1.repositories.BureauRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RequiredArgsConstructor
@Service
@Slf4j
public class BureauServices {
    private final BureauRepository bureauRepository;
    public List<Things> listThings(String title) {
        if (title != null) return bureauRepository.findByTitle(title);
        return bureauRepository.findAll();
    }

    public void saveThings(Things things, MultipartFile file1, MultipartFile file2, MultipartFile file3 ) throws IOException {
        Image image1;
        Image image2;
        Image image3;

        if (file1.getSize() != 0){
            image1 = toImageEntity(file1);
            image1.setPreviewImages(true);
            things.addImageToProduct(image1);
        }
        if (file2.getSize() != 0){
            image2 = toImageEntity(file2);
            things.addImageToProduct(image2);
        }
        if (file3.getSize() != 0){
            image3 = toImageEntity(file3);
            things.addImageToProduct(image3);
        }


        log.info("Saving new Things. Title:{}; Sir:{}", things.getTitle(), things.getSir());
        Things thingsFromBd = bureauRepository.save(things);
        thingsFromBd.setPreviewImageId(thingsFromBd.getImages().get(0).getId());
        bureauRepository.save(things);
    }


    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteThing(Long id) {
        bureauRepository.deleteById(id);
    }
    public Things getThingsById(Long id){
        return bureauRepository.findById(id).orElse(null);
    }
}
