Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041089;
	b=4ZPxNsGqon8aKcvBYsVmFEYMFDdp/e5MVOvlK4AVthyqm4H7vhl7cPlGUIPvStGlQbxP
	 hrHVEBhqNsvQUpS2IK8GfmZd57DGute8EzAIukXpel5+NknDLV71bvc976lhGrUSytd2k
	 ELOPg6x0ROBBrlIqjv3I6ILIbHynbeMpxi5A/ez+GWc/jDAPkfpu9J168JYeu1S69Sylz
	 FGhIjqfmeRmwQty/92oAeDm33WCmExFskbEu9+RRG9f8lTt/G2AG2ev8X5BdWkOr98OnQ
	 J+8s0QxNbGKb3fC5+g4drDZvZNveqLz50Vldf/aNe1MHVfMIdR6S0rz7xHDpCAYvKdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JKUJ8LDBgbQxcz3WszEduXS8OXow7pgRlAV/qt5NPP8=;
	b=0uKCrgZBOf0fg9ZIE3EoFnqvnqB1JvMEHjZoBheKZf4/JtDJ6bjBGcBnqp45abOBjKej
	 rKO/1sRdvLiHA9O67j55uEiOl2ghV6S4iZ8dlfrgV6htMAvCN5ezumNOdF5232h6jSKQF
	 ChEt7oo7wpIzK/HSRL4xoBGdbFK5Ik5BW6AWO731jx9YuB53BwWt5vl5GtoujgBVxSvil
	 oFBZQwLCrLEn3FPmidi8gTKOQ2dGvsGOQ2T8h1mNIgPYxxmvD7UqjuIrjcn40uKg/YgT5
	 KaOfuDp16zdMGffnmu+kabNvW4OMefLcPUsmSIcO2SufHif2TjHqKob8qEOMdFKaIcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=oFvEuFC5;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEC5606A31D
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 18:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEC5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=oFvEuFC5
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53634b8328eso23044171cf.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793041088; x=1793645888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKUJ8LDBgbQxcz3WszEduXS8OXow7pgRlAV/qt5NPP8=;
        b=oFvEuFC5Vj+2FU+KjoMvcYItTl2SXlgfLxrXGgcio7kgT8DGOY7Ax9YPAFEqFe2rZ3
         Ysf8jcOrtfmibnGxToROEJ/Ik9IFrtiUX3wPXndBaQUD7ZhZ/xydg5+63vk+/FTJEbZc
         mdeukMsQR+t9zXzQRzKZIVfwMltmWcbCwQSR5A2zs8pXuEilJm51Rys+LHzn9TuROTTD
         uasdmrLleywrem84ZhHKMJAxSkuLbCWvD/0rXByZ1jHyvusHK8j7DNHDe9TEM0r3MmfF
         1CgNMSzzjXTUQWLjAme6cDqGTja6v1JUaSWdaz7M1KseNH70dgXKiPzTzACfSdFO3uqn
         8AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041088; x=1793645888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKUJ8LDBgbQxcz3WszEduXS8OXow7pgRlAV/qt5NPP8=;
        b=qXp206/8dl4iC6OL+kmrTzaXy69Bkhn9vM7SFXyho9QLrH4YQ39Aa/9z+DgB4BU1Ry
         q2ewZOxc5bARDrXAjJFAGQJDNkBWkNC2rThTJDjOt87vyqR9CpP58IIRs3rPQ8vXwrYO
         +YrmFQw7CCB46MmozPqaD/lWIeX0sdhA24tNjqgSbIP0cG8cXqB9LaTyjTaHI8ILpAIb
         mxlPxldzDMcs8TxA22DjdRkmfS8V0eEEIn3cX8ZlvZ5EW7G1dvG3fRgaLkg8JAeBp9Fa
         vPUghSTZT9xO/cxtATLI9VlRLGUcqTdCv8iUl/P1ItuUe8TpxW63U7cS/Gq96hAKVoWt
         Gt9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6WfkeRfXFHg/m71r1qjnHI+RnwUZbrtQGWvWhXb0YjjGm2niCi8DkRkg9gIS3BZ302YEXizbXhts=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyrByWOCiZMy9E6PUeQZ2+uadc/qjMOw8Gm7f5Z0jhp2oFaPN1
	KDMEem54iKOLNvTD3ui6Pyuev+DFzdzADUsow2LDvHNGUjhS3+5LGxOuwLxQ3HTlhA==
X-Gm-Gg: AYBFou13/wnuF921tNudJeK9/EV/aiGX6+I/Jl2GXWdo8vyGdvhrznV8kg8Ziz1vhQf
	E+IhpNwRaPCDW/Ypuj2Izx2kOqvHbXRwCDjn0cIvfKKn3HhwQLrgOUm12DqZWUea3tkiKKC3e9t
	VAAPW9cRIF0IzW4lE1+3ADfx4Vb+TDn+FP7gNd581oFmQcvGJKHkX5scpl1xsaw2TRBgUd6xr4Q
	ruxedS7G18FCUetPqjRM9zAsdfpM6b9r+8Jg4XYhOQ9Pulv3jTDA7DyOtXO0/cawgK2DVvqyQV5
	+1BaI6iqW8QdfPn+bFylZxpmxWiDIWsRrj+jjt8BELvSkowGVEJ9bYqucbraTo04/0QEQsxdKWL
	WDQ4DE2ZrpiaK0zbsiG2COKesAwT2G8NgvFGzCyas+zRmZoljktO+Svkmvk0V6xB+M1R0OHLQTV
	4UDphIUe+kbryQuENDv7LdV115wJWgpFWrO2y/WxTynQZSZqIEp9mx22QZ+C1Ef/3dYxLPBH9YD
	IRkveqUf+SV7TgtoypQpXNShSwPwV4emXeUsR0+alZqs3lAXK86RgGV95CNPpvxeqYBiKlXw/gw
	zPD/LDzV2IRUkvNioTUImts=
X-Received: by 2002:a05:622a:580e:b0:536:9140:e2be with SMTP id d75a77b69052e-5383b6130d7mr126015701cf.74.1793041088189;
        Mon, 26 Oct 2026 11:58:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a7cd7esm79875376d6.2.2026.10.26.11.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:58:07 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:58:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Message-ID: <25e5ff9c-8db5-4e6d-ab7e-900b7b6af05a@rowland.harvard.edu>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io>
 <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <20261025111410.2c14fcef.michal.pecio@gmail.com>
 <7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
 <20261026105139.6b86cb3c.michal.pecio@gmail.com>
 <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
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
In-Reply-To: <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>

On Mon, Oct 26, 2026 at 02:56:49PM -0400, Alan Stern wrote:
> On Mon, Oct 26, 2026 at 10:51:39AM +0100, Michal Pecio wrote:
> > On Mon, 26 Oct 2026 11:18:34 +0200, Mathias Nyman wrote:
> > > > But is USB core really resetting a device for which the hub has
> > > > reported disconnection? Something isn't as I would expect.  
> > > 
> > > I suspect udev, xhci virt_dev, and thus xhci ep0 ring stays intact
> > > even if device has a short disconnect during reset/enumeration.
> > 
> > But this doesn't make sense, right? If the port reports connect state
> > change, we have no idea if it's still the same device or not, I would
> > expect udev to be discarded. Or is this some "USB persist" magic?
> > 
> > I didn't want to dig into the hub driver or bother Alan, I hope we will
> > get that debug log showing what usbcore is doing there.
> 
> You can read the login in hub.c:hub_port_connect_change().
-------------------^^^^^

Meant to write "logic".

> 
> Broadly speaking, if the port is enabled after a connect-change event, 
> the core tries to resuscitate the child device (and checks whether the 
> descriptors have changed).  Also, if the child device was suspended when 
> the connect change occurred, the core will try to resuscitate it by 
> treating the change as a wakeup event.
> 
> Alan Stern
