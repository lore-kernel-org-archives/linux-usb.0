Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623A94A5EDB
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 06:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057456; cv=none; b=kQaxW64mXWEOdi2VuMQFnX3lMDNigZKDbugAjUU1PoK39MYLb7ewu+b6rab18wv3t3CUzlw440d6dTCG7Lp3ATx+KQU5O+oAeGA5e1A0FElnmszIT6N/6Hk+WHabIkcV7S1Np92hjh+3gxJNXrXr1YQRSUeT37WgfxdmhYRmscs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057456; c=relaxed/simple;
	bh=RokqHc4jdSnvvIpwNsLlY1MRsxLWarU0I9dgjhB3t0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VijrzNFIK7aMpwxnHUAc/OW0PVb08Z0QH4r9Jdla64ORmZl4d1p74o7USCUj4BlWEt/8Ww8brUk2/yrCa2GGKcnjhinfohce/D8bCMz07Z7rF2MB/Wnjsu2sFMhj+D5ZpTPvlOT78hjwAzS949rl9PEidrqgZepyiNB9Dbk/lLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw4TqhG1; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw4TqhG1"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso3123431a12.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 23:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790057455; x=1790662255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=918Ed3YoBXTCboO/8XC40Sz5nROxBXuKCN2wfNcGPBs=;
        b=Yw4TqhG1YshOHpQsEDiGCM458s4+hM6rWQmwwWTGJNiI2FqlFQH1Hl6BAhRB1uo9nh
         gqRyv4UqT6d2e1lVOMqpuXy2glL1vR8wXUIPLpDn7s5ZY/Kk8Ydp+OGq3j9XWGXk9gxB
         rdJ3sLqTVZFVZFZSuSSnezwyGGSOSxKtidrXAjBXSHioFahyWZlzDyPpxdrJnW6+C0Vp
         hSt2WmnvlfrREXYVTH2KgqOHbNy113zhaf/Xw9sGgLcMhKheFCBLilnsWX2DsvkVyO0/
         E4jEDE5jKEUOQUGRI7o871ap0SRysc5TkIpgNLx/qNozjWbJCyU9Ia6SIrWYyMC0Lwaz
         eplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057455; x=1790662255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=918Ed3YoBXTCboO/8XC40Sz5nROxBXuKCN2wfNcGPBs=;
        b=vGX8lgHG/BsjiYmMuh9sMIZMANtclz9YpJ4gt6BeCA/5jQfgx1JW7L97JH7195zKsy
         zs8OO/x51/cvaur25C2AWGuDMV05X9EFR0e5CMphD1jqRsTIM/GZRuu+FQ2evzLSIB0P
         2mjg1iBXkcI7MkH04YswUSSlNYax2uOYEEzNs9ZIeuzv+iwKco1CxcoKba5cYWtR3lFd
         FGW7rUTEHRo2xwMTKi4P8OkR3xsbYSVWyWqGNrp9ZeIiGCLftx/vjYMaKcCzdqM38vr8
         IyTyJhCDw9SLmrW6VrROzbd52/65mzQwttMJ2mMgiQvAXeVBnYapCQcmInUapRd80p7w
         J2PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrGaMUWWom0S03cjddN9XNXR1XniKIkLrY1UognpWxsCotSra15EoXTjAY0Xgn+olWb9nS/mPK094=@vger.kernel.org
X-Gm-Message-State: AFuF++liblmUi9C+X4BrVRF3huG0UcotvXTnz84MUAc9ctk0IxBWDj2W
	N9mz/v3vJIJs2pX4/HyiHGkD5g05YfFGUi3nUZMMfP7o0QEsgsDl+tmP
X-Gm-Gg: AYBFou18v7mxespvBFlH/WdYIOL5vtQm5p9wSSgw39f4d5zbS1qElEjj5BBFIZXJyin
	yQvkc/B+fbeV3YNotoAkO7BchQqlJycEUsjBsSufazokycdLC7Z/Bcm3hFbL0/qheRWMn8PcISj
	miQt+pKU9zGaoix8ExD9Dl2ra6uE7rTxMDr4harNauqQUA78H5R6PRnBNNhr2oFOvLArHohWFsK
	RTpw+Bze8EWd4Y/BuG69l5NCYO0VMHKmfvd8kgHUos7Nkwze18iuHoiN67yCzCNAgC6J0VDeRo6
	BpXhGRSVlumVcY4EG7P9s4RRyiJGVjm9SS0rpIfg+xnIH811y7YMhl4Z3fUkO4PStD9vtj8AsLM
	Wn0msXE6TqonBEe9zl3XqB+LYYXuko/Esp2DvXFuBzBy9xxwjDfs5dyfirX43+zdUTi0eTDKsm3
	8pMF5IUyTv9zWwVr+MpawZrJzmnkGfcgJB2oFD+A4B0ob2C/1ABmNjZj0AtmmPZ+jbrXyLD80=
X-Received: by 2002:a17:90b:5105:b0:39d:f731:e5f3 with SMTP id 98e67ed59e1d1-3a073116712mr140073a91.24.1790057454636;
        Mon, 21 Sep 2026 23:10:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5a5eb4sm1489775a91.14.2026.09.21.23.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:10:54 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:10:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Minas Harutyunyan <hminas@synopsys.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Heiko Stuebner <heiko@sntech.de>, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [RFC PATCH 1/5] phy: core: Use EOPNOTSUPP for disabled blob
 return value
Message-ID: <arIZX-0aMQiabxJd@inochi.infowork>
References: <20260922024724.191412-1-inochiama@gmail.com>
 <20260922024724.191412-2-inochiama@gmail.com>
 <2026092256-shading-gratify-835a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026092256-shading-gratify-835a@gregkh>

On Tue, Sep 22, 2026 at 07:35:19AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Sep 22, 2026 at 10:47:16AM +0800, Inochi Amaoto wrote:
> > Currently, the phy subsystem uses ENOSYS for dummy blob functions,
> > it does not reflect the function state correctly. As kernel already
> > has EOPNOTSUPP for disabled blob function, replace ENOSYS with
> > EOPNOTSUPP for a clear return value.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  include/linux/phy/phy.h | 52 ++++++++++++++++++++---------------------
> >  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> Based on the other patches in this series, this patch now breaks the
> users, right?  Shouldn't this all happen at once?
> 
> thanks,
> 
> greg k-h

It will break, and the change should happen at one. But I think
the affect should be limited as it only affect a special edge
case: build kernel with CONFIG_GENERIC_PHY disabled. So the
break should be limited.

IIRC I was told to seperate the patch into small part so each
maintainer can take its own. Is it fine to squash these patches
into one in this a case?

Regards,
Inochi



