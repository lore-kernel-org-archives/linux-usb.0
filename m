Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5F4086A;
	Wed, 28 Jan 2026 08:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590582; cv=none; b=iH6TrDzRH5q7vJgq2XS2JtK1/iGKeHy7CdAqPxNpOGEx8Je8T/Wtgf2dz2KzLz4fBf1O89tRgnKmsLXUvDs5+24rX8SNYy8psNNnVOFkC0mP9s8z40fXdS037/HCbhMNoIcSGfBisdRO+raCXb8qBvmTgk6G2boTsHkB8k8Amk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590582; c=relaxed/simple;
	bh=GWyCmUt+R4JArRQYceZDS1fFYiZJd/juPN0plXPMWVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSbdvPRWlCLNmV3/eQPgcXbFQ2np+TRbIpHSw0Yob4vYPQsHwGn+rNY/zufFXPy9XQovDysKmLiZJfvWexeB4v0Ml2MZrRHHmlHVwekZ6Zym/0Ccm7JJSzXGQoE/RwchhuHkGMMMv+ioaZvmm0PCAPArEinn9r3NX7+4XPK9ci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oEJne041; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oEJne041"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23688C4CEF1;
	Wed, 28 Jan 2026 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769590581;
	bh=GWyCmUt+R4JArRQYceZDS1fFYiZJd/juPN0plXPMWVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEJne041LsinxJzPKLsKl1BgaQQeZgHE/zjdWoMeGnYFBw8ZGtbdPRld8CwH268lO
	 wl9Fek2nkEUWnNegG7UO255oXGM8+ekiYb4hRu+ofK4BjlkkRs9+XR/JkXxPp7ns+N
	 OtSt+8bLkqH/iFOv53p5VxueRdh0ABq2tJ32T4oY=
Date: Wed, 28 Jan 2026 09:56:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dayu Jiang <jiangdayu@xiaomi.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Longfang Liu <liulongfang@huawei.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, yudongbin <yudongbin@xiaomi.com>,
	guhuinan <guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>,
	mahongwei3 <mahongwei3@xiaomi.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Message-ID: <2026012857-deprive-putdown-0ee8@gregkh>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
 <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>

On Wed, Jan 28, 2026 at 04:48:49PM +0800, Dayu Jiang wrote:
> On Tue, Jan 27, 2026 at 12:22:40PM +0100, Greg Kroah-Hartman wrote:
> > >  	if (status & STS_HCE) {
> > >  		xhci_warn(xhci, "WARNING: Host Controller Error\n");
> > > +		xhci_halt(xhci);
> > 
> > What is going to start things back up again?  And as you are calling
> > this function, why is the warning message needed anymore?  The
> > tracepoint information will give you that message now, right?
> When HCE is triggered, it indicates a critical hardware failure. 
> Aligning with the handling of HSE (STS_FATAL) by adding 
> xhci_halt() here is more reasonable: without xhci_halt(), the 
> USB controller may fall into an unpredictable and unstable state, 
> which could exacerbate system issues.  
> 
> Retaining the warning message is necessary because it is directly 
> visible in dmesg, whereas tracepoint information requires explicitly 
> enabling xHCI tracepoints. Additionally, if xhci_halt() is called in 
> xhci_irq() without the warning log, it would be impossible to 
> distinguish whether the halt was triggered by HCE or HSE.
> > 
> > And is this just papering over a hardware bug?  Should this really be
> > happening for any normal system?
> Yes, this issue has been reproducible on real-world hardware: HCE is 
> triggered in UAS Storage Device plug/unplug scenarios on Android 
> devices, which enters this error branch and causes an interrupt storm, 
> leading to severe system-level faults.

Great, please provide this information in the changelog text when you
resubmit this, thanks!

greg k-h
