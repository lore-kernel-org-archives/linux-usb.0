Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438955;
	b=LMBNZFO9g6XuyIvw9Dt830DsVc9iFdaNkDBPhT4zRzg8EIn3h69yH8QEgtmxDDijfoL3
	 F89H2OoZNY+Zc9QWuuxlEKG8SLmlZ7kLMCIUjMlhh0BcZ27fwxTUX3N02Jv90ZwkuzhBt
	 yEddYoi2v7udB0uQhWWYImdUhFduU0EW4fT+BRspqYE7u2e15V7gdJvUViFWqwy2WSxze
	 RIqZV9S1T4FGGxDK46qaTuBFflVmj5r+3pNEaC26ygkX0PDRzP9D8ck4/Z8rKratKJkWH
	 C9mWA5QpvyjY5LIUHKRZ2xWkytAh7d9SoVIg6eknEqITCJatesSmH5Cxp61GE7jVSWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438955;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 DKIM-Signature;
	bh=3HYwWDF/VqUcDJRjXZfOKOtKJbiGPwfo7ligLpJcmFI=;
	b=fzhBDgWDdQhE4SLBRe0MZL5Yp1cfNS9KYq+HIeXx6r8qwZWl+wDmyoS4+QF01Ajw6+39
	 PL6DWTYXztcX8lmxmUI0tQnDXxiZegEgwwnJIDI2Gpo2aODMWKbY0VwgWSSmTf0ahnuI5
	 NERhg9ShPFVgcoD1/qvEeNQ/mcSSrgi7IuGvxfN2yTgZTPt6PliDXQgnSjLnVxvzpu3/S
	 L+YK1z0+eUGf0AyEFcxMzGno3lh89HYa3GUZeSgsb09yVgwQ+1fCdhOTF+uECNwgyhCRe
	 /LDkLcRXVdTjVOj64bYzQTImwqwbLCwc0L2Yxwidr9UGJJ5L/NqI84UGz7ZL2vfKhrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=UgRGNNRM;
	arc=none smtp.remote-ip=217.74.67.75
Received: from smtpo75.interia.pl (smtpo75.interia.pl [217.74.67.75])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC04606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 13:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC04606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=UgRGNNRM
Received: from nr200 (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Mon, 23 Nov 2026 14:02:28 +0100 (CET)
Date: Mon, 23 Nov 2026 14:02:26 +0100
From: Slawomir Stepien <sst@poczta.fm>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jiashengjiangcool@gmail.com, yun.zhou@windriver.com,
	zzzccc427@gmail.com, bigeasy@linutronix.de, nab@linux-iscsi.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/3] usb: gadget: f_tcm: take the TPG in tcm_bind()
 instead of tcm_alloc()
Message-ID: <awQ5Yn9kCtWRoxVM@nr200>
References: <20261022134926.1125473-1-sst@poczta.fm>
 <2026112034-paralegal-democracy-b509@gregkh>
 <awQIkANAqLndeXxy@nr200>
 <2026112324-trailside-hanky-1986@gregkh>
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
In-Reply-To: <2026112324-trailside-hanky-1986@gregkh>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1795438950; bh=3HYwWDF/VqUcDJRjXZfOKOtKJbiGPwfo7ligLpJcmFI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=UgRGNNRM+yVMRxEHDN1SEGum4x41TI7vEy34RTae+bdxwvMPDSRRlMiwILGLFDbUd
	 n54ewmG5TeIBJCHD9Xmsr+i5ZjhZ7Scm0gRRxd5S3MF0jynbmQeafioxl3r7HcFBFO
	 V5xwIAlnAiYIbI8puOcw19oAGjJwSgEWYrLrsb2E=

On lis 23, 2026 13:18, Greg KH wrote:
> On Mon, Nov 23, 2026 at 10:34:08AM +0100, Slawomir Stepien wrote:
> > On lis 20, 2026 11:58, Greg KH wrote:
> > > On Thu, Oct 22, 2026 at 03:49:24PM +0200, Slawomir Stepien wrote:
> > > > tcm_alloc() runs when a TCM function is symlinked into a gadget
> > > > configuration. It searches tpg_instances[] for the function instance
> > > > and copies the TPG pointer into fu->tpg at that point, under
> > > > tpg_instances_lock. This has two problems.
> > > > 
> > > > The function and the TPG can be set up in either order. If the
> > > > function is linked into a configuration before the TPG directory is
> > > > created, tpg_instances[i].tpg is still NULL and fu->tpg stays NULL.
> > > > Creating and enabling the TPG afterwards sets can_attach, so
> > > > tcm_bind() succeeds, and the first USB request that reaches the
> > > > target code dereferences the NULL fu->tpg.
> > > > 
> > > > Removing a TPG also leaves can_attach set for configfs instances, so a
> > > > later bind is not refused even though the TPG it would use is gone.
> > > > 
> > > > Store the TPG in struct f_tcm_opts instead: set it in usbg_make_tpg()
> > > > and clear it in usbg_drop_tpg(), under opts->dep_lock. In tcm_bind(),
> > > > refuse to bind unless both can_attach and opts->tpg are set, and copy
> > > > opts->tpg into fu->tpg there. Also clear can_attach in usbg_drop_tpg()
> > > > for configfs instances. The legacy g_target driver sets can_attach once
> > > > at module load, and its attach callback does not set it again, so
> > > > leave it alone in that case or g_target could never bind again after a
> > > > TPG is recreated.
> > > > 
> > > > With fu->tpg no longer set in tcm_alloc(), the tpg_instances[] lookup
> > > > there serves no purpose: f->fi already identifies the instance for the
> > > > item's whole lifetime. Drop it, and with it the tpg_instances_lock
> > > > acquisition. config_usb_cfg_link() calls tcm_alloc() with gi->lock
> > > > held, so this also removes the gi->lock -> tpg_instances_lock edge
> > > > from the following lockdep report:
> > > > 
> > > >   WARNING: possible circular locking dependency detected
> > > >   task is trying to acquire lock:
> > > >    (tpg_instances_lock){+.+.}-{4:4}, at: tcm_alloc
> > > >   but task is already holding lock:
> > > >    (&gi->lock){+.+.}-{4:4}, at: config_usb_cfg_link
> > > > 
> > > >   the existing dependency chain (in reverse order) is:
> > > >   -> #2 (&gi->lock):
> > > >          config_usb_cfg_link
> > > >          configfs_symlink
> > > >   -> #1 (&sb->s_type->i_mutex_key#24):
> > > >          configfs_depend_item_unlocked
> > > >          usbg_make_tpg
> > > >          target_fabric_make_tpg
> > > >          configfs_mkdir
> > > >   -> #0 (tpg_instances_lock):
> > > >          tcm_alloc
> > > >          usb_get_function
> > > >          config_usb_cfg_link
> > > >          configfs_symlink
> > > > 
> > > > Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
> > > > Reported-by: syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com
> > > > Closes: https://syzkaller.appspot.com/bug?extid=2799146a53c356f8017d
> > > > Link: https://syzkaller.appspot.com/ai_job?id=51e1f189-6d91-4321-a6ba-07d4eb3cd8cd
> > > > Assisted-by: Gemini:gemini-4-argon Gemini:gemini-3.8-flash syzbot
> > > > Signed-off-by: Slawomir Stepien <sst@poczta.fm>
> > > > ---
> > > >  drivers/usb/gadget/function/f_tcm.c | 29 +++++++++++------------------
> > > >  drivers/usb/gadget/function/u_tcm.h |  4 ++++
> > > >  2 files changed, 15 insertions(+), 18 deletions(-)
> > > > 
> > > > diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
> > > > index 9e6d4f39900a..cc75d7e9792a 100644
> > > > --- a/drivers/usb/gadget/function/f_tcm.c
> > > > +++ b/drivers/usb/gadget/function/f_tcm.c
> > > > @@ -1720,6 +1720,9 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
> > > >  
> > > >  	tpg_instances[i].tpg = tpg;
> > > >  	tpg->fi = tpg_instances[i].func_inst;
> > > > +	mutex_lock(&opts->dep_lock);
> > > > +	opts->tpg = tpg;
> > > > +	mutex_unlock(&opts->dep_lock);
> > > 
> > > Why is a lock needed to write one value?
> > 
> > Yeah it is not needed. I will drop it in v2 - can_attach (tcm_bind()) and tpg_instances_lock
> > (usbg_drop_tpg()) protect it.
> > I guess AI added it since in all the other places it is used.
> > 
> > > >  	mutex_unlock(&tpg_instances_lock);
> > > >  	return &tpg->se_tpg;
> > > >  
> > > > @@ -1760,11 +1763,14 @@ static void usbg_drop_tpg(struct se_portal_group *se_tpg)
> > > >  		opts = container_of(tpg_instances[i].func_inst,
> > > >  			struct f_tcm_opts, func_inst);
> > > >  		mutex_lock(&opts->dep_lock);
> > > > -		if (opts->has_dep)
> > > > +		opts->tpg = NULL;
> > > > +		if (opts->has_dep) {
> > > >  			module_put(opts->dependent);
> > > 
> > > The whole module_put() logic should probably just be removed, right?
> > 
> > I'm not sure what you mean here. This series does not touch the legacy path.
> > Are you suggesting that we do not have legacy users and this whole legacy stuff can go?
> 
> I would love to drop the legacy stuff, my point was that anyone doing
> manual calls to module_get/put() is usually wrong.

I can take a look at it, but in a separate series if that's OK with you.

-- 
Slawomir Stepien
