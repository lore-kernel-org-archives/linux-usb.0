Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC543F8C6
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786985391; cv=none; b=PhklDGewXrBUK+g8dtlkpcT1LBqUJUiVrUxaVdrOaaHUT+MTmp83DxGoNVQPetfXs79UQ7cnU7J4OJDF9Z1ERi/8/YWmK147MaJg8A3X8CXektO29GzRmOdpEmV0RTBufYHp3NVwoihfd7g+8D0WyYeIou3AIpA3ZPIkCKrBym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786985391; c=relaxed/simple;
	bh=8pzxIW76lmcvlvRnhi3XGI5SvVCZt2RRftrCFkazPpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGN22VfyKla/lQncArP4PL/9LXXkM7Q4hoHx9sXSWww+U1Z87nTvPJS7otdlv3ZmOjlYpD9A+CxFTRNX+aOuohZXZTkRCgieoCSwmEq27BrKuEOO9PAhv8OVpc0jnSe6TpBt9SBhK186OyVBl5deWqO5pjrR1MHGROBxiiV6dAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OV71Groa; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OV71Groa"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c16ac21acso22285161cf.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786985389; x=1787590189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4onmVcS0wXvt90RKuLTsfAm4/o73vuWZXvKd+V6iv8=;
        b=OV71Groa31jhWjlga3JoSBOPYiBACyjhD0Lp+hliV/3T6uolxfAcOF4ABaL/fwERJD
         RlRECEsINpq/PtSMnuYYxxdMa2Jw7h2iDgdzKL+ap5C/8FkCRrfueAMKN0U2H3Vl6ryL
         eKEJnGNLVY/O28d6zY4eydmHOY3BDYOBIEO4Lo7XKu5Hyn4jDp9cjqZvsXmGaNiBA7HJ
         sB0vwASqxPU9n3KjjoXGcu4Wcju1lL8DvJ8it9X82qVoyu+ssAsSu0ZrjJiLWhotaU2u
         fL2zPEzMurxk8AEJFgvRMuevj+DWMDRoWtSMjSHK7L4ZKTA6ScWJdY2BK+t/ylGOKk9o
         467w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786985389; x=1787590189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4onmVcS0wXvt90RKuLTsfAm4/o73vuWZXvKd+V6iv8=;
        b=MkcLE8NFA736Je0UqsGkIgxVkDv6h99KECypqiM+dM93+magCVLPPPgR15WyAFMQRf
         5sfMErwZEGk0lYau67xqQ9oKclsDmIUmocft7kWWjCA4EujC6Zf95sWzkdM2zKQDJtRD
         ncRY5s+xYiMO8sUJFpileAa6FFgKwhEZ0IYiJaycuDjfX1a4X2ZqOfSEMOXcW6UsPLi6
         RZaFaXneMMTyG7K4TmvVEAebISy+crlYgArpyKaFe3wR/60exXho9p0HKioteMhAvpOY
         mbUPox9I2ONIa3V5xF/8Og7/nAMylkkEFzZNr1tzmpLWn0OAV/JEy3Gxr1UU0M4EX2f0
         6Caw==
X-Forwarded-Encrypted: i=1; AHgh+RrlMbX50VyYF8LIDuaIfayV7dP/KO3GrZ5pxf8FHTE4HFnyY3RcyRvMGncyD1rB5CBWEdk92uPLpno=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHj7ukwqN5JJo6PSIsN2RgjPUB7b50oZRCEhIu9dIQ60L3c7R4
	ipSA0pdOWqTNlO4UHd2T1CowhmwW3c0LZhJnCk5h0+aPKZXAWHJomknkjREvT/Ktiw==
X-Gm-Gg: AR+sD10aVao7dNV6YKYj5D2ynELSURJpI27mpJ/y2BOuAd3vna67rJSfvECvN7T1Tk3
	/jR+ZPrqHOB9jsO2FSN0jjv40seutYYnhVXQT5gWNocFF8KlJTkmDaixKDWsEfDNOn86kzBjxNX
	F4uLxvkuSKjr8A/6Oh9uTICPvFq8xz8cAnIYDegvlRz78HZuBqqkQJN/jqz1b0KoBZpP3+13Dd6
	aBwdOBTqC4nMMIObKYMbIaoo5lIpf1XY3FqbTlJsDysqGNpdMP8kXc14BY2kKnW6irLRAgn5iM8
	ULErNVD5VoUrKq9dyyP1ecjRFG+vpN1fow+7BhWFIZqsgug/N9UkcyWnIYnkmSvlEao0Mep+2vw
	9z5qMceP0e0NS9gGGzXip0FXWfTe0/hH0DezDql96A588f82yZtcfq1Ti/MD6p0PtrTCOZbhI0O
	YZJoWJsiRaXnXg9HDv0oiHE1kxLjQZndJL6t2bRqXVbZdycZvrB0fdiKsOx8m4TINptmZwwKQQH
	th3uKER+R4BbqGlQ2L+7u3mDMJ6s9ek
X-Received: by 2002:a05:622a:258c:b0:528:3157:7a8e with SMTP id d75a77b69052e-52d85306756mr304169831cf.9.1786985388602;
        Mon, 17 Aug 2026 09:49:48 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db612c2bfsm18799641cf.11.2026.08.17.09.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:49:47 -0700 (PDT)
Date: Mon, 17 Aug 2026 12:49:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: christophe.jaillet@wanadoo.fr, gregkh@linuxfoundation.org,
	kees@kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, stable@vger.kernel.org,
	syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: f_mass_storage: fix null pointer
 dereference in fsg_common_set_num_buffers()
Message-ID: <9084b256-6b3d-4f95-bb38-60f5ab6860f3@rowland.harvard.edu>
References: <20260817160319.28251-1-jeffinphilip14@gmail.com>
 <20260817160916.28523-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817160916.28523-1-jeffinphilip14@gmail.com>

On Mon, Aug 17, 2026 at 09:39:16PM +0530, Jeffin Philip wrote:
> On Mon, 17 Aug 2026 21:33:19 +0530, Jeffin Philip wrote:
> >Kconfig currently sets the limit from 2 to 256 with default as 2. However,
> >we use that only at build time. So, if we enter during runtime via configfs,
> >we set page content to 0\0 and get the null pointer dereference. So we will
> >need to add the check for num < 2 in fsg_opts_num_buffers_store() and return
> >EINVAL?

Or put the check in fsg_common_set_num_buffers(), which gets called on 
all the pathways.

Alan Stern

>  Upper bound is 256 which is below what kstrtou8() can return anyway.
> 
> Correction on the last sentence: Upper bound is 256 which is _above_ what 
> kstrtou8() can return anyway.
