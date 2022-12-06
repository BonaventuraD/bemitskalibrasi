<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<main class="warnapaletungu">
        <div class="container-fluid py-5 warnabgpost">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12 col-sm-12">
                        <div id="section-title" class="section-title p-1 pt-3">
                        <h2 class="fw-bold warnapaletungu pb-3"><?=$result_category['title']?></h2>
						<p><i class="cificon licon-folder mr-1"></i> <?=$result_category['description']?></p>
                        </div>
						<!--Postingan-->
						<?php foreach ($category_post as $res): ?>
                        <div class="rounded-3 mb-5 backgroundAll">
                            <div class="card-body">
							<h5>
								<a href="<?=post_url($res['post_seotitle']);?>" title="<?=$res['post_title'];?>"><?=$res['post_title'];?></a>
							</h5>
                                <div>
                                <small class="pt-2 pb-2 me-2">

									<!-- meta -->
									<ul class="entry-meta clearfix">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
										<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
										</svg>
										<i class="cificon licon-calendar">Posted at </i> <?=ci_date($res['datepost'].$res['timepost'], 'd F Y | H:i');?>
									</ul>
									<!--/ meta -->
                                    </small>
                                </div>
                                <div class="mb-4">
                                  <div class="card center col-md-10">
								  <img  src="<?=post_images($res['picture'],'medium',TRUE);?>" alt="<?=$res['post_title'];?>" class="card-img">
                                  </div>
                                </div>

                                <!-- post image -->
								<div class="card center col-md-10 mb-4">
								<?php if ( post_images($result_post['picture']) ):?>
								<div class="entry-image">
									<img src="<?=post_images($result_post['picture']);?>" alt="<?=$result_post['image_caption'];?>" class="card-img"/>
									<!-- image description -->
									<?php if ($result_post['image_caption']): ?>
									<p class=" center"><?=$result_post['image_caption'];?></p>
									<?php endif ?>
									<!--/ image description -->
								</div>
								<?php endif ?>
								</div>
								<!-- post image -->


                                <p class="description"><?=cut($res['content'],400);?>...</p>
                                <div class="d-flex text-center pt-2">
                                    <small class="pt-2 pb-2 me-2 ms-auto">
                                    <a type="submit" href="<?=post_url($res['post_seotitle']);?>" class="btn btn-warning">Load more</a>
                                    </small>
                                </div>
                            </div>
                        </div>
						<?php endforeach ?>
					<!-- Postingan -->

                        <nav class="mt-3" aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<?=$page_link;?>
							</ul>
                        </nav>
                    </div>
                    <div class="col-lg-3 col-md-12 col-sm-12">
                        <div>
                        <br>
                        <br>
                        <br>
                        <br>
						<br>
						<br>
							<div class="backgroundAll rounded-3 mb-3">
                                <div class="card-header warnapaletungu fw-bold fs-5">
                                    Findout
                                </div>
                                <div class="overflow-auto" style="max-height: 42vh">
								<!-- form search -->
									<div class="top-search-warper">
										<div class="container py-2 border-0">
											<?=form_open(site_url('search'),'class="search-form"');?>
											<input type="text" name="kata" class="input-search border-0" placeholder="Cari disini..."/>
											<?=form_close();?>
										</div>
									</div>
									<!--/ form search -->
								
                                </div>
                            </div>

                            <div class="backgroundAll rounded-3 mb-3">
                                <div class="card-header warnapaletungu fw-bold fs-5">
                                    Categories
                                </div>
                                <div class="overflow-auto" style="max-height: 42vh">
								<!--Category-->
									<ul class="nav nav-pills flex-column">
										<?php
											$sidebar_category = $this->CI->db
												->select('id_category,COUNT(*)')
												->from('t_post')
												->where('active','Y')
												->group_by('id_category')
												->order_by('COUNT(*)','DESC')
												->get()
												->result_array();
											foreach ($sidebar_category as $rescount):
												$row_scategory = $this->CI->db
													->select('id,title,seotitle')
													->where('id',$rescount['id_category'])
													->where('id >','1')
													->where('active','Y')
													->get('t_category')
													->row_array();

												$num_spost = $this->CI->db
													->select('id')
													->where('id_category',$rescount['id_category'])
													->where('active','Y')
													->get('t_post')
													->num_rows();
												
												if (!$row_scategory || $num_spost == 0) continue;
										?>
										<li class="nav-item">
											<a href="<?=site_url('category/'.$row_scategory['seotitle']);?>" class="nav-link"><?=$row_scategory['title'];?> <small class="pull-right"><?=$num_spost;?></small></a>
										</li>
										<?php endforeach ?>
									</ul>
								<!--Category-->
                                </div>
                            </div>
                            <div class="backgroundAll rounded-3 mb-3">
                                <div class="card-header warnapaletungu fw-bold fs-5">
                                    Most Reads
                                </div>
                                <ul class="list-group list-group-flush mb-2 warnapaletungu">
									<?php 
										$popular_posts = $this->CI->index_model->popular_post('all','5');
										foreach ( $popular_posts as $popular_post):
									?>
                                    <li class="list-group-item">
											<div class="post-lists">
												<div class="media">
													<div class="image-warper">
														<a href="<?=post_url($popular_post['post_seotitle']);?>" title="<?=$popular_post['post_title'];?>">
														</a>
													</div>
													<div class="media-body post-info-2">
														<h5>
															<a href="<?=post_url($popular_post['post_seotitle']);?>" title="<?=$popular_post['post_title'];?>"><?=$popular_post['post_title'];?></a>
														</h5>
													<!-- meta -->
													<ul class="entry-meta clearfix">
														<li><i class="cificon licon-folder"></i> <a href="<?=site_url('category/'.$popular_post['category_seotitle']);?>"><?=$popular_post['category_title'];?></a></li>
														<li><?=ci_timeago($popular_post['post_datepost'].$popular_post['post_timepost']);?></li>
													</ul>
													<!--/ meta -->
													</div>
												</div>
											</div>
										</li>
										<?php endforeach ?>
								</ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 </main>
