package com.yuen.domain;

import com.yuen.util.StringUtil;
import com.yuen.util.TimeUtil;
import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "question")
public class Question implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
    private int id;

    @NotEmpty
    @Column(name = "title")
    private String title;

    @Column(name = "slug")
    private String slug;

    @NotEmpty
    @Column(name = "content")
    private String content;
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at")
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;

    @Column(name = "views")
    private int views = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    private User user;
    
    @ManyToOne(fetch = FetchType.LAZY)
    private Category category;
    
    @NotEmpty
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "question_tag", 
             joinColumns = { @JoinColumn(name = "question_id") }, 
             inverseJoinColumns = { @JoinColumn(name = "tag_id") })
    private Set<Tag> tags = new HashSet<>();

    @OneToMany(mappedBy = "question", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @OrderBy("is_best DESC")
    private Set<Answer> answers = new HashSet<>();
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortTitle() {
        return StringUtil.splice(title, 10);
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getShortContent() {
        return StringUtil.splice(StringUtil.escapeHTML(content), 20);
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public String getAgo() throws ParseException {
        return TimeUtil.ago(createdAt);
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Set<Tag> getTags() {
        return tags;
    }

    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }

    public Set<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }
    
    public Answer getBestAnswer() {
        for (Answer answer : answers) {
            if (answer.isBest()) {
                return answer;
            }
        }
        return null;
    }
    
    public boolean isSolved() {
        for (Answer answer : answers) {
            if (answer.isBest()) {
                return true;
            }
        }
        return false;
    }

}
