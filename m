Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172296;
	b=C1Pb6yvAWXaeAKT0AsjvDlP/8KzXPYl3iguQg0ffdSC4RJ4QlJrW8HyysIQeV7Nftmh2
	 ygzGx2DZ9i3E+P/VGdXxnQ3STV01Pq74QLTxgUr6CmdU9rAb9/4DuWy88ID9mxFpoqAwq
	 d132YRPUzOcMaSSk7XxEiugtc/IdGZyvyy9dTqWodWKedSS2+zfQiSO1Znzcr6avphXDr
	 hw0JUQwkhjTRtoWV88epPLgCkuLPsdyHETb7DZ1yflQJgSkIrHBNDwuQAvkHlNVgPsUtC
	 EofkizrK5OqZCgk4CRFdL24jck5fEGBZJO0y3+AlX/UbSsPlCkvr/4nxVnDbT1oLLoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172296;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EW6Q9jmIhQh9U/3ByIZXptV8tV4/B3yP9ni/4lNN4ho=;
	b=Qg28RSieX2C8YqVWX5Qqn3BSDq+I12nb6FEoUjoCp8Y+qgxl8ssoZwa1bCNg/uwRhJal
	 aekxm/rkWgXdx7Hks6v4wK4H03dcBR26HKSCReaJiRSfaeN0+VDS5yN14FdXiamP60oLY
	 mvpQy1+N1O/CatGl2G6uVVf7by4S/AnYJbcdO+0cAqOOhbjQJ3wctKABeS9TAezEWdRTw
	 o2dVGz+1I+ZHvn9X+35JgmnY0ydR3u90zEHsO3J4nzfy6kSrWBiL6XwTZQSt9s5Pe9uS0
	 2qSR0UFB7UKBWfId3demgiUwm8H55K2t5CLqakTmq5cOyB+FnUdZB5COuq9vqg9Bf+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gUNJtQtS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E928606A325;
	Fri, 20 Nov 2026 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gUNJtQtS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D9A1F000C6;
	Fri, 20 Nov 2026 10:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795172296;
	bh=EW6Q9jmIhQh9U/3ByIZXptV8tV4/B3yP9ni/4lNN4ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gUNJtQtSHmecT3cbkPHjfDMIOqke1kr8wcj8qViGVOgRM25It6xUPOlm0Omkoun+O
	 8Vj+LYsf+Riz3AIf7vF97VLervezzIX6APqbX2QCXNibwgJ2iSLhh9HhUfZGH4yhMX
	 ADPJfBtcWAZvZxD7oRctR+1DmBsfXgzvwNvxndKA=
Date: Fri, 20 Nov 2026 11:58:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Slawomir Stepien <sst@poczta.fm>
Cc: andrzej.p@samsung.com, jiashengjiangcool@gmail.com,
	yun.zhou@windriver.com, zzzccc427@gmail.com, bigeasy@linutronix.de,
	nab@linux-iscsi.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/3] usb: gadget: f_tcm: take the TPG in tcm_bind()
 instead of tcm_alloc()
Message-ID: <2026112034-paralegal-democracy-b509@gregkh>
References: <20261022134926.1125473-1-sst@poczta.fm>
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
In-Reply-To: <20261022134926.1125473-1-sst@poczta.fm>

On Thu, Oct 22, 2026 at 03:49:24PM +0200, Slawomir Stepien wrote:
> tcm_alloc() runs when a TCM function is symlinked into a gadget
> configuration. It searches tpg_instances[] for the function instance
> and copies the TPG pointer into fu->tpg at that point, under
> tpg_instances_lock. This has two problems.
> 
> The function and the TPG can be set up in either order. If the
> function is linked into a configuration before the TPG directory is
> created, tpg_instances[i].tpg is still NULL and fu->tpg stays NULL.
> Creating and enabling the TPG afterwards sets can_attach, so
> tcm_bind() succeeds, and the first USB request that reaches the
> target code dereferences the NULL fu->tpg.
> 
> Removing a TPG also leaves can_attach set for configfs instances, so a
> later bind is not refused even though the TPG it would use is gone.
> 
> Store the TPG in struct f_tcm_opts instead: set it in usbg_make_tpg()
> and clear it in usbg_drop_tpg(), under opts->dep_lock. In tcm_bind(),
> refuse to bind unless both can_attach and opts->tpg are set, and copy
> opts->tpg into fu->tpg there. Also clear can_attach in usbg_drop_tpg()
> for configfs instances. The legacy g_target driver sets can_attach once
> at module load, and its attach callback does not set it again, so
> leave it alone in that case or g_target could never bind again after a
> TPG is recreated.
> 
> With fu->tpg no longer set in tcm_alloc(), the tpg_instances[] lookup
> there serves no purpose: f->fi already identifies the instance for the
> item's whole lifetime. Drop it, and with it the tpg_instances_lock
> acquisition. config_usb_cfg_link() calls tcm_alloc() with gi->lock
> held, so this also removes the gi->lock -> tpg_instances_lock edge
> from the following lockdep report:
> 
>   WARNING: possible circular locking dependency detected
>   task is trying to acquire lock:
>    (tpg_instances_lock){+.+.}-{4:4}, at: tcm_alloc
>   but task is already holding lock:
>    (&gi->lock){+.+.}-{4:4}, at: config_usb_cfg_link
> 
>   the existing dependency chain (in reverse order) is:
>   -> #2 (&gi->lock):
>          config_usb_cfg_link
>          configfs_symlink
>   -> #1 (&sb->s_type->i_mutex_key#24):
>          configfs_depend_item_unlocked
>          usbg_make_tpg
>          target_fabric_make_tpg
>          configfs_mkdir
>   -> #0 (tpg_instances_lock):
>          tcm_alloc
>          usb_get_function
>          config_usb_cfg_link
>          configfs_symlink
> 
> Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
> Reported-by: syzbot+2799146a53c356f8017d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2799146a53c356f8017d
> Link: https://syzkaller.appspot.com/ai_job?id=51e1f189-6d91-4321-a6ba-07d4eb3cd8cd
> Assisted-by: Gemini:gemini-4-argon Gemini:gemini-3.8-flash syzbot
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>
> ---
>  drivers/usb/gadget/function/f_tcm.c | 29 +++++++++++------------------
>  drivers/usb/gadget/function/u_tcm.h |  4 ++++
>  2 files changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
> index 9e6d4f39900a..cc75d7e9792a 100644
> --- a/drivers/usb/gadget/function/f_tcm.c
> +++ b/drivers/usb/gadget/function/f_tcm.c
> @@ -1720,6 +1720,9 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
>  
>  	tpg_instances[i].tpg = tpg;
>  	tpg->fi = tpg_instances[i].func_inst;
> +	mutex_lock(&opts->dep_lock);
> +	opts->tpg = tpg;
> +	mutex_unlock(&opts->dep_lock);

Why is a lock needed to write one value?

>  	mutex_unlock(&tpg_instances_lock);
>  	return &tpg->se_tpg;
>  
> @@ -1760,11 +1763,14 @@ static void usbg_drop_tpg(struct se_portal_group *se_tpg)
>  		opts = container_of(tpg_instances[i].func_inst,
>  			struct f_tcm_opts, func_inst);
>  		mutex_lock(&opts->dep_lock);
> -		if (opts->has_dep)
> +		opts->tpg = NULL;
> +		if (opts->has_dep) {
>  			module_put(opts->dependent);

The whole module_put() logic should probably just be removed, right?


> -		else
> +		} else {
> +			opts->can_attach = false;
>  			configfs_undepend_item_unlocked(
>  				&opts->func_inst.group.cg_item);
> +		}
>  		mutex_unlock(&opts->dep_lock);
>  	}
>  	mutex_unlock(&tpg_instances_lock);
> @@ -2300,10 +2306,11 @@ static int tcm_bind(struct usb_configuration *c, struct usb_function *f)
>  	opts = container_of(f->fi, struct f_tcm_opts, func_inst);
>  
>  	mutex_lock(&opts->dep_lock);
> -	if (!opts->can_attach) {
> +	if (!opts->can_attach || !opts->tpg) {
>  		mutex_unlock(&opts->dep_lock);
>  		return -ENODEV;
>  	}
> +	fu->tpg = opts->tpg;
>  	mutex_unlock(&opts->dep_lock);

But opts->tpg could be changed now, but you saved it off?  No reference
counting at all?  That feels very wrong.

thanks,

greg k-h
