Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046C4405F7;
	Mon, 15 Jun 2026 02:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490710; cv=none; b=Std3Mkw/oNo6OIHielkcLtEkRrDUajwuzto6SYcypvLVcFEPM7Xzg0XmTjxMKFUEylVYva7foN7LR0+8XO3qy4RVc8t0x0I3srVBvJEeRgZtM/qbJ4tWTNruJtYX6S86FiuqXLN72w3m15kz+nF5ITIzIR9Sjyae5tVuaIkKuY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490710; c=relaxed/simple;
	bh=kygChXw1kAs5DVAzAaZ8fZtvD82Q9dUcTk91GV2dzGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hk2eEWRVSsZnloRV9jVBAexD+gKgIXVUfmy9J58e1FSyx4bfVhEcCPGvlR5HIZrhtUTug7Qq3lJpH/PGGDyZALYopIcJRjT0SmjT1v6/R7KEshyVfF1veWJ90OHmceYrAgOreFzeE7T6Ee+ExYk3BTPO8vJmu3Jb3ukOldwAv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IO841vT1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IO841vT1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E911F000E9;
	Mon, 15 Jun 2026 02:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781490709;
	bh=VXntCnozaVeoW3kK7/h+yvhpwz5a/x4a26EoPHDzrvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IO841vT1nMwNAPmzU1OF/0XlEAWlcX3/FNLkhjLpLr91PEOoZRxn2IIBaEfXfEcIl
	 oCFexOqKbPHG95ujWh2sYsEY3ukg7dK5Auh8eTrPH2UjSibQRb6GEODYXW5KH+Qj9c
	 q2fAjOM201qznkoEQ+YsgIs3ookeHThTpgd90O7Q=
Date: Mon, 15 Jun 2026 04:30:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neill Kapron <nkapron@google.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org,
	Paul Cercueil <paul@crapouillou.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 1/3] usb: gadget: f_fs: Initialize epfile->in early to
 fix endpoint direction checks
Message-ID: <2026061533-oval-buckle-b90e@gregkh>
References: <20260614181006.3648010-1-nkapron@google.com>
 <20260614181006.3648010-2-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614181006.3648010-2-nkapron@google.com>

On Sun, Jun 14, 2026 at 06:10:00PM +0000, Neill Kapron wrote:
> When parsing endpoint descriptors, ffs_data_got_descs() generates the
> eps_addrmap which contains the endpoint direction. However, epfile->in
> was previously only populated in ffs_func_eps_enable() which executes
> upon USB host connection. As a result, early userspace ioctls like
> FUNCTIONFS_DMABUF_ATTACH that run before the host connects would see
> epfile->in as 0, leading to incorrect DMA directions.
> 
> By moving the initialization to ffs_epfiles_create(), epfile->in is
> accurate before userspace opens the endpoint files.
> 
> Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
> Assisted-by: Antigravity:gemini-3.1-pro
> Signed-off-by: Neill Kapron <nkapron@google.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This should also go to stable, right?

thanks,

greg k-h
