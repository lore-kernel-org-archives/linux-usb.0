Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC0232B10A;
	Sat, 22 Aug 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787394987; cv=none; b=br8Cs1SWenBGKAgZnzeLleOM4T+8poKhs5ifvvNCjFfwt3pAv5CM4JCZOea87pMTLEXg16em99n9YgZmR5lgAk01y8BQ2gEqf+HAVovkh+0Z/fIUM2wtloXtuThJHSdGTIqc+4amdMLKS0+DhlaeYux2xTi2o6S6o7s68Xi/m7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787394987; c=relaxed/simple;
	bh=1dMfvAFRwbrPzo5L6foFG7i6f0RsOABFqDy/JwPLcD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEsNN8aoeh7d8Aw4e5eNJjTjzb7v4MCaa42NnpqqtwaALNWMh44Is9zmpwMrc2nsPogt+Q5SgHuUqPKTV9twfrybLWDvikRY1Jvjhnqn2rNYVAQaSdiOVdEQi6hU2p3cAzVUtUGDMuTH2HU/cDsnx3HEOgPjZc+VqW1JbzxO2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JvMixRyU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JvMixRyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8D51F000E9;
	Sat, 22 Aug 2026 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787394985;
	bh=ELHPfGek/nUxXdUCDzBjxp8XE03O00KFL3WCsA8rN0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JvMixRyUDLw3rMgwXtDFDPliWqd1NNlJ0Kx+WBW+Xe4mJM0rT2J/8ckdL7lXCfqnR
	 UO/uq6JoiUDo9EVupefOOtHMoI0VZvwSArFWaGRJ3Lvc75aPg1n8Fg+9rIhaax7n6g
	 1bu3c7/XKzox41TcgIxAu5D9gwMw5/ng45k4z92M=
Date: Sat, 22 Aug 2026 12:34:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: erdaitianjiao <erdaitianjiao@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: validate CAPLENGTH in xhci_gen_setup()
Message-ID: <2026082252-segment-haste-2eb7@gregkh>
References: <20260822102357.4634-1-erdaitianjiao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822102357.4634-1-erdaitianjiao@gmail.com>

On Sat, Aug 22, 2026 at 06:23:57PM +0800, erdaitianjiao wrote:
> xhci_hcd can be bound to arbitrary PCI devices via the
> driver_override sysfs knob. When this happens to a device whose
> MMIO registers are not xHCI capability registers,
> xhci_gen_setup() reads CAPLENGTH from the foreign register
> layout and uses it as a byte offset to compute op_regs.
> 
> A non-xHCI device can return a CAPLENGTH value that is
>   - not large enough to fit the capability register block, or
>   - not 4-byte aligned (e.g. the NVMe CAP register's low byte is
>     0xff, which becomes CAPLENGTH = 0xff).

That's crazy, and I'm getting tired of rejecting patches like this.
Again, if you use 'bind' to attach a device to a driver you HAVE to know
what you are doing.  Attempting to fix up each and every driver to
handle this is not ok, and will not happen.

sorry, syzbot is broken and needs to be fixed,

greg k-h
