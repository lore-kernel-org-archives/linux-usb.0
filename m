Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A7A38F934
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 20:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555736; cv=none; b=RHpXkTrgMkhkX10kMvr7D/a2KiGn5OSoXgCvtjtSEYAT+S4AMRB6G/ApzTOdNs1YIAeNG/GNkr1tEfNwe9LgPQKqDdpLl8R5Ox7nKQRqVjAe6RWR1E7M2dSdK/rD8Is9iJrdbVqjcKRnv02OQZM9g6fcAdvb94f5nvP5PRqxJv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555736; c=relaxed/simple;
	bh=Drzz/kl8wqpnOalyeG0tHOz9kyf2y38JBrqmPNjM9DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/lKFC9qEgC6X4xKjyBU8Eu+2HtxVGB56fbNM0aO1xIS/llz6Hrz5mVovSbrhxHTqAe6VcO2cA746Rxt2h61W8nDj6LUtXO6p+zzqUzy3q7W7Ex2jjYyWYFe0QofZgyzphMUF1uj/bL+QX4ki+HV65k5NIp2Hz/XHOJPFnY1qRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Crf148nX; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Crf148nX"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e6f27619e7so3333556a34.2
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781555734; x=1782160534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJmil57CketSzFiTcNCfca+Lsiyi60LhfLLDJX5+Qv8=;
        b=Crf148nXJEen4XxN/aqt6oZ3cNgnSHN11+6fYoAwM1VUFpiLFHcPLI/XecK/Y3qkm+
         kJ4VbHF0sx8t4LuH4E1FVlx9/3uwY9b84q/TpzuJOIfUdWW0SJK7rfuI36/n/wnePJoF
         qJZb8HEwmMl1QJY3qm1j3kEOiLRHFyQ74uGT+jpAz3sFBl46Gd9neTJuLhhiP+L1qM0l
         2Sp7ri7HtwgUFf2+SeWpAsZd+PhFYj6P1mSLt7gGLPiEpC/JCDdvnkGOP34/euZtBkP1
         meZLbpg4PY3oeqdTPsUGFqN1fpy3ZetKxcBU1VbRbXuy1xpcxVWciU0Xd7NuV0Q4kMnN
         /5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781555734; x=1782160534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJmil57CketSzFiTcNCfca+Lsiyi60LhfLLDJX5+Qv8=;
        b=BGyk+buSQ1CSyGkwcJg+yvfoyOlFt8PLzAJAMwLp/ST/StvFln1s+iUoZxgCTdf/KW
         pBF3sxOW15+TkEdxijSYC4a8Yb1yYRDUPLrkNxe2S65iM5SJA6tMlMj+wehgP1hyQD7Q
         CI/F6ipk/GB7vRvMbHNdD+3okwp7ct/Pv/YQigeK75tg1CgdMUCcR1goBlPgnNv8nPLG
         YjPusRatm1XJVoljGCPZ2vpo2J+GeTfyIpgUXPtoyIXHZeCCffVM4+OYsSrTau2ZNMg3
         iS4/D//cabZ3iuuQRrd70p0Suq8C94hW51zom7r1339fCVWX5GwxBxM5OudseCr6wVXu
         vYTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hOjhpbfvCukReetiET/yEnhdifyU+DOyzuTw47HWdINZnWde1zrr0HUXrKrsKoNWvRjsrfsZs2f0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzeP9EVWUiZVhcsq/K8itVr9zR422HvEeoYp3ZZRQ9/lLrzdEv
	780alliDRi9cbvcb4KaJC6b81Nx7FY19LMI9fgeMgJtDAjuz2g0tALMTLwc6I4negg==
X-Gm-Gg: Acq92OENm+axMGD0HfyI4+/q9yEvy1MFiUEfdsmRZzNW+fBTDrYeUs5dJMudEaBTokH
	SceTFWBx8abY/Rusub9epG2yo34GApmhlIuWOCB5Aj68vnFQ29zVmbn/FiTYRM2joQ23vH6Ubeh
	Q13GUlIv+H59f1cV3gDyoXSjbwk23Qrqkx18FeiIvyEV8h9Vs3ZUxDKAtFB4h6f4kkATqB1NJNj
	qPOV06gxExvQjXuF2YLipzwnWxqIcxScUnPF5htMivXGuOJntWjewq1zD0xqi4TMlkqEJhGJjqM
	OWrlkL8mICBprZqGbSUf1/XgCmIiPfHI671CQ26/+AmjUbzrDjBdITewvZOYoHigDzypYr9W6ks
	yMgheCuC6ClvnpMIsEUl7RMr7/2BkM9Tp+xrspq9OqxHzCPEIGZvz2iYPBvhw4taWXOWg0ytrZW
	Hrnk6HIG+IhtI1/d8vnWuEQvtO+pt4N1LF+m7rjSgYJtmvxDyW1wSAYTeYlw==
X-Received: by 2002:a05:6830:82ce:b0:7de:4ebe:e44 with SMTP id 46e09a7af769-7e784663898mr10515153a34.2.1781555733915;
        Mon, 15 Jun 2026 13:35:33 -0700 (PDT)
Received: from google.com (57.221.30.34.bc.googleusercontent.com. [34.30.221.57])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f6de65bsm4870881a34.19.2026.06.15.13.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 13:35:33 -0700 (PDT)
Date: Mon, 15 Jun 2026 20:35:30 +0000
From: Neill Kapron <nkapron@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 3/3] usb: gadget: f_fs: Introduce rw_proxy file
 descriptors
Message-ID: <ajBiEqs_Nhu6HSL-@google.com>
References: <20260614181006.3648010-1-nkapron@google.com>
 <20260614181006.3648010-4-nkapron@google.com>
 <2026061503-ripening-jokingly-eb4e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026061503-ripening-jokingly-eb4e@gregkh>

On Mon, Jun 15, 2026 at 04:35:39AM +0200, Greg KH wrote:
> On Sun, Jun 14, 2026 at 06:10:02PM +0000, Neill Kapron wrote:
> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index 4c1bafb3eef5..0ccfdcfb1810 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -159,7 +159,9 @@ struct ffs_epfile {
> >  	struct mutex			mutex;
> >  
> >  	struct ffs_data			*ffs;
> > -	struct ffs_ep			*ep;	/* P: ffs->eps_lock */
> > +	struct ffs_ep			*ep;		/* P: ffs->eps_lock */
> > +	struct ffs_epfile		*epfile_in;	/* P: ffs->eps_lock */
> > +	struct ffs_epfile		*epfile_out;	/* P: ffs->eps_lock */
> >  
> >  	/*
> >  	 * Buffer for holding data from partial reads which may happen since
> > @@ -219,17 +221,20 @@ struct ffs_epfile {
> >  	struct ffs_buffer		*read_buffer;
> >  #define READ_BUFFER_DROP ((struct ffs_buffer *)ERR_PTR(-ESHUTDOWN))
> >  
> > -	char				name[5];
> > +	char				name[10];
> 
> Why change the size?  Shouldn't that be a separate patch?

The size change is to handle the new proxy file, in the format of
'epXX_rw' (with a null terminator). The size of 10 is a remnant of an
earlier version of this patch which had a slightly different naming
scheme. I will update v2 with name[8] to which will properly reflect the
necessary size required.

> >  	atomic_t			seqno;
> > +
> > +	int				opened_count; /* P: ffs->eps_lock */
> 
> Attempting to track "is this file open or not" almost always fails
> horribly.  Think about file descriptors that can be dup() and passed
> around, the kernel has no idea what is going on with them, nor does it
> have to.
> 
> Yes, we do track if the file is opened or not already, but I'd argue
> that too is broken and should probably be removed and just use the
> normal file descriptor logic instead.
> 

Ack, responded below.

> 
> > @@ -1378,8 +1393,18 @@ ffs_epfile_release(struct inode *inode, struct file *file)
> >  
> >  	mutex_unlock(&epfile->dmabufs_mutex);
> >  
> > -	__ffs_epfile_read_buffer_free(epfile);
> > -	ffs_data_closed(epfile->ffs);
> > +	spin_lock_irq(&ffs->eps_lock);
> > +	if (epfile->is_rw_proxy) {
> > +		epfile->epfile_in->opened_count--;
> > +		if (--epfile->epfile_out->opened_count == 0)
> > +			__ffs_epfile_read_buffer_free(epfile->epfile_out);
> > +	} else {
> > +		if (--epfile->opened_count == 0)
> > +			__ffs_epfile_read_buffer_free(epfile);
> 
> If you drop the opened_count, shouldn't these buffers just get freed
> when the structure themselves get freed?  You are treating the count as
> a "reference counted structure" in a hand-rolled way that might not
> really be right here as it's kind of hard to prove.
> 
> Either use a real reference count for the whole structure (i.e. kref)
> because you need to, or just tie the lifetime of the buffer to the
> larger structure itself.  Otherwise these fake references are going to
> be a pain to track that all is correct with them...
> 

I was concerned about the implementation of opened_count, and was
pursuing a proper kref approach, but it became a somewhat invasive patch
and I didn't want to pollute this patchset with said change, as I didn't
want to potentially introduce issues for users which did not need this
series.

Changing the buffer lifetime to match the larger structure is
straightforward and clean. I will implement that in v2 of this series,
as it fixes an existing issue.

Thanks for the suggestions,
Neill

