package hcmute.services;

import java.io.File;
import java.util.List;

import hcmute.dao.CategoryDao;
import hcmute.dao.CategoryDaoImpl;
import hcmute.models.Category;
import hcmute.utils.Constant;

public class CategoryServiceImpl implements CategoryService {
    CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public void insert(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public void edit(Category newCategory) {
        Category oldCategory = categoryDao.get(newCategory.getId());
        oldCategory.setName(newCategory.getName());
        
        if (newCategory.getIcon() != null) {
            // Xóa ảnh cũ đi để đỡ nặng máy
            String fileName = oldCategory.getIcon();
            File file = new File(Constant.DIR + "/" + fileName);
            if (file.exists()) {
                file.delete();
            }
            oldCategory.setIcon(newCategory.getIcon());
        }
        categoryDao.edit(oldCategory);
    }

    @Override
    public void delete(int id) {
        categoryDao.delete(id);
    }

    @Override
    public Category get(int id) {
        return categoryDao.get(id);
    }

    @Override
    public Category get(String name) {
        return categoryDao.get(name);
    }

    @Override
    public List<Category> getAll() {
        return categoryDao.getAll();
    }

    @Override
    public List<Category> search(String keyword) {
        return categoryDao.search(keyword);
    }
}