package com.example.common;

import com.example.bean.BoardVO;
import com.example.dao.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public BoardVO uploadPhoto (HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");
        //혹시 저장될 경로가 없으면 생성한다.
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        BoardVO one = null;
        MultipartRequest multipartRequest = null;
        try {
            //파일 업로드 처리 과정
            //DefaultFileRenamePolicy - 중복된 이름이 존재할 경우의 처리방법 - 뒤에 숫자추가
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            //"phto"라는 이름으로 전송되어 업로드된 파일 이름을 가져옴
            filename = multipartRequest.getFilesystemName("photo");
            one = new BoardVO();
            String sid = multipartRequest.getParameter("seq");
            if (sid != null && !sid.equals("")) one.setSeq(Integer.parseInt(sid));
            one.setCategory(multipartRequest.getParameter("category"));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setContent(multipartRequest.getParameter("content"));
            one.setViewdate(multipartRequest.getParameter("viewdate"));
        if (sid != null && !sid.equals("")) {
            BoardDAO dao = new BoardDAO();
            String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
            if (filename != null && oldfilename != null)
                FileUpload.deleteFile(request, oldfilename);
            else if (filename == null && oldfilename != null)
                filename = oldfilename;
            }
        one.setPhoto(filename);
        }
        catch (IOException e){
            e.printStackTrace();
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String filename){
        String filepath= request.getServletContext().getRealPath("upload");

        File f = new File(filepath + "/"+filename);
        if(f.exists()) f.delete();
    }
}
