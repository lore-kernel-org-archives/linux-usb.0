Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB28323BD05;
	Mon, 13 Apr 2026 07:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066016; cv=none; b=sOdK8PawhFrK1VNXroC4oSoBVZSXDQQlOCmhyccdx0lcJJN+YrLgV+1ZbungKj0NYrPD1xgbANITTQFI1On7TEkdP98QHEVY1zQyQNFKlBVOX1XEGA/W2jEJb7hmlk7Ia6f50jt/y9CpzHCHcUTYploc1p3gfGmv9j1RK8b+DaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066016; c=relaxed/simple;
	bh=r80UljLRQEs1CmWDnzaxpQ214rB39fhGhsJFc8CYhGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsgIHEbAtuCphesOPJcPLznX6xaih1BoHlttqyZQuZK2HdKJEiL/WQeaz4YdBkkcKkZMXyKGG9HjRVgXwwavHScZj2kgi4rdxpXHobv0oY8aKVxA5d8rfYKvyoEVZFZlP5EEnTPR3wqpnaTHTCz2ozyQrKtB2TEfImpuass8a+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dX7mPsGO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dX7mPsGO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EFDC116C6;
	Mon, 13 Apr 2026 07:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776066016;
	bh=r80UljLRQEs1CmWDnzaxpQ214rB39fhGhsJFc8CYhGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dX7mPsGOxD4TzvIF4FZqGlz4GHy3ZdQvaYF9NhJ3rH7HOy7BDA4/lVv5nKVsVk6kx
	 O3QTVZbXj4KZlnbWGS4STFwtcJexlZZtwMYT7FK3LQ14iV61Up6ZalUZv5gS87RNhR
	 2SNQeRn4Jepa9Zt4xZKqC+30XsMc0yjBj0YtyPtjPxRVG01JpPhT4pHEL5syUG/khm
	 84c7OTysAP5mfaqAAaplpF/pw5XJR16JKRisuvIi02qlXdU+mybZa2b5+klTBsEc1b
	 T34o3V7eaRnGpNe+i8BMENd3dn5ZINz7IOYnIXtxeaORq3BYAce/Mr14pCHuz2fKVA
	 0/E8nLW2KLaeg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wCBu1-00000000mj0-3Zd3;
	Mon, 13 Apr 2026 09:40:13 +0200
Date: Mon, 13 Apr 2026 09:40:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Ben Hoff <hoff.benjamin.k@gmail.com>,
	Yuhao Jiang <danisjiang@gmail.com>,
	William Wu <william.wu@rock-chips.com>,
	Terry Junge <linuxhid@cosmicgizmosystems.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	John Keeping <john@keeping.me.uk>, Lee Jones <lee@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_hid: fix device reference leak in
 hidg_alloc()
Message-ID: <adyd3Ud2Pl_KRl6_@hovoldconsulting.com>
References: <20260412161555.2568840-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412161555.2568840-1-lgs201920130244@gmail.com>

On Mon, Apr 13, 2026 at 12:15:55AM +0800, Guangshuo Li wrote:
> hidg_alloc() initializes hidg->dev with device_initialize() before
> calling dev_set_name(). If dev_set_name() fails, the function currently
> jumps to err_unlock and returns without calling put_device().
> 
> This leaves the device reference unbalanced and prevents hidg_release()
> from being called. Calling put_device() here is also safe, since
> hidg_release() only frees resources owned by hidg.

Good catch.

> Route the dev_set_name() failure path through err_put_device so the
> device reference is dropped properly.
> 
> Fixes: 944fe915d00d ("usb: gadget: f_hid: tidy error handling in hidg_alloc")

This isn't the commit that introduced the issue, though. This should be:

Fixes: 89ff3dfac604 ("usb: gadget: f_hid: fix f_hidg lifetime vs cdev")

With that fixed you can add my:

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
