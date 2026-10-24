Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792854650;
	b=qR42+K6BHTooHHjJ4A79RLjgSpm3laiWE7Z5Kd80VQKimsBRXbQF2FPlleXWMMX8MjiJ
	 dcubL84TM1mCRqgIlD5ExP+pmdX6IQbdkd0fyT+JNijIoXmsVzQFWpeMLIb7x2J9c47nO
	 s/ZBcAwtuVvX46Z6CnlLabZA29X+dqs5+DVHvKmlTy8BmBvt9uCj4krY7vQ5cB83S+bkW
	 VAMe81pgjhnJNuGX7cX3psoQ86H0z9Y/2gDxbHqN1FOlx6REcTk6yBvC+NsEzRq05usR9
	 tzU2SVqHLmJ9yvnV8fiuv5fPpma5kydH/UOoJTIb3zUdDxlzUB8Y98GAKg+yLKfcMeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uf9PXkRYvY5lIL6bNTa4Yzjo7yt0Q40iND7ldsiuGxA=;
	b=NwmclxRvM5ERSrJ3Zt3f7QJyn8gev353b8PKc6H39cJCsgdnycX8coHs6oLwmlWQRhKy
	 0BexqtuZYEoVfl19S91RC0oO7ilq8883dtfn8bSypoe8etHqFeYMqBfadySUNK2Cy05fy
	 rOY2Mu4UMbnG8d0N6dR3MzhO/SaCBdRhvGDucr7RNBadhOkgkKcPgeeOhpW6/PEu4BUUv
	 WU4CNDhWo4wR+4j7xEAvqjJsnpALvYFE7LBfktBwp4vH/lQ2EzF6mfQWzY6aDo9WLhVAh
	 AF+Ru9WqzKqnpyH+xZsyqvcHDkpu854xag8t2iT1UueCJrYJb0MqjCqjlTaTeqc1+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=UjCay2OS;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F57B606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 15:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F57B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=UjCay2OS
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53512cd2f85so19326141cf.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792854648; x=1793459448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uf9PXkRYvY5lIL6bNTa4Yzjo7yt0Q40iND7ldsiuGxA=;
        b=UjCay2OS7jAquojSnrfc5PdGje0dYbz9ciN/UtUtSGi6mmR/Mp1oKZ/E6eesBrF3Be
         fXQcQDGNUmV/X1J7fcarVAOuaEItCsZz7lJGnSimXW4CfkfiFpU1yKO38d2jKwlSG+cd
         OHGUaPi5i6FD98Wvxx7RjfvdK4jQkn7IHsVRVXo4jocnbxqLf4Kd8ieuxk1/UBDmH0/c
         YaQAhWqdgj9Caw111npaL16pOvgq21FNkRsXHME+pzW3zSIisjaqwsHGCd67zKC28zMt
         bESCLb+5W4orB4IkLrOMuV1q96Bwrwq3fu7eFq9zYYJQ+JQq1u4TkZMzwsh8z6mmMLoP
         hzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792854648; x=1793459448;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uf9PXkRYvY5lIL6bNTa4Yzjo7yt0Q40iND7ldsiuGxA=;
        b=Gbmo6D4OYSST4Z4N9FBuIKwIE0SlzF7bqQT6RoIbdTpDjTmuGhlMDQGsM3ztF+canN
         D6GUj92SETZQao0XF/kBVI2FHmGXShxGCmSSmiJSxKzAfuKjc/I+I0fENdou1RwsQbBK
         LzJ6Iy/qZpAqB3TUpWr9n/9tFMeCVduSoe+0zvBhhSQe9r4w6JM0sXBP3XePSx66JLDo
         LfwrNTIY3GAm27/D/XCZjt6meW3MF5hx9rknjPJ33d5wV9DNxDiD6F6PKt3xZUNMXvZ5
         UkTSb6ABDnbdJlBFVgf3zY2Ddy9cVS5sTWBcG7lcBsyoEFLLIZMcaYvK7DZFXZICAq/0
         TZrQ==
X-Forwarded-Encrypted: i=1; AKwUvBycJVUsCsoq5l3q9y0W5CfrFCEEpvNsmMBOoDGjyia1Afp+zBld+K0NwFIL9TPQulQCwJRADZ9KDy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7bIjElCX5dOh/VfUa09leAWclbUUiDN0GEpBXu+8x1b5G05nE
	Hi4gjOgR6wKqn8HTvwYa01gUN0+5kW2yV24XYBDOLSIuMrqLbk2uj0PKmJngex2+RQ==
X-Gm-Gg: AYBFou2Ndj9fKKcZXDHZ/xdwUTpzRscrJyzSVBEPziX4b7UUmpeuZtEAEAInJS4YCY9
	TYmnuFA3wOJ6564omD0yHQOg/gptiIpQT4QF+JyVdqkmE6txsC87DTL+ZDxQJh5Mjz6QtoMgeIV
	bJI8m2wL7DFMd+ROzKNp02JQP6X6fuSwV42uG/0W2oDx5mpuomFO6iQETWcSEhIHCVmguP+evSF
	puk8kHMFknzsxRE7517f/le7qHY3LjLAbV3dtVs2PzwZ/rdjW7TT/DVtIaY3L4oWBy1TastU7Ms
	+8gKO3Cy6Hi2A0cTVsI3pdCeIGSHvVUN6w2ARsSZgmO1KLSVr6C4duxu37UntWAKC1YPq6G/Iho
	Z7Iy+LeVwpFOz2dx84bZdGh02dQ7NjOxsLh9gE4gtZBdOvKQwbdHUKKpKh2Xhq1FN35tyJJdpsY
	NZbvvwUoncIbKCSAsraTzOmGPxxp70SRhOh5SvFu6r+Mn5Qq5twiPpT7FqbnNNecdvabS1BlIfZ
	/k7D/A/0eSEFvq0cN4B03lbwYg81SvVsJ48w17B3SVQLr/HFE175MPd
X-Received: by 2002:ac8:5acd:0:b0:535:162c:2e85 with SMTP id d75a77b69052e-5383b353beamr27733841cf.10.1792854648097;
        Sat, 24 Oct 2026 08:10:48 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970b678sm17189781cf.21.2026.10.24.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:10:47 -0700 (PDT)
Date: Sat, 24 Oct 2026 11:10:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: sashiko-reviews@lists.linux.dev
Cc: Igor Putko <igorpetindev@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: hcd: flush giveback work on stop
Message-ID: <47728b9e-c35e-4964-8c90-5bc29a2ab045@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024083647.2599-1-igorpetindev@gmail.com>
 <sashiko-outbox-183606@kernel.org>
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
In-Reply-To: <sashiko-outbox-183606@kernel.org>

On Sat, Oct 24, 2026 at 09:11:11AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] usb: core: hcd: incomplete bh work flush in usb_stop_hcd() on self-requeue
> --
> 
> commit 9c9e1488a3b8b0e4cd42d6243a942c8d42aeb233
> Author: Igor Putko <igorpetindev@gmail.com>
> 
> usb: core: hcd: flush giveback work on stop
> 
> This commit adds flush_work() calls on the high and low priority BH work
> items in usb_stop_hcd() to prevent a use-after-free on struct usb_hcd when
> usb_giveback_urb_bh() is still executing as the HCD is stopped and freed.
> 
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index a865a15ea3863..9db0f39896065 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -2788,6 +2788,9 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
> >  	/* In case the HCD restarted the timer, stop it again. */
> >  	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
> >  	timer_delete_sync(&hcd->rh_timer);
> > +
> > +	flush_work(&hcd->high_prio_bh.bh);
> > +	flush_work(&hcd->low_prio_bh.bh);
> 
> [Severity: Critical]
> Is a single flush_work() call on each BH work item sufficient to drain all
> pending givebacks if usb_giveback_urb_bh() requeues itself?

That's not an issue in this case.  By the time usb_stop_hcd() runs, the 
two giveback queues should be entirely empty and there should be no more 
devices remaining on the USB bus creating new entries to add to the 
queues.

However, it would be worthwhile to add a sentence to the kerneldoc for 
usb_stop_hcd() explaining this fact.

> Also, does the comment above usb_stop_hcd() in usb_remove_hcd() stating that
> flush_work() isn't needed there need to be updated?

Yes, that comment should be removed.  In its place, add a comment to 
usb_stop_hcd() explaining that even though all URBs have been given 
back, the work routine itself may still be finishing up and accessing 
the usb_hcd structure; that's why the work items need to be flushed.

Alan Stern
