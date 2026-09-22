Received: from mail-pj2-f28.google.com (mail-pj2-f28.google.com [74.125.227.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6543F4DD2
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 06:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059052; cv=none; b=fD2FrEpCX9mX4RaBw/c6k6/td50dB9dh+c8sFBlBl9bR/SEDgoc79rO7V2CxmDmcOM29JUpHGnlEHkP93d+QSj+p800wz3F7SMTT+EOR/znayJNNzV40ZgzqgfBCS5XH5dwFqLl5lzXR4FYvLafo7wZ8c/BrV9d2GvwTVkpJKgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059052; c=relaxed/simple;
	bh=DlLZxgsK+4BtX0eYonfjqsFihBpE0nXTuN2N7ggKKkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErVEdNh2R9JGoEedsMzosnUNxs3g4sAV5jx1Z7EXJG/mDKiJ10fL7GQP2rVBpNd32ZGyGzCEA2cW6JX5zQ34EHoRIPOvd/pe4ISm6z3ZKm2wqkoJHS4jC4AjILbW7DbwQJpG7mdx0zUtP9uch36rw4g9iQX1h+TD3kU5QEaEyBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2o6VL3J; arc=none smtp.client-ip=74.125.227.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2o6VL3J"
Received: by mail-pj2-f28.google.com with SMTP id d9443c01a7336-2d91c22d27dso22200455ad.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 23:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790059051; x=1790663851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cEZ6qIPBqK0kKyvC4PAdXp1jfvwWUdlhUlYS77zPoh4=;
        b=s2o6VL3JokcFfaOxdsZXyJno5sMpKy7jVGgaYxm/c3mjNei6wRtcfr+xHvYQDzaVuc
         ZlZ9Jg5NjE+DQSaLo7WadxkKNhXfLHYN4O3WLcC9SjcvoBe3MBOGqIqkHKj6jCfIhYmu
         P8GbwtDyfVYDZ8S5AaKkUAAgFke52cgzpgDY6RvDPQNDIewafBqwm40VSf5aVqjsXtDs
         F/qHyTKtFgup/Cmn8SFjk8wLXfJcceCO0kHN3o53GbuijaQIYTXuDRUatkxRsI9kkeBE
         aT3321vl4TvpKaA7E1dh2WalSrKIcOtpUQNRzQA4XaTR6IHKoZNZORzSuwXsHa4tWl9s
         yHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790059051; x=1790663851;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEZ6qIPBqK0kKyvC4PAdXp1jfvwWUdlhUlYS77zPoh4=;
        b=W6ISfHuDI9TdHI+Ybs8u5TNAzNIVpKK88wTglybKhKr/ahhOm62RQ3d9vx4rPleQhm
         b0LltnPnM/gTq5/X5UgFIKrmYKL3TRHrphGRDDwG6LraDSDCJV1BQUJy3PgQ89AOdplP
         d3tC106vHcmCgVYls64o36qtrMGACX4Fe2qBpvFFh1cGpdPUmiQzR65gmcxZo6JdAZ5Y
         3Eg3M9NzxfU6N2mkin1675uXqtIA+wbjxLlWxjg65GfguUDY5dboSsuCRL/RQmYDxxeo
         nN/tHebje+nNNcJyfevRFPGeQj5FGlnjmzBi2EgTvhRLdzcXAGZZ3XiJ/Z3e8aNuGC28
         950A==
X-Forwarded-Encrypted: i=1; AKwUvBy0gMIV220EJ0ZoeLpADwchsS8g1OZ6MQfgfRUe0UhOIietRTOfczLf8VnEiVN8mlWIKcoYayFDFRg=@vger.kernel.org
X-Gm-Message-State: AFuF++l7zU8UZcEWhJn8/7+b8z89clvbKHZzXcam7oXzik8m8PMKdwSB
	oLfk15TMCwzUqDNV6itwZKsHn3gPKrl4SPCza3pellPdq1WAmCHtjxmt
X-Gm-Gg: AYBFou0AQH/HH648zuEs2QBoL7tUsncPb9n+E0rUdSGJEnXuSO5xp90D8vtJfu0fDH5
	G//HAh6f0JFRQKVsZcCIOIvJb0ORPYDIckqbNv/Ouaft0+FjXIZQZzs+jjrGD3neVSsIGOyacmn
	4NAwTK3Csf58xstscupbHRHB5MWIzZ/gaPnY+JT2aTLwKVAmO6H5I9hDJg5WNo/cOAC2K5GgQBx
	nIauUpnJ01nkqiC2CCjZX7jv1BvwpaSOpZY+IGJcfqEahcq0KKg3IJBuG0+kZxcjzLKvk5P30Zh
	aZClZpSeJRVNPtbJ2CNMaBK1uI9NvPPYuNibsbic53RGAGzC61cLHwdsFC8pRFiEdGC9JYCLfMG
	mMEr/94lH0pxIcn8ab4K63G549baZdhwRlxbZ3zENgqeDPRw7pm7AK91aSEL49JBW/2g5dnwmjM
	ggg7737eFLOgdmSAVlVC/Bb29da8HCMxox/B8K7eNizRl81Tq6NrbrCujJkpMrdkFwZfQ+
X-Received: by 2002:a17:903:ad0:b0:2d8:d4d3:3fbb with SMTP id d9443c01a7336-2df609d1990mr2155125ad.15.1790059050558;
        Mon, 21 Sep 2026 23:37:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d056911sm4297115ad.70.2026.09.21.23.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:37:30 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:36:37 +0800
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
Message-ID: <arIgfDh6ZSHNgbhB@inochi.infowork>
References: <20260922024724.191412-1-inochiama@gmail.com>
 <20260922024724.191412-2-inochiama@gmail.com>
 <2026092256-shading-gratify-835a@gregkh>
 <arIZX-0aMQiabxJd@inochi.infowork>
 <2026092236-breeze-educator-0f6b@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026092236-breeze-educator-0f6b@gregkh>

On Tue, Sep 22, 2026 at 08:16:16AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Sep 22, 2026 at 02:10:01PM +0800, Inochi Amaoto wrote:
> > On Tue, Sep 22, 2026 at 07:35:19AM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Sep 22, 2026 at 10:47:16AM +0800, Inochi Amaoto wrote:
> > > > Currently, the phy subsystem uses ENOSYS for dummy blob functions,
> > > > it does not reflect the function state correctly. As kernel already
> > > > has EOPNOTSUPP for disabled blob function, replace ENOSYS with
> > > > EOPNOTSUPP for a clear return value.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  include/linux/phy/phy.h | 52 ++++++++++++++++++++---------------------
> > > >  1 file changed, 26 insertions(+), 26 deletions(-)
> > > 
> > > Based on the other patches in this series, this patch now breaks the
> > > users, right?  Shouldn't this all happen at once?
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > It will break, and the change should happen at one. But I think
> > the affect should be limited as it only affect a special edge
> > case: build kernel with CONFIG_GENERIC_PHY disabled. So the
> > break should be limited.
> > 
> > IIRC I was told to seperate the patch into small part so each
> > maintainer can take its own. Is it fine to squash these patches
> > into one in this a case?
> 
> You can't break bisection of the tree, so if it all has to happen in one
> commit, that's required.
> 

Good to know, I will squash them.

> But really, why is this needed at all?  Who will benefit from this
> change?
> 

This change make the phy subsystem aligned with other subsystem like 
clk, reset... they both use -EOPNOTSUPP. After checking the comment 
in errno.h. I think this is more clear to provide the information 
about unsupported function.

The related discussion is at 
https://lore.kernel.org/linux-phy/20260907114837.2y55l7dfqqrgcka2@skbuf/
After some discussion, Vladimir think it is possible to go, so I
send this patch as an improvement.

Regards,
Inochi
