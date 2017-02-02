<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<footer id="footer">
  <section class="container">
    <div class="row">
      <div class="col-md-4">
        <div class="widget widget_contact">
          <h3 class="widget_title">Where We Are ?</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu.</p>
          <ul>
            <li>
              <span>Address :</span> PTIT, Hanoi, Vietnam
            </li>
            <li>
              <span>Support :</span>Phone : (+84) 01111011110
            </li>
            <li>Email : askme@gmail.com</li>
          </ul>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget">
          <h3 class="widget_title">Quick Links</h3>
          <ul>
            <li><a href="<c:url value="/" />">Home</a></li>
            <li><a href="<c:url value="/" />">New questions</a></li>
            <li><a href="<c:url value="/" />">Top views questions</a></li>
            <li><a href="<c:url value="/" />">No answers questions</a></li>
            <li><a href="<c:url value="/question/ask" />">Ask question</a></li>
            <li><a href="<c:url value="/login" />">Login</a></li>
            <li><a href="<c:url value="/register" />">Register</a></li>
            <li><a href="#">FAQs</a></li>
          </ul>
        </div>
      </div>
      <div class="col-md-4">
        <div class="widget">
          <h3 class="widget_title">Popular Questions</h3>
          <ul class="related-posts">
            <li class="related-item">
              <h3><a href="#">This is my first Question</a></h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam.</p>
              <div class="clear"></div><span>Feb 22, 2014</span>
            </li>
            <li class="related-item">
              <h3><a href="#">This Is My Second Poll Question</a></h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam.</p>
              <div class="clear"></div><span>Feb 22, 2014</span>
            </li>
          </ul>
        </div>	
      </div>
    </div><!-- End row -->
  </section><!-- End container -->
</footer><!-- End footer -->
<footer id="footer-bottom">
  <section class="container">
    <div class="copyrights f_left">Copyright © 2017 ASK me v3. All rights reserved.</div>
    <div class="social_icons f_right">
      <ul>
        <li class="twitter"><a title="Twitter" href="#"><i class="social_icon-twitter font17"></i></a></li>
        <li class="facebook"><a title="Facebook" href="#"><i class="social_icon-facebook font17"></i></a></li>
        <li class="gplus"><a title="Google plus" href="#"><i class="social_icon-gplus font17"></i></a></li>
        <li class="youtube"><a title="Youtube" href="#"><i class="social_icon-youtube font17"></i></a></li>
        <li class="skype"><a title="Skype" href="skype:#?call"><i class="social_icon-skype font17"></i></a></li>
        <li class="flickr"><a title="Flickr" href="#"><i class="social_icon-flickr font17"></i></a></li>
        <li class="rss"><a title="Rss" href="#"><i class="social_icon-rss font17"></i></a></li>
      </ul>
    </div><!-- End social_icons -->
  </section><!-- End container -->
</footer><!-- End footer-bottom -->