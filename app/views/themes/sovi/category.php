<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<main class="bgkabardaribem">
        <div class="container-fluid py-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12 col-sm-12">
                        <div id="section-title" class="section-title p-1 pt-3 pb-3">
                        <h2 class="fs-1 fw-bold text-black"><?=$result_category['title']?></h2>
						<p><i class="cificon licon-folder mr-1"></i> <?=$result_category['description']?></p>
                        </div>
						<!--Postingan-->
						<?php foreach ($category_post as $res): ?>
                        <div class="rounded-3 mb-5 bgpostkabar shadow">
                            <div class="card-body">
								<div class="row py-4 px-4">
									<!-- post image -->
									<div class="col-lg-5 col-sm-12">
										<div class="mb-4 pt-2">
											<?php if ( post_images($result_post['picture']) ):?>
											<div class="entry-image">
												<img style="height:320px; width: 320px;" class="img-fluid rounded-3 shadow" src="<?=post_images($result_post['picture']);?>" alt="<?=$result_post['image_caption'];?>" class="card-img"/>
												<!-- image description -->
												<?php if ($result_post['image_caption']): ?>
												<p class=" center"><?=$result_post['image_caption'];?></p>
												<?php endif ?>
												<!--/ image description -->
											</div>
										</div>
										<?php endif ?>
										<div class="mb-4">
                                 			<div class="card center col-md-10">
								 				 <img  src="<?=post_images($res['picture'],'medium',TRUE);?>" alt="<?=$res['post_title'];?>" class="card-img">
                                  			</div>
                               			</div>
										</div>
									</div>
									<!-- post image -->
									<div class="col-lg-7 col-sm-12">
											<div class="mb-2">
													<!-- meta -->
													<ul class="entry-meta clearfix">
														<small class="pt-2 me-2">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
																<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
															</svg><i class="cificon licon-calendar">&nbsp Posted at </i> <?=ci_date($res['datepost'].$res['timepost'], 'd F Y | H:i');?>
														</small>
														<br>
														<small class="pt-2 me-2">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
																<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
															</svg> BEM ITS
														</small>
													</ul>
													<!--/ meta -->
											</div>
												<h4 class="text-black card-title fw-bold pb-3">
													<?=$res['post_title'];?>
												</h4>
													<p class="description text-black"><?=cut($res['content'],400);?>...</p>
											<div>
												<a type="submit" href="<?=post_url($res['post_seotitle']);?>" class="text-primary">Lihat Selengkapnya</a>
											</div>
									</div>
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

                    <div class="col-lg-3 col-md-12 col-sm-12 pt-5">
                        <div class="pt-5">
							<div class="pt-5">
								<div class="pt-2">
									<div class="bgpostkabar rounded-3 mb-3">
										<div class="card-header fw-bold fs-5 text-black p-3 pb-0 rounded-3">
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

									<div class="bgpostkabar rounded-3 mb-3">
										<div class="card-header fw-bold fs-5 text-black p-3 pb-0 rounded-3">
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
									<div class="bgpostkabar rounded-3 mb-3">
										<div class="card-header fw-bold fs-5 text-black p-3 pb-0 rounded-3">
											Most Reads
										</div>
										<ul class="list-group list-group-flush mt-2 warnapaletungu">
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
            </div>
        </div>
 </main>
