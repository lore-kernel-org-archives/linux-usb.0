Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189067;
	b=RORco2S9nqDbELaQZ0zjuSroq2Kzw48D8Fu6n4smvcJJL8bwgvVGZC9Kfpi7xJdHQUSy
	 VG7jDvaZjA5yLdjhciDOVTQT+AGf4PNp1/2f3RJEOb+dDTM8950JFu2Ngh1gBBEucMZ4B
	 jIT0R3nIaIHEiIlk7hVZJ7QYSjwUq3+8/NY9JEnBajojiS8AcjPWYhxGi0SvvDdL8W9ZD
	 LTD9ES+vyB2obijswIkRgmH/PFdB9NFUcNeLVVtg5F/Eypc1Tatit7QeVsCUydbRMHyn/
	 xDi5m6q4bMd3+C546nOpZXY9m2LMMLPoZd5M+RnRyRlxwLx6LtPjUYqQFLyO5aaRtAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189067;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xy45wwBuD761BdoGt/tZ9V6D7TD6wlVEl66O2XrNLoY=;
	b=UMFszxrAFpq0JOR4BC5mxq7BgOidUuJ21Fpj0F2IN9MQkgkQBob99ot5w47KWOuXAcrU
	 Fhe5kb+gb2q90A1Qlw87xsSJO0GzPTGN1QKBsT4wZlhibLPcyNSJodb035/g5mHVvxjRL
	 40nmt8Y+AvA6HIapH8el1wKhoZNZSDMelxlceOn3dO12YAXc9DGUBLzM4t6I6dVyrU/MO
	 o/l97CUhAs9WcLP8pVMxTT8yA4vcUy8PAhiCxPvW/5g5+4FsFvzc0WPwrefJ7ZTqfMjE3
	 qgr0N0eJNG7ZWp9kJ9j5iUEcwEbK5jzzoTG2duZk99PZJSGHU1DhaU3y+KKcNrwLmNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eZvGGjcr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6BC606A335;
	Fri, 20 Nov 2026 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eZvGGjcr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A9C1F000D8;
	Fri, 20 Nov 2026 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795189066;
	bh=xy45wwBuD761BdoGt/tZ9V6D7TD6wlVEl66O2XrNLoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eZvGGjcrEEs35fXohmve/9t0KZDri/ZCYDxe7DcBkLooV0RbujAA36jbPNNPqRq4X
	 1aGE0iz3mqLp1udy5wWMQ2yp71b5ZXWohSWG+xThIMMB0xG9geRK7p8EIE6PI/iKud
	 nWmA3BHuJa3e5+hRoWoS0N/Tf+sNHnaxaUuY/kWE=
Date: Fri, 20 Nov 2026 16:37:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: pawell@cadence.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns2: allocate the trailing ZLP before queuing data
Message-ID: <2026112036-action-dreamlike-14f0@gregkh>
References: <20260913125235.110093-1-bolin.liu@seu.edu.cn>
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
In-Reply-To: <20260913125235.110093-1-bolin.liu@seu.edu.cn>

On Sun, Sep 13, 2026 at 08:52:35PM +0800, Slavin Liu wrote:
> A trailing ZLP allocation currently happens after the data request
> has been accepted. Allocate and check it first, before publishing the
> data request. Free the unqueued ZLP if data mapping fails. The ZLP has
> zero length, for which the mapping helper returns success without DMA
> mapping; its enqueue has no fallible mapping step on this baseline.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.

How was this tested?

