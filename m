Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE64F4A64C5
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 06:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057521; cv=none; b=XFi7maLRRWV2msysIafytjnBphKHZLap4ZFqwOfALx5L3iAOGglwNfu06wpiFNWRu21ZihzRNHHKQ6KGiowlQeiMpXOsmxDWWKMggcsT2HcpJQS0Dws/ltDQ6907+hN27KUoE22IREJITym/2tKi8bEkisUHsBLqRCfrel783Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057521; c=relaxed/simple;
	bh=E8YVM0lkb/F4gw1PQaH0+hECNdTEEr2VOF55Jy5TLIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9+3/5Dj2jNN2CwhRSL0ndHJKd2+jak1cZlKWrtWW6o4fdv0dzyhchDWXhAeGlc0UiHguwt9zXlz2TAGpvfcaIUV2oBb+4wstrGT0ycjyfSCY1g4IGRk25QuEQkqxvPb1+IFOIffWb4C+qvhGeD5GnMp0/TK1AGMrpuHNBEFs5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwDCT5uh; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwDCT5uh"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35611so2451882b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 23:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790057519; x=1790662319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KARpXPYlM2wZhUyrKSogeHTLUD5EXLXuvN4rvW+uIK8=;
        b=XwDCT5uhRQ7K14nuhlXtK+CQ2AqUDac+8WMSbMqe+SkXu1wBNlvnAHjU88ECcE5PKO
         6Wd+5lYk61vWgybtcS8FBCg4AxLq0by7j86V99XCCmQw6ctrdtmr2nSrkdcluSZoVYT8
         Bzqv/RjNZ34vgCXJUKcAbSrTT7mU7tKsb+YFpjOPhH7m2f/qczDzNiFgG4DWIzjGrry6
         30NAntTrCbHMh4XXNGTyXyUUA3eyu6qbGNLJusFpFn1KxcLvWJ6W9VMy2KBihfmE4Dsb
         xHx0BNljnBeYWiIfvFWthcyaXArCAp0DSu5bWZkjrfUpJZV3mjNvBqtXnsZhOFsPSmRa
         f7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057519; x=1790662319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KARpXPYlM2wZhUyrKSogeHTLUD5EXLXuvN4rvW+uIK8=;
        b=Bdq9nlzxGF3Nxp2jcfjNxGx7dFNEZbjcJg02czic700L/o2xMD/GaOWHcFJ+k1JEDG
         ngLg+4cZrkKtyxI94x1UXiX07ADzGYCYOcvFdxOYN8jQQhD7LxqtMkOSoG6AjDaBRFaD
         fIpnztltvnBA4Tb7tIT8NAotYNuJHVwF1spdI1/o8/PzaK6Kt349GZkjj0GgUS6fTgWE
         L611hufXdlD5hR/6h9lA7fVbhKarreQquQz1ZGmTHKPUXNbKclN8G/yyjw4U6D6KSQVu
         sumEeV6E9I0Ch2djPTY/48B7JFIEHfM+uN1A+WLh67HybEB/p9HzSnon/5sTvPOxGYJd
         Q4Lg==
X-Forwarded-Encrypted: i=1; AKwUvBwg9jAOQD1TmHSDJbIab+CQQMQiqJQtWfGocvUedG8CnME7eqvhOlip2EOZGEm/C/CHUIYtsYaq5s8=@vger.kernel.org
X-Gm-Message-State: AFuF++m1nXWfX4dXa+mbzlTVbznTu5YrPwrnWiSJl4qiwVsb/LTOIXyq
	9t02XHiHEvikz7gmCjpPzIQ9pOaKOFG/2bhU36q+S0yNrPvSlIQIXoMd
X-Gm-Gg: AYBFou3GBSsNq5pSfPanHXTvEC6+XnPOR8S+2uBUsswNEzckESlpEzTd0+fv8PDmTi6
	hFnTgDdBvbzDQbR3YJCN8X8tyMoT4VJiKyDp5jMiZSgDCsPTiy46rEUsMYE0nnFAob1y+cXt1na
	KAZY7PZzb3CIKH6XavzlLZxAEBNIeIfupK0yhs9AEqVDUe1iNZ/jqzvxuPOw+8XdHP7HqpX0mrt
	zZWPnlfgCjU4Se44uegp6OtXSAD3xGTXQ+Jt5m8b77Pc9c0kvMCX3k6AZEF7kNhlFWV/Qb+ZynZ
	bilRLkEMyB1Y6AWaHveT7NwJ4se400/v/zHgdBqCcTgoTSNPypgiL6+x2g1iJ254HqfNp6boFlS
	dQD7dK88wPye781kV1v4ehu4VaaiEB/iTsTRmcFnSIoVO2jh2sZuou9QRJFmUFGTWhZyzoKVI7d
	2n9VFuLvnUnojS6cVA+HXGK7TnNFoiZBrcjpQ9FrfZU/q/kpGUOsGU3z7rYJ1e9y6DhBuL
X-Received: by 2002:a05:6a00:844:b0:879:1046:f4a2 with SMTP id d2e1a72fcca58-87c83c49a03mr112992b3a.33.1790057519137;
        Mon, 21 Sep 2026 23:11:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c31ee8a96sm317135b3a.20.2026.09.21.23.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:11:58 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:11:06 +0800
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
Subject: Re: [RFC PATCH 4/5] usb: dwc3: core: Adapt the return value changed
 for disabled blob
Message-ID: <arIb22v8tjUBpGEn@inochi.infowork>
References: <20260922024724.191412-1-inochiama@gmail.com>
 <20260922024724.191412-5-inochiama@gmail.com>
 <2026092202-armband-avatar-0dd7@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026092202-armband-avatar-0dd7@gregkh>

On Tue, Sep 22, 2026 at 07:34:31AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Sep 22, 2026 at 10:47:19AM +0800, Inochi Amaoto wrote:
> > Check EOPNOTSUPP for disabled helper function as the change in phy core.
> 
> That says what, but not why.  And what "as the change" specifically?  Be
> verbose please.
> 
> thanks,
> 
> greg k-h

Thanks for this reminder, I will express this verbosely in the
next version.

Regards,
Inochi
