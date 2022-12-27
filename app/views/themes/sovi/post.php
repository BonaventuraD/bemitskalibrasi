<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<main class="bgkabardaribem">
    <div class="container-fluid py-5">
        <div class="container">
                <div class="row">
                    <div class="col-md-8 mobile-space">
                        <div class="rounded-3 mb-5 bgpostkabar">
                            <div class="card-body">
                                <h1 class="card-title mb-2 fw-bold"><?=$result_post['post_title'];?></h1>
								<small class="pt-2 pb-2 me-2">
									<!-- meta -->
									<ul class="entry-meta clearfix">
										<li>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
										<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
										</svg>
										<i class="cificon licon-calendar"></i> <?=ci_date($result_post['datepost'], 'l, d F Y');?> &nbsp; <i class="cificon licon-clock"></i> <?=ci_date($result_post['timepost'], 'h:i A');?>
										<a href="<?=site_url('category/'.$result_post['category_seotitle']);?>"><i class="cificon licon-folder"></i> <?=$result_post['category_title'];?></a>
										<li>
										dilihat <i class="cificon licon-eye"></i> <?=$result_post['hits'];?> kali
										</li>
									</ul>
									<!--/ meta -->
                                    </small>
                                <!-- post image -->
								<div class="center col-md-10 mb-4">
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
								<!-- post content -->
								<div class="entry-content detail-content mt-3 clearfix">
									<?=$result_post['content'];?>
								</div>
								<!-- post content -->
								<!-- content paging -->
								<?php if ($content_paging): ?>
								<div class="post-footer">
									<div class="content-pagination clearfix">
										<!-- <div class="cp-text pull-left">Page</div> -->
										<ul class="pagination justify-content-center">
											<?=$content_paging;?>
										</ul>
									</div>
								</div>
								<?php endif ?>
								<!--/ content paging -->

									<!-- related posts -->
								<div class="post-head">
									<h4>Related Posts</h4>
								</div>
								<div class="post-inner clearfix mb-2">
									<div class="related-posts clearfix">
										<ul>
										<?php
											$related_posts = $this->CI->post_model->related_post($result_post['tag'], $result_post['post_id'], 4);
											foreach ($related_posts as $res_relatedpost):
										?>
											<li><a href="<?=post_url($res_relatedpost['seotitle']);?>" title="<?=$res_relatedpost['title'];?>"><?=$res_relatedpost['title'];?></a></li>
										<?php endforeach ?>
										</ul>
									</div>
								</div>
								<!--/ related posts -->
								
                                	<!-- Posts navigation -->
									<div class="post-inner clearfix mb-2">
										<div class="post-np">
											<div class="row">
												<div class="col-sm-6 text-left">
													<a href="<?=$prev_post['url']?>" title="Previous Post" class="btn btn-light">&lArr; Previous</a>
													<div class="post-np-title"><small><a href="<?=$prev_post['url']?>" title="<?=$prev_post['title']?>" class="text-dark"><?=cut($prev_post['title'],100)?>...</a></small></div>
												</div>
												<div class="col-sm-6 text-right">
													<a href="<?=$next_post['url']?>" title="Next Post" class="btn btn-light">Next &rArr;</a>
													<div class="post-np-title"><small><a href="<?=$next_post['url']?>" title="<?=$next_post['title']?>" class="text-dark"><?=cut($next_post['title'],100)?>...</a></small></div>
												</div>
											</div>
										</div>
									</div>
									<!--/ Posts navigation -->
                                <!-- rencana diisi sharer content ke social media -->
                            </div>
                        </div>
                        <div class="rounded-3 mb-5 bgpostkabar">
                            <div class="card-body">
							<?php if ( get_setting('post_comment')=='Y' && $result_post['post_comment']=='Y' ): ?>
							<!-- comments list -->
							<div id="comments" class="post-head">
								<h4>Comments (<?=$result_post['comment'];?>)</h4>
							</div>
							<div class="post-inner clearfix mb-2">
								<div class="entry-comment clearfix">
									<div class="list-comment clearfix ">
										<?php
											$data_comments = $this->CI->db
												->where('id_post', $result_post['post_id'])
												->where('active != "N"')
												->where('parent = "0"', NULL, FALSE)
												->get('t_comment');

											foreach ($data_comments->result_array() as $comment):
												$usersa = $this->CI->db
													->select('id,photo')
													->where('id', $comment['id_user'])
													->get('t_user')
													->row_array();
										?>
										<div class="media mt-2">
											<div class="media-body">
												<h5 class="comment-name mt-0">
													<?=$comment['name'];?> 
													<small class="text-muted ml-3"><?=ci_date($comment['date'],'d M Y | h:i A');?></small>
												</h5>
												<div class="comment-body mb-5">
													<?php 
														if ($comment['active'] == 'X') {
															echo '<i class="text-danger">****</i>';
														} else {
															echo '<p>'.auto_link($comment['comment']).'</p>';
																echo '<a href="#form-comment" class="reply_comment" data-parent="'.encrypt($comment['id']).'">Reply</a>';
														}
													?>
												</div>
												

												<!-- child -->
												<?php
													if ($comment['active'] != 'X'):
														
														$child_comments = $this->CI->db
															->where('parent', $comment['id'])
															->where('active != "N"')
															->get('t_comment');

														foreach ($child_comments->result_array() as $res_child):
															$users_rep = $this->CI->db
																->select('id,photo')
																->where('id', $res_child['id_user'])
																->where('active', 'Y')
																->get('t_user')
																->row_array();
												?>
												
												<div class="media mt-4 mb-5">
													<img src="<?=user_photo($users_rep['photo']);?>" class="mr-3" width="45">
													<div class="media-body">
														<h5 class="comment-name mt-0">
															<?=$res_child['name'];?> 
															<small class="text-muted ml-3"><?=ci_date($res_child['date'],'d M Y | h:i A');?></small>
														</h5>
														<div class="comment-body">
															<?php 
																if ($res_child['active'] == 'X') {
																	echo '<i class="text-danger">****</i>';
																} else {
																	echo '<p>'.auto_link($res_child['comment']).'</p>';
																	echo '<a href="#form-comment" class="reply_comment" data-parent="'.encrypt($comment['id']).'">Reply</a>';
																}
															?>
														</div>
													</div>
												</div>
												<?php endforeach ?>
												<?php endif ?>
												<!--/ child -->
											</div>
										</div>
										<?php endforeach ?>
									</div>
								</div>
							</div>
							<!--/ comments list -->

							<!-- form comment -->
							<div id="form-comment" class="post-head">
								<h4>Leave a Comment</h4>
							</div>
							<div class="post-inner">
								<div class="form-comment">
									<?php
										$this->cifire_alert->show('alert_comment');
										echo form_open(selft_url().'#form-comment','class="clearfix"');
									?>
									<input type="hidden" name="parent" class="input_parent"/>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="name">Name <span class="text-danger">*</span></label>
												<input id="name" type="text" name="name" class="form-control"/>
											</div>
											<div class="form-group">
												<label for="email">Email <span class="text-danger">*</span></label>
												<input id="email" type="email" name="email" class="form-control"/>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="comment">Comment <span class="text-danger">*</span></label>
										<textarea name="comment" rows="3" class="form-control"></textarea>
									</div>
										
									<div class=" text-right">
										<?php if (get_setting('recaptcha')=="Y"): ?>
										<div class="g-recaptcha pull-left" data-sitekey="<?=get_setting('recaptcha_site_key')?>" style="margin-bottom:9px;"></div>
										<?php endif ?>
										<button type="submit" tabindex="5" class="btn btn-primary btn-send pull-tight"><i class="cificon licon-send mr-1"></i><?=lang_line('button_send')?></button>
									</div>

									<?=form_close();?>
								</div>
							</div>
							<!--/ form comment -->
							<?php endif ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-12 col-sm-12">
                        <div>
                            <div class="bgpostkabar rounded-3 mb-3">
                                <div class="card-header text-black fw-bold fs-5">
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
                                <div class="card-header text-black fw-bold fs-5">
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
        </main>