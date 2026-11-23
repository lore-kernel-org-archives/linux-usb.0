Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436282;
	b=HmUXfQGk1Sr3ER8yE7iWa5oh3iYjNxi3TqizSl4O8cA/gQBv+xruK0VOulGbJIFgwXRB
	 urugcy8wh2ewB4gZspHuwfXkJO7iBTGkQwYnAQFc17nzCDMtgof1tn6IJ/w81yiJ+YBAK
	 Hwi1uG8h9WhzCg0gYjyDwPggMgtXD10Xry/ZETNULa9jKFKPvOaEyOYW+GlySqj/zkcP7
	 GrPTIArnJUyYTjczgT7MnmiffyIewgk7m1idiYXbpcCjjf1XF7rsDAKQ5f3OYWmnM91c7
	 jxYn9XN/svFkJI3QddMm1MLtBWVPXvAnfthsjt1Vgcb3fm9ugByy6iCeHgk31syJZ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436282;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oTqyWu0O0Lf/aRaTeVcX0CglBR6VWa7YWvtkVDqk8G0=;
	b=YdeyB78swoT0C2czzdeiaZMGDDLAG4WpgfrVudaTYGQixkha0liOcVlpJCr4/jYtLTwV
	 uDOAqWe8anifKbREq5wJOpaouFF/Zimlaf5+XhUI3ePpK7/eT+O6qPir9Kq9Lh1QCsISv
	 k5DyBN4yFxFbIfC6DNvwxCsvkvY0M74rkEzPU3orE+BwEq0M2WvxM5DeQIey6/rpoWZye
	 0ASK8PqfVbYxsQpLAaDt+RvIVT+fn6EyLdZCwDcN/6R9LSJuN/uclKaMXkVlL9WvoQdMH
	 4+VPXpxdRdisqWE/EF5QEXWu/K7KOeK8qLemnhbZcwnw88zh7BGjEMsesVRljeUSyMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FchDuhne;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4307606A32A;
	Mon, 23 Nov 2026 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FchDuhne
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1468E1F000CA;
	Mon, 23 Nov 2026 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795436281;
	bh=oTqyWu0O0Lf/aRaTeVcX0CglBR6VWa7YWvtkVDqk8G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FchDuhnexKGT8hJreDpf1tuRDARUWtUNerNsMnREO/RjBjf5rci3XCjbrWah/fORB
	 MscwCaQcS9GyMtJWLL+tuwVRcmBfYqyPrpNIw3VOd50qib+egR0uq7RmnKuFgzfwvu
	 dz7a/66lVyxnzcfxGIBFbulvkkEsZS59hJhylU5Y=
Date: Mon, 23 Nov 2026 13:18:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Slawomir Stepien <sst@poczta.fm>
Cc: andrzej.p@samsung.com, jiashengjiangcool@gmail.com,
	yun.zhou@windriver.com, zzzccc427@gmail.com, bigeasy@linutronix.de,
	nab@linux-iscsi.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/3] usb: gadget: f_tcm: take the TPG in tcm_bind()
 instead of tcm_alloc()
Message-ID: <2026112324-trailside-hanky-1986@gregkh>
References: <20261022134926.1125473-1-sst@poczta.fm>
 <2026112034-paralegal-democracy-b509@gregkh>
 <awQIkANAqLndeXxy@nr200>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awQIkANAqLndeXxy@nr200>

On Mon, Nov 23, 2026 at 10:34:08AM +0100, Slawomir Stepien wrote:
> On lis 20, 2026 11:58, Greg KH wrote:
> > On Thu, Oct 22, 2026 at 03:49:24PM +0200, Slawomir Stepien wrote:
> > > tcm_alloc() runs when a TCM function is symlinked into a gadget
> > > configuration. It searches tpg_instances[] for the function instance
> > > and copies the TPG pointer into fu->tpg at that point, under
> > > tpg_instances_lock. This has two problems.
> > > 
> > > The function and the TPG can be set up in either order. If the
> > > function is linked into a configuration before the TPG directory is
> > > created, tpg_instances[i].tpg is still NULL and fu->tpg stays NULL.
> > > Creating and enabling the TPG afterwards sets can_attach, so
> > > tcm_bind() succeeds, and the first USB request that reaches the
> > > target code dereferences the NULL fu->tpg.
> > > 
> > > Removing a TPG also leaves can_attach set for configfs instances, so a
> > > later bind is not refused even though the TPG it would use is gone.
> > > 
> > > Store the TPG in struct f_tcm_opts instead: set it in usbg_make_tpg()
> > > and clear it in usbg_drop_tpg(), under opts->dep_lock. In tcm_bind(),
> > > refuse to bind unless both can_attach and opts->tpg are set, and copy
> > > opts->tpg into fu->tpg there. Also clear can_attach in usbg_drop_tpg()
> > > for configfs instances. The legacy g_target driver sets can_attach once
> > > at module load, and its attach callback does not set it again, so
> > > leave it alone in that case or g_target could never bind again after a
> > > TPG is recreated.
> > > 
> > > With fu->tpg no longer set in tcm_alloc(), the tpg_instances[] lookup
> > > there serves no purpose: f->fi already identifies the instance for the
> > > item's whole lifetime. Drop it, and with it the tpg_instances_lock
> > > acquisition. config_usb_cfg_link() calls tcm_alloc() with gi->lock
> > > held, so this also removes the gi->lock -> tpg_instances_lock edge
> > > from the following lockdep report:
> > > 
> > >   WARNING: possible circular locking dependency detected
> > >   task is trying to acquire lock:
> > >    (tpg_instances_lock){+.+.}-{4:4}, at: tcm_alloc
> > >   but task is already holding lock:
> > >    (&gi->lock){+.+.}-{4:4}, at: config_usb_cfg_link
> > > 
> > >   the existing dependency chain (in reverse order) is:
> > >   -> #2 (&gi->lock):
> > >          config_usb_cfg_link
> > >          configfs_symlink
> > >   -> #1 (&sb->s_type->i_mutex_key#24):
> > >          configfs_depend_item_unlocked
> > >          usbg_make_tpg
> > >          target_fabric_make_tpg
> > >          configfs_mkdir
> > >   -> #0 (tpg_instances_lock):
> > >          tcm_alloc
> > >          usb_get_function
> > >          config_usb_cfg_link
> > >          configfs_symlink
> > > 
> > > Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
> > > Reported-by: syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=2799146a53c356f8017d
> > > Link: https://syzkaller.appspot.com/ai_job?id=51e1f189-6d91-4321-a6ba-07d4eb3cd8cd
> > > Assisted-by: Gemini:gemini-4-argon Gemini:gemini-3.8-flash syzbot
> > > Signed-off-by: Slawomir Stepien <sst@poczta.fm>
> > > ---
> > >  drivers/usb/gadget/function/f_tcm.c | 29 +++++++++++------------------
> > >  drivers/usb/gadget/function/u_tcm.h |  4 ++++
> > >  2 files changed, 15 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
> > > index 9e6d4f39900a..cc75d7e9792a 100644
> > > --- a/drivers/usb/gadget/function/f_tcm.c
> > > +++ b/drivers/usb/gadget/function/f_tcm.c
> > > @@ -1720,6 +1720,9 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
> > >  
> > >  	tpg_instances[i].tpg = tpg;
> > >  	tpg->fi = tpg_instances[i].func_inst;
> > > +	mutex_lock(&opts->dep_lock);
> > > +	opts->tpg = tpg;
> > > +	mutex_unlock(&opts->dep_lock);
> > 
> > Why is a lock needed to write one value?
> 
> Yeah it is not needed. I will drop it in v2 - can_attach (tcm_bind()) and tpg_instances_lock
> (usbg_drop_tpg()) protect it.
> I guess AI added it since in all the other places it is used.
> 
> > >  	mutex_unlock(&tpg_instances_lock);
> > >  	return &tpg->se_tpg;
> > >  
> > > @@ -1760,11 +1763,14 @@ static void usbg_drop_tpg(struct se_portal_group *se_tpg)
> > >  		opts = container_of(tpg_instances[i].func_inst,
> > >  			struct f_tcm_opts, func_inst);
> > >  		mutex_lock(&opts->dep_lock);
> > > -		if (opts->has_dep)
> > > +		opts->tpg = NULL;
> > > +		if (opts->has_dep) {
> > >  			module_put(opts->dependent);
> > 
> > The whole module_put() logic should probably just be removed, right?
> 
> I'm not sure what you mean here. This series does not touch the legacy path.
> Are you suggesting that we do not have legacy users and this whole legacy stuff can go?

I would love to drop the legacy stuff, my point was that anyone doing
manual calls to module_get/put() is usually wrong.

thanks,

greg k-h
