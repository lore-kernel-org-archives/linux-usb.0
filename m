Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46DE44C51A
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089368; cv=none; b=XkAuqiR0Mc18vxgui08Xkx9pVBqc1mMMNnbWJ2sNOZCt2f1tALNhBYmsvLnwcImRQdHU7xlvfwVad3SQQB7NTb201ujrNgycoJCMpuQd5CFRP3o8WpabuEXRuACLGlg5oCG9xBpyJywbGqB6h3VBNGtIe87nc2gdhnYcC/QgRe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089368; c=relaxed/simple;
	bh=TLr1LucY4VL4yVUlVTB823ltLyltwTY+iKWipUNEIeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnSwsC2UeeaR+O38blI/wch9tkrGli/PSzDzLWdNtpYKrdlIZqWzgv2jhMNdp9Vju+hYn1VsR/mo0ErwaOt3yrcai7ZRToL2NQ/lubTKeXj9K3JlSLTqU1fmmc0sNSlqCWdP+nSNghJf344jJJNEK0t1G8VHHKdAwfO/uC92RjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qYPQjXOH; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qYPQjXOH"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53512cd2f85so70072121cf.1
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792089360; x=1792694160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGaEJMGgzicXp76y7CRrNxXTeHLUaqluIVRvG1wuFn8=;
        b=qYPQjXOHuQB2vs2NHK4FzYC1bR9UJWakETapKJVVZTfWqLNj+2se28Xl6ZfvK6+3ik
         MN6cJOzaFA4SRGAcbgOXL8CivmqCkk4C0oeINrNAUlXL82sLF0dYdvgx6dD0FW6+WYIe
         n9E4Bo7CS2EhBtRdcBPCPiu8pwtoL168ofHstZDftYvARmK7crKH7C+AhXqd6z6n/Xd/
         dVj5E776XWZX59sGqjqkNxxNrFfaMI4GCxQ4E/3OsGsZXNpVhnVD1rv4Rjz+2/JLhTZ9
         hn5FuElae3cTBETRxwalr6FNHWoYDx1EWF6Jm5umevwGTyYykjwm+PEiNhHEIFb5jaSX
         ZCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089360; x=1792694160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGaEJMGgzicXp76y7CRrNxXTeHLUaqluIVRvG1wuFn8=;
        b=mHV9e3qLzScbfgYuZrXVejmnBaqp+cXIYYg471sauodC1OETBTWO77ZPSxq6sINkue
         2Vttnwe6l7sGG3klrNzPsteLsYMCdYjh0WRQr+1k9q18Magesl3uVEA0i9jYHt2hrJ2n
         mpA5yAkTpfVYTV4hV6XWRU27uhe7Cnt4fdf2wgME2cXyjkTFfBpY7dAwJQT4omFtssZz
         wEtsddJMG76xXvWKahgvFBcSd6VBKqMN7WAvS34pdMbocwOFQiI5wCesunef5iZyAaLz
         7roVW18aQDMOmPJOwM/G7Ia6on2HeRwFwXcsEWE96zq7xi0GpSVY6A0eku+69/W92u3L
         HFLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRcTnj9/6UsVJwB9of2C9RNV2PcddEBAqryT4WCr/ErYOIBcPKGlEo9p/7x5ljSpkK6OErATnd/bU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/LUufuu7evzDs8cCy3IykADJO3aZYKitxaOspO7WtP9mHJUi7
	tTxeijFSvM45PcgVZo4hGjq2PGIw3XaQRFhVhUJrzYLmADG2/79AOW+Cotv8tQMxhg==
X-Gm-Gg: AYBFou1KNaFcWpxCCx4ae9k8FKTPX2p/4ImH5Z2fUd+FM41ecS8PIr1oAirGhvZ0KaD
	1EavLwFOkLF/S+1yeNc5JCVpn+XXHV2JdDbBJSAG6gx1CnjkhNk3bDpR+5KTIiHnWRAom5bl3kF
	xHvsS6wWXQPD9LqSSFGyhdmROoVthMsYxNLa8ZNAe/e7dFCo2O4ZLEiXpW67Pxixq1RLa8OCFaB
	Yo/ULEEx8ca73UUwuDWn5KBLhLsEogAbSKLIPjO8hLfBlwtAnSS23HOL4ISjCXxHvgiYrWeD4W2
	Nxh3Eph8fn0j3EZdGzYMqFGZ+5TdkSFmZkge5RSa0ipt3jNcQIa2gKPbfa4Hv3CWTq9HV8YDDKl
	qe9VNd9/HJGwn4IJeOJwprIgguA3izf7W00HkWYVQRjJk16q9kezpqNxge9fOJcO21QfjUyOc2K
	gkZeXLiYjJEEbLcezk+fham9CCaOntIM2eWg6YwzFOUsJLwxz+uhHL32iGiCqzLljPnDsOTO17W
	DjHJyofbQCRcCQXdd7QClMqdHVOzZ2qUtW2i2fAFg==
X-Received: by 2002:a05:622a:90b:b0:535:85be:da8b with SMTP id d75a77b69052e-5359fe01121mr316645821cf.61.1792089360229;
        Thu, 15 Oct 2026 11:36:00 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9bbad2sm192231cf.18.2026.10.15.11.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:35:59 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:35:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	=?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>,
	oneukum@suse.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: Re: [PATCH] USB: Documentation: Update description of completion
 callback context
Message-ID: <7494e770-518f-4866-87e2-5a525af3b82e@rowland.harvard.edu>
References: <2026100910-petition-embattled-94cb@gregkh>
 <20261012194902.aEq58Q6b@linutronix.de>
 <8545800a-a37f-482a-9b06-cbdd70312b7a@rowland.harvard.edu>
 <20261012212527.5sFqlGYu@linutronix.de>
 <41af30de-4725-4913-9ad8-54d1dea2d4b8@rowland.harvard.edu>
 <20261014191141.GxlJhR1e@linutronix.de>
 <89da3b1f-60e5-4f18-9592-3d6d7175c437@rowland.harvard.edu>
 <20261014220403.R38Gf0pW@linutronix.de>
 <de582feb-a0aa-4fc8-9818-890014de32a9@rowland.harvard.edu>
 <20261015182643.MIjjSTAr@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015182643.MIjjSTAr@linutronix.de>

On Thu, Oct 15, 2026 at 08:26:43PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-10-15 12:00:46 [-0400], Alan Stern wrote:
> > The existing kerneldoc documentation for URB completion callbacks is
> > incorrect about the context in which the callbacks occur; it is not
> > always in_interrupt.  State explicitly that a callback may occur in
> > any context with no guarantees, and likewise for the status of
> > CPU-local interrupts.
> > 
> > Documentation update only; no code changes.
> > 
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> usb_hcd_giveback_urb() kernel doc says: 
> 
> |  * Context: atomic. The completion callback is invoked either in a work queue
> |  * (BH) context or in the caller's context, depending on whether the HCD_BH
> |  * flag is set in the @hcd structure, except that URBs submitted to the
> |  * root hub always complete in BH context.
> 
> Do you think this deserves an update?

I think that's okay as is.  It describes the current implementation 
pretty well, even though it doesn't mention the lack of guarantees.  If 
you feel it should be changed, let me know.

Alan Stern
