Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A67133C187;
	Fri, 27 Mar 2026 02:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774579983; cv=none; b=rqBh6pGXQ6UyQoCQyH7QYfRJ1vxgxkxuJy9dWuOyZTb0eaxxdl+zsRDE2pIZVg/94lV+P/ZaCzEBQThDv9heDKI7xfwMx6TvXT2G0hRazRgU3lLIYhIp56U0HQcIn6rO3y6jlSAabzuSIAR5Lu/oYVKnlR6+7nnpTdNEXdxUh4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774579983; c=relaxed/simple;
	bh=9Gm0h2I4XBohDWuXDCNOcBA6Edwdde7TG1q92CZfBKY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C15/isNSB/3ZZ9g7Pm+XpFMCJV3dcECCqqPcw3Z91yv0jn/mTYygz9CYbUapxu/jb3bH0CUwLTKepa4kZL1EDZBKy3DURAhtHMtyfq4KJK+YFKDZh90xrM0OV27ShAUd8yxGfw6isBW6PFnQY5PisczYHVw6DcFUm9UTtSHHo4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: S17c/odGTAaIByKdhKfwWw==
X-CSE-MsgGUID: wHrv/UYNSsu+iZLDe/Ogvg==
X-IronPort-AV: E=Sophos;i="6.23,143,1770566400"; 
   d="scan'208";a="144767818"
Date: Fri, 27 Mar 2026 10:52:58 +0800
From: Dayu Jiang <jiangdayu@xiaomi.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Kuen-Han Tsai <khtsai@google.com>, David Brownell
	<dbrownell@users.sourceforge.net>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: u_ether: Fix race between gether_disconnect
 and eth_stop
Message-ID: <acXxCu5/8jcl0bMH@oa-jiangdayu.localdomain>
References: <20260311-gether-disconnect-npe-v1-1-454966adf7c7@google.com>
 <acTl6bUJTQp6kjCO@oa-jiangdayu.localdomain>
 <2026032614-most-opposing-4363@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026032614-most-opposing-4363@gregkh>
X-ClientProxiedBy: BJ-MBX02.mioffice.cn (10.237.8.122) To BJ-MBX03.mioffice.cn
 (10.237.8.123)

On Thu, Mar 26, 2026 at 11:35:31AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Mar 26, 2026 at 03:53:13PM +0800, Dayu Jiang wrote:
> > On Wed, Mar 11, 2026 at 05:12:15PM +0800, Kuen-Han Tsai wrote:
> > > A race condition between gether_disconnect() and eth_stop() leads to a
> > > NULL pointer dereference. Specifically, if eth_stop() is triggered
> > > concurrently while gether_disconnect() is tearing down the endpoints,
> > > eth_stop() attempts to access the cleared endpoint descriptor, causing
> > > the following NPE:
> > > 
> > >   Unable to handle kernel NULL pointer dereference
> > >   Call trace:
> > >    __dwc3_gadget_ep_enable+0x60/0x788
> > >    dwc3_gadget_ep_enable+0x70/0xe4
> > >    usb_ep_enable+0x60/0x15c
> > >    eth_stop+0xb8/0x108
> > > 
> > > Because eth_stop() crashes while holding the dev->lock, the thread
> > > running gether_disconnect() fails to acquire the same lock and spins
> > > forever, resulting in a hardlockup:
> > > 
> > >   Core - Debugging Information for Hardlockup core(7)
> > >   Call trace:
> > >    queued_spin_lock_slowpath+0x94/0x488
> > >    _raw_spin_lock+0x64/0x6c
> > >    gether_disconnect+0x19c/0x1e8
> > >    ncm_set_alt+0x68/0x1a0
> > >    composite_setup+0x6a0/0xc50
> > >
> > Hi Greg,
> > Hit the same issue during NCM switch stress test.
> > Can you take a look at this patch and check if it¡¯s ready for merge?
> 
> This is already in my tree and in linux-next and will go to Linus this
> weekend.
Got it. Sorry for the multiple copies of the same email¡ªour mail server had some issues and sent them repeatedly. My apologies for the noise.
>
> thanks,
> 
> greg k-h
