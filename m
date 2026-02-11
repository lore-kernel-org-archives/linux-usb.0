Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8116F29BDA3;
	Wed, 11 Feb 2026 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824866; cv=none; b=qLAexd+Ivgh2CJwtLWkVz6sdxph1x3znHJWRr5ktkOkMHPtVs69pVlzrDWLJmn++Mj4n0zE2Hzy8V+ucNf+BTK/zJfxnbGMrfP00EbTqd1hpRs6Bt2WS7ohsb8OrzVV0/7PV0dw9DG8ha1Rtu44AWCTiiFY2WpRbyxPAioFIJB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824866; c=relaxed/simple;
	bh=rxDFDVF4mjjjZHiQtSI6B+jJ/w/GgvAqOZDtjedka+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0ibhON9hIwIFpsXEujfe9XxKmgGJl+BtrD0uLnDlomFj5Ol1+ZbrcJHsDxiL5zE9CQYDLs1eQBTJ1mgy7VJj/FYHMmdRbCBIYwYKGrryRevo4oNiBdyymmyThLKCyL/i8+ZmT1mnK/yoVoEj4NpcBzezns6jTXdNHjp1LyB8MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g1xSky9f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g1xSky9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EB3C4CEF7;
	Wed, 11 Feb 2026 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770824866;
	bh=rxDFDVF4mjjjZHiQtSI6B+jJ/w/GgvAqOZDtjedka+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1xSky9fkHM5NDJ6ZUe2q4qU931w/1oRJXrk+Mjl8LPffV7ZgpoKtvaSDpM2C9pBd
	 g1KD2mBgsOI/x/b3BIgJFHDnyM/cHmbU521o5wXMbMMnbLjR3/vW2zqvPyGkov5Qp2
	 0q1RSyBDDAtCITYLsR+AY58MUyeCUP2d2AalTg+g=
Date: Wed, 11 Feb 2026 16:47:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Xu Yang <xu.yang_2@nxp.com>, m.grzeschik@pengutronix.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <2026021153-tactful-steadily-5eae@gregkh>
References: <20260211103628.3265850-1-xu.yang_2@nxp.com>
 <1be3ca8a-032d-487e-92f4-67b2070be213@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1be3ca8a-032d-487e-92f4-67b2070be213@rowland.harvard.edu>

On Wed, Feb 11, 2026 at 10:04:32AM -0500, Alan Stern wrote:
> On Wed, Feb 11, 2026 at 06:36:28PM +0800, Xu Yang wrote:
> > When disable the root hub port, somehow the device is disconnected and
> > re-connected again. This happens because usb_clear_port_feature() does not
> > clear a truly happened port change. That says, in fact, port change event
> > may happen after usb_clear_port_feature() is called. Then the subsequent
> > port change event will have impact on usb device suspend routine.
> 
> This is not a very good description of the problem.  Here's a better 
> one:
> 
> When a port is disabled, an attached device will be disconnected.  This 
> causes a port-status-change event, which will race with hub autosuspend 
> (if the disabled port was the only connected port on its hub), causing 
> an immediate resume and a second autosuspend.  Both of these can be 
> avoided by adding a short delay after the call to 
> usb_hub_set_port_power().

What guarantees that a "short delay" will solve this?  And how long of a
delay?  What guarantees that sleeping will not just reduce the race
window?

thanks,

greg k-h
