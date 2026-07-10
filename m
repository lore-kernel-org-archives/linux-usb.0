Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7930624336D;
	Fri, 10 Jul 2026 05:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783661086; cv=none; b=PwfnBtpv+W/QJlYLvx6lbNogepy5B5A9L6jFHtnSJ7JmFhWvks+8hUcVH2j908342mOWco0dF/IPKLi4/sWwnd3jPtsX3NnbUyt7e8+MgWkmwcSt/Jxif4No1SJYTM228dQJh108ay3YQu0ZAztOEpEX4tQNA9bMmjhD1u6BqI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783661086; c=relaxed/simple;
	bh=Tl3QGpTZartOpRFvXcsn65Dw6UHDPVdAK1NBLvsfdLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyuTLYQECEsHCsK5/xhQI0AqM/dADd10r+G5slbREmQxnsEX5bc0II0YD//dP0uNaTyk06RCw1PygNCF8qrgUNJ8U55E7XQ4BtXHzF/iJz4Ihyn4zEnXhym/lbhPCZXIlKCDYgD9k+MqDOGdUC+a4A/lDwAAD1cZOsMBocPlPb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PD2ofJmi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PD2ofJmi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF811F000E9;
	Fri, 10 Jul 2026 05:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783661085;
	bh=NPwBNBdJebICU/Jg8KXyl4FmWm5Y7nZfaMZ01Cev2+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PD2ofJmitq/QApXWsi9MmpH5T88Gms8BqDCRw0gUUsk15RS80AnBLFDFGbw46wqeL
	 SbjXqsivbTWhBoHZYtUJr10FzEuZGbBqy5qg0/biua/dEdBxRXixaZ3uNL/5Vbvvay
	 nSjj/QXP6ike1sywWZqyrmSM4+BjKwoS1PW8iuyg=
Date: Fri, 10 Jul 2026 07:24:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [usb:usb-testing 23/28] tcpm.c:undefined reference to `__udivdi3'
Message-ID: <2026071026-unquote-citric-ccb0@gregkh>
References: <202607092212.lINETdSF-lkp@intel.com>
 <d0fcf5d4-ed39-42cb-925b-47f72c67f49b@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0fcf5d4-ed39-42cb-925b-47f72c67f49b@google.com>

On Thu, Jul 09, 2026 at 03:13:10PM -0700, Amit Sunil Dhamne wrote:
> Hi Greg,
> 
> On 7/9/26 7:17 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > head:   472ce6621e371aafc03c0704d1d940f51d8159db
> > commit: b3c9b6925ca2e02ef2fd77d0aa5e0ca6b2a67f5a [23/28] usb: typec: tcpm: Add support for Battery Status response message
> > config: i386-buildonly-randconfig-005 (https://download.01.org/0day-ci/archive/20260709/202607092212.lINETdSF-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092212.lINETdSF-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607092212.lINETdSF-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     ld: drivers/usb/typec/tcpm/tcpm.o: in function `tcpm_pd_send_batt_status.constprop.0':
> > > > tcpm.c:(.text+0x6743): undefined reference to `__udivdi3'
> > > > ld: tcpm.c:(.text+0x6764): undefined reference to `__udivdi3'
> 
> W=1 build fails in 32 bit architectures as I have directly used "/" operator
> for division in my patch instead of the kernel helpers. I have a fix for
> this. I will send a new revision for the original series [1], hope that's
> okay?
> 
> 
> [1] https://lore.kernel.org/all/20260701-batt-status-v4-0-a31d97b1ae57@google.com/

Yes please, I'll drop the current series and wait for a new one.

thanks,

greg k-h
