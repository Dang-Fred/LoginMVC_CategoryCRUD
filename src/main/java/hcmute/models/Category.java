package hcmute.models;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Category")
@NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c")
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cate_id")
    private int id;

    @Column(name = "cate_name", columnDefinition = "nvarchar(255) not null")
    private String name;

    @Column(name = "icons", columnDefinition = "nvarchar(255) null")
    private String icon;

    
    @Column(name = "status")
    private Integer status;

    // Quan hệ 1-Nhiều: 1 Category có nhiều Video
    // mappedBy = "category" phải khớp với tên biến category bên class Video
    @OneToMany(mappedBy = "category", cascade = CascadeType.REMOVE)
    private List<Video> videos = new ArrayList<>();
    
    @OneToMany(mappedBy = "category", cascade = CascadeType.REMOVE)
    private List<Product> products = new ArrayList<>();
    // Nhớ tạo Getter/Setter cho List<Product> này

    public Category() {}

    // --- GETTER / SETTER CŨ ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getIcon() { return icon; }
    public void setIcon(String icon) { this.icon = icon; }

    // --- GETTER / SETTER MỚI ---
    public Integer getStatus() { return status; }
    public void setStatus(Integer status) { this.status = status; }
    
    public List<Video> getVideos() { return videos; }
    public void setVideos(List<Video> videos) { this.videos = videos; }
    
    

    public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}

	// Hàm tiện ích thêm/xóa Video của thầy
    public Video addVideo(Video video) {
        getVideos().add(video);
        video.setCategory(this);
        return video;
    }
    public Video removeVideo(Video video) {
        getVideos().remove(video);
        video.setCategory(null);
        return video;
    }
}