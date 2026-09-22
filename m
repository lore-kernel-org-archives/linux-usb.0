Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CD14A204F
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 06:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057483; cv=none; b=qfc4213nmNgQ+A4qkT2SvubirQKe8ocaKgy7+eAdrX+15oPQdne0pnv6Hh8NvCxWb3VXMkocogWsrmYfXgDBwJiWwIt1jaDzjw78cR7nqkaoOC8weW7eOg5SbdDQM3SeGTE7J1RsLxZCYMt9wrrgzgED3DyGQ+2VQME77BzAHP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057483; c=relaxed/simple;
	bh=QCv3+VutRV12zObb2iK9+gsnJAsGyawD+siHQYxH9NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lu7Rll9f19H9IGcQCBBVqrjtTzr1KUeh4rAGgqF2LRsd3qJ/Exp19GjHFFTP3QCR9HcwlHdkwZb5NC3ji/ahywV4mGAJOKjuDzURH6yZMS/5iEZQZBz/gILJIC2CmRGlKj207VzIpODhArt36PZhXQ3WM4FRlPhT68ix5DorgoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GC70U+26; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC70U+26"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso4002475a91.2
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 23:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790057482; x=1790662282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NlAU1cyZsGgVwNObzTYZB5CmWtYF2TFVXhpno3VWcwI=;
        b=GC70U+26O4DCaW242h15kXKsf2w6sVBKhfYJOXF87vMMmzO9M3dSJbemDlVZF6iyT1
         V1VP3l1lp+NxYKo9y+qz3bTnXHGs4QuOPum0Vr9zXuG5UkMnVAsV4R8u7d/egqJ4Q44q
         NkWFcXwMKiT8uwDktZ7M+Er2qpBmWJ4TaMWOMTNVGFt+OOJ4iWK80JMPGd73ceORFhsV
         wMndzSfEYKxrOEMNRPYxsuc4Z3/Xdz8lVc4YkXI76v8rXXzp1nV30VojnV8x33nw8QTR
         eArxA9SLh2VRK9JjSiTv0ZlivHXBXcPA4Wgc1PRxF/xK2+odTVnDPoT4xqePWodE170C
         8oEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057482; x=1790662282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlAU1cyZsGgVwNObzTYZB5CmWtYF2TFVXhpno3VWcwI=;
        b=bk04LxlcAMHo1KfF2OntJte3a9XZ3eM4k3qvSdP1WMDRKSiYpwNGvrTyZ9KJHKs0Tn
         92ExKOC1Hd7XUrEY1SqycjHF+kx/UE7nA0CVipGaUDBjlyGChMwubG9MqpOw9U2tTKeg
         UpsACPPrBPElpJasWo5qDEmWxEBaghtNEBXoHFlyrus4oLMi7ZN+h24s7CIazu6YJBtp
         M+tHCcFdsVtuwgAOsClrKWqx9j2klpADa7C19cHJIgLXkjJBn3RLSXjnVcykXfFsE8so
         u6T+o+qzfpTUSCSGrmBi9IKHhJYn1QYVU7WgJIOkYU7YnGPUBtgiQW0XAYpwuXwJLEkP
         A27g==
X-Forwarded-Encrypted: i=1; AKwUvBwX+zRRrwcR8oRReC/rdDu5ZG5DDAghN3F6jazoFuHOxm0rGocICVf399Aa+GObnrt8mFa3hawowTc=@vger.kernel.org
X-Gm-Message-State: AFuF++kunpUImc4sOmXPDVllItv5w/0WwfwmLOgIGQyhZ5C6Lh+yfWMr
	DkVO4ayOGUq0FZgJ01HAYWExYuXaCUgfxiyk8WlkWW8Y+lk0GC40sMYX
X-Gm-Gg: AYBFou1EmKjeIfaNOWgJ7Pt6i4xr4W1OnY54+CS4UQmr+/EjjKwCTNVZiVv13n/d3uz
	bknCs1VkMgPVFIG6Due8DrAD6mNRXEkV9dq7TMMEDWpT5rOSOVolM18DJo1X2MiF7b1WEKmh3PT
	sYW272BZEKTjmQ1AC1aTH++OHWphzKqpmJxZbZUivqvGLxYTGSwfXiaG0jhDhvuUv5cSNprjP42
	iKGoNZVm/yqRn7A142SkoPg77mi+lH6fcUxxn7BUQ3AB6m4iiYKI0Hax0cAzMLUMxVjoRVsL9QT
	gbSeJHFORzUOMf1xjkrr3fInVTufF6rka5qvFGttMicg7CdkttREylGuXADLC76H0YuyDWNEtP8
	giRhPmzNcKP2mNl8BwXtcK1MUYQ0tfbmAUkLr0xzDLmCZCiE+7p1qdUvhqUuQkqJhBNUIHvVhY0
	ZFxrGljpdocJdUIiQSOQpZjIbQbCekk5P3D45VbQFcdljuAR+Z8zvqdK7nJbQ2j04gQjQURTs=
X-Received: by 2002:a17:90b:4c02:b0:39d:f5b1:e365 with SMTP id 98e67ed59e1d1-3a073112c1cmr146819a91.25.1790057481645;
        Mon, 21 Sep 2026 23:11:21 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5a14a8sm1659901a91.11.2026.09.21.23.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:11:20 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:10:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Minas Harutyunyan <hminas@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [RFC PATCH 2/5] ata: libahci_platform: Adapt the return value
 changed for disabled blob
Message-ID: <arIbwfsrA3PlSWNW@inochi.infowork>
References: <20260922024724.191412-1-inochiama@gmail.com>
 <20260922024724.191412-3-inochiama@gmail.com>
 <f0db06a2-08e4-4013-96cb-c6754f673126@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0db06a2-08e4-4013-96cb-c6754f673126@kernel.org>

On Tue, Sep 22, 2026 at 12:23:54PM +0900, Damien Le Moal wrote:
> On 9/22/26 11:47, Inochi Amaoto wrote:
> > Check EOPNOTSUPP for disabled helper function as the change in phy core.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/ata/libahci_platform.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
> > index 6e072d681341..3e8ddbeb49b3 100644
> > --- a/drivers/ata/libahci_platform.c
> > +++ b/drivers/ata/libahci_platform.c
> > @@ -371,11 +371,11 @@ static int ahci_platform_get_phy(struct ahci_host_priv *hpriv, u32 port,
> >  
> >  	rc = PTR_ERR(hpriv->phys[port]);
> >  	switch (rc) {
> > -	case -ENOSYS:
> > +	case -EOPNOTSUPP:
> >  		/* No PHY support. Check if PHY is required. */
> >  		if (of_property_present(node, "phys")) {
> >  			dev_err(dev,
> > -				"couldn't get PHY in node %pOFn: ENOSYS\n",
> > +				"couldn't get PHY in node %pOFn: EOPNOTSUPP\n",
> 
> I do not see the point in printing an error code name. Instead, let's make the
> error message more sensible. Something like:
> 
> 	dev_err(dev, "Node %pOFn: PHY not supported\n", node);
> 
> Or
> 
> 	dev_err(dev, "PHY not supported on node %pOFn\n", node);
> 

Thanks, I will take this.

Regards,
Inochi

> >  				node);
> >  			break;
> >  		}
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research
