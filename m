Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7613D3CAE7F;
	Mon,  8 Jun 2026 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927825; cv=none; b=H8XRZp71zTtMdV0d7qnE6MULfv2+bpofgdlDO2qCtTRNoj2CwCnpPtgmcO3NMnQxgUryccoyEBDIqa+8vN6Q6of0FJRq7psDQkEkBrKrzxc3p4Rq1tBAixLd0A8x36xjEeTjiecLbIM72njlSBP2Eznlan+TrCRXuAvSnnmpk0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927825; c=relaxed/simple;
	bh=lTUu7HGfnC7R1/traxNe+Ix0nMvr2qd1+8US+2NsCao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xq3bTIN7BYdWPGQwFB5bKgJTYD2h/WVfFyLJJSjxsh74Nt8SWA4/NwXfws9KozlZZEJC1eUiDaGC03SC7hXXIl40U8OpbS0h5OZiqna/5ZVNIyxrL8H5I4TDKQPAOnwupnPDGnUzcJJKGvSSLhEKuFTeF2E2rpAlvPLALma/qEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHMMG4B+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHMMG4B+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD0C1F00899;
	Mon,  8 Jun 2026 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927824;
	bh=MQCqy2xtR2f7AYyGEM8OVMCx0H/VD27gge8maaKR68w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HHMMG4B+AiYQATE6m6tZIoNOhNi1OJLrHric6e4hGGPqYnzpdRUxo8OtT6usW4lyk
	 x1qQM7LCB1fwt8NLcovHIc0PXOdmz8+09/mF+a0YZ3r/AHj/nnTSZGQ8yIdOOnrnaV
	 wUdMI/oo7lnl4zhFJB3tAdmCUPo2e0Tn7ATm8pQlhoRbQGpaM6a5q5F05fxkeG2tSH
	 fClcQG7Lck4DqKCsnYlfg34R2bYX5yaywK3kep46VrIa+2nOqclrIH54brc74vGgnk
	 S+Wxy/Fz5DBN/2rVZw7qYAC9iCi40BfzzYo+tbvcWZZUxNRExrJiwKDKcVe8foYsOe
	 IlRTUmgFOHYUQ==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wWagH-00000000DEF-3flj;
	Mon, 08 Jun 2026 16:10:21 +0200
Date: Mon, 8 Jun 2026 16:10:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Shuangpeng <shuangpeng.kernel@gmail.com>, keithp@keithp.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-use-after-free in dev_driver_string from
 chaoskey_release
Message-ID: <aibNTeX696gw0xs1@hovoldconsulting.com>
References: <20EC9664-054E-438B-B411-2145D347F97B@gmail.com>
 <257eb882-44dc-4e25-82f9-9cf9b455936d@rowland.harvard.edu>
 <2a50158f-34ff-41ae-8899-ba2ec6d550b3@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a50158f-34ff-41ae-8899-ba2ec6d550b3@suse.com>

On Mon, Jun 08, 2026 at 01:24:03PM +0200, Oliver Neukum wrote:
> On 07.06.26 04:29, Alan Stern wrote:
>   
> > The simple explanation is that the chaoskey_release() routine contains
> > debugging statements that reference an interface for the USB device even
> > after that data structure may have been deallocated.  Since they are
> > merely debugging statements, the simplest solution to the problem is to
> > get rid of them.
> > 
> > That's what the patch below does.  You can try it out and see if it
> > works.

> correct but it misses the same issue in disconnect.
> You need this one on top.

No, it's perfectly fine to access the interface in the disconnect
callback.

It's only after disconnect() returns that you need an extra reference.

Johan
