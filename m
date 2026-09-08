Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AE055C32C
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880774; cv=none; b=AAnKo921rQ6g1usMPrv6lz8m3IkeqCAOxoZWLw9xIyAEGa1sUKJ5Mv+DE692lYolPBAhg1IF+1jSo/scVeDtDmM5/rAJUPMqvaRhkLifgt2klla2icnxszxDucHMmHKq+dXtpyfeRc+wHPqSbDQDr5SnLU1vqa4bZu+lzmfthd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880774; c=relaxed/simple;
	bh=2E2paIhVSecgEqjIXBb7PZzzAn2OOgH65j7qNTEeMiY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSJ8wUjfWVCnLZiu0FjAHOXv7oMS6bMvPsA+DaA1zHELuDMihX3GzHy9/ENfPsq1KYH3q9P8jl4saOoBskWcUhYJMLoZqTXOh5jTrVmpeCUT6wgZ0iYiMvtKmgP7S21mcGXKX8zjF3w3DOaEAxbuijicPJEl/h3cooN/im3dS0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFBxOYKB; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFBxOYKB"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66f984b263cso1305409d50.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788880761; x=1789485561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhdCOmP4zDl1C4qG/vDZ2J5jFE+DMqbe+H/tbxij/K4=;
        b=CFBxOYKB3iRfvLbButzgKpzs1fOoQywfEeAYQVEyRRu0uRJHy9btNUKKy6vQ/FYDlf
         KY0X7JPm+TPmkMLm4oXmTnri693RhMPrR+MSsie4WAgAzLJFtcMZDR645ARELlf/eONu
         b1LQbzBGi6u7leRHYiZ0Mi03+3C7Hl66lYz9s785Dzu9oY1HWjaDlhkD72A6cZT7bs7o
         m7vF/XYi6N13hl8kkbL4m/R2/bKZ/szzUFGIFPXWDHA25l33JiiaDHCLkn2zT6oIYTBn
         DdepwaZ50w2KKo33Enz1rdxsF6J1VJULQol2YAhDOzoIQkjPKq8QfOr5xDCnET0ENzst
         MwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880761; x=1789485561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhdCOmP4zDl1C4qG/vDZ2J5jFE+DMqbe+H/tbxij/K4=;
        b=WG6hhBWw+F6f3/WJAPkhewILcmgUcsSPevWWHaKd7xstl4YsFyjorN/qN2tm5hzgop
         RJYPB39CfzENruql8G4C6Mm/ppK3vAKiKflquD2dkaYQs/7fWTIwGEeZp8w7qHoh1rN+
         scfB467tnoKdvoZAc/ZTQ9R0wpighBbLLLA+zFtD4teF1f2rm/APHo+mBpr4bDH9Dh8Y
         z4IdjooDdK5ws1ZYQvbQxaq+TSEMCf+d9kg6HYGQXap41O9VAHIAT4NnQrmlJInWBJpw
         UiQzyPge57oVCxa6jrgw1JbbgtMSQBXJ4e+/5wm7vz4KoSLk277BIM5X2hteIOaA+cfv
         vg1g==
X-Forwarded-Encrypted: i=1; AKwUvBxJQK+/OdDjLDboejYundZG99DJ3hKF/5h3YxgDXou3rjeYGlDtWE4HDN3aLongGPGYdB1nDJi0U4A=@vger.kernel.org
X-Gm-Message-State: AFuF++nxdCE+6qHNHw/28EWLv9OgAW2rMRe8mpDJE6AGAt5p/eLh68Es
	+Uf+XVYTKwLmLUU4EgfZZZzJuKIDnH2LqakQncJMX5XMDHrcPs1aeHaU
X-Gm-Gg: AYBFou0WgfZazQbbXPZUOjjFizx9qW37LXIFRfFn91aJAgtmMUZ+x/4qFmE2mRhREY8
	RglDwYEzV3z95GWQSj9u7ubd1wy6x0J4kEkZozjY8iKptXBNCnvZyS/Z7oFADWulLpYGtpvamsB
	8A/sW+Aqk4UeZjZbRGsThvku1zf0gGgql6R+SgOGOWgfF3QpSi+L80de6pf7Bj+3IaP36m2WbQR
	SR1plkhClUUE3ccdj7APDSaPt4npKek7pmaIfZXIdoNl2fpO2DYBxkVqfwFLHgUcTIA3UdtF55O
	miimV5jx4Dg08gdA45qsr3qHEK4IQSOt5VwkbHRx8oOETPMiouLWvdn1Ma4E6dbULvu8ah89y0S
	gnzyAC5MXtk6rb4S5YZyzPLcdIN0+irTPP/nciUb0RJBa+hitBH7FLID5E/wSl1NIcaTx5rAp5S
	mZCKJLbXIWKeks+bAndEj7u0cihqGY7zdXjootAqJ5toi9JxI2tbLzudZ8HWVjWySUMPezzj9ou
	V3eVWOIJ0LxJ7QYBA==
X-Received: by 2002:a05:690e:4893:10b0:66f:c6b0:e10b with SMTP id 956f58d0204a3-670f63fcd8fmr2064936d50.68.1788880760843;
        Tue, 08 Sep 2026 08:19:20 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-670febedc44sm1035024d50.11.2026.09.08.08.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:19:19 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Tue, 8 Sep 2026 11:19:19 -0400
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yury Norov <yury.norov@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-usb@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 7/9] net: phy: use linkmode operation return values in
 phy_device.c
Message-ID: <aqAnd1gpXne2lqCT@yury>
References: <20260907215439.409858-1-ynorov@nvidia.com>
 <20260907215439.409858-8-ynorov@nvidia.com>
 <67ed1522-cec8-4137-85df-ffbae654e07c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ed1522-cec8-4137-85df-ffbae654e07c@lunn.ch>

On Tue, Sep 08, 2026 at 03:52:09PM +0200, Andrew Lunn wrote:
> > -	linkmode_and(sfp_support, port->supported, caps->link_modes);
> > -	if (linkmode_empty(sfp_support)) {
> > +	if (!linkmode_and(sfp_support, port->supported, caps->link_modes)) {
> >  		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted, no common linkmode\n");
> 
> From a readability perspective, i like linkmode_empty(). It is more
> obvious than !linkmode_and().

OK, a function returning 2 values is not something obvious in C. What
about this?

        
	sfp_supported = linkmode_and(sfp_support, port->supported, caps->link_modes);
        if (!sfp_supported)
		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted, no common linkmode\n");

> None of this code is in the hot path. So we should put readability
> above performance. 
> 
> >  	/* Some PHYs may advertise, by default, not support EEE modes. So,
> >  	 * we need to clean them. In addition remove all disabled EEE modes.
> >  	 */
> > -	linkmode_and(phydev->advertising_eee, phydev->supported_eee,
> > -		     phydev->advertising_eee);
> > -	linkmode_andnot(phydev->advertising_eee, phydev->advertising_eee,
> > -			phydev->eee_disabled_modes);
> > -
> >  	/* There is no "enabled" flag. If PHY is advertising, assume it is
> >  	 * kind of enabled.
> >  	 */
> > -	phydev->eee_cfg.eee_enabled = !linkmode_empty(phydev->advertising_eee);
> > +	phydev->eee_cfg.eee_enabled =
> > +		linkmode_and_andnot(phydev->advertising_eee,
> > +				    phydev->advertising_eee,
> > +				    phydev->supported_eee,
> > +				    phydev->eee_disabled_modes);
> 
> So, which is more readable, the original or this?

The new version is more readable to me. What about this:
        
        eee_advertised = linkmode_and_andnot(phydev->advertising_eee,
	                                     phydev->advertising_eee,
                                             phydev->supported_eee,
		                             phydev->eee_disabled_modes);

  	/* There is no "enabled" flag. If PHY is advertising, assume it is
  	 * kind of enabled.
  	 */
	phydev->eee_cfg.eee_enabled = eee_advertised;

Thanks,
Yury
