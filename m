Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2263B39A05D;
	Mon, 22 Jun 2026 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120456; cv=none; b=O7OqeFByDorO4PHlvX7GgTENDsaycSuNuIsL4Ysum5ls2k3wATj0RlAeYG0A5eMkW+5YY4ok8b5TjOkqAD9Zf710jemO8kx3KjOHR6w1v/Xh586hpqvMNTlGiTZsLWOwkG1AkBNCwrs25K3/CmuG5Ustzr9VYE4cX2FIgO8l0mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120456; c=relaxed/simple;
	bh=0blUKzrWU6CytkpQ+qcGrr7moTfEg2Q1U8ZPyHlE8CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVtXj1e6I6FUG3LUBUvnuIJEJYvxAVeMJlK4da9viAvaY7WCSUq/Cl6ylQuf5Aaeb/SS3IYJbjEWO5NbjlmVzLTqqGE+k03XSvCFxJYdNflj1sADpLKea24jq6gaT7nKyLCcmbVD9WR2ICui6S08smgnaKPyjnC42e8X1Bv/8IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lU0d05KG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lU0d05KG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E9F1F00A3A;
	Mon, 22 Jun 2026 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782120454;
	bh=dUnaRspGAlHQxXzz2MXZf2NnJgZzukGctlWg4d1f0+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lU0d05KGMCokZzMmNB01CcWgQCiFyJFimcIN2UlXtRXV4iKFSWV9kna2XUX1+so8G
	 dlTGRfVIs/bpJt9xlXlQSXcpA1mp2crVPNA7PkBKzQvRgsbSW4zmSSp7y8gI/GsZQ1
	 etlSTD+ixbli8zYyw7Q9O+yPYcI+bd6ExJlv11NY=
Date: Mon, 22 Jun 2026 11:27:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG)" <naveen.reddy@ftdichip.com>
Cc: Johan Hovold <johan@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Arun Pappan (FTDI-SG)" <arun.pappan@ftdichip.com>
Subject: Re: [PATCH 1/6] USB: serial: ftdi_sio: add configurable inter-batch
 defer for read URBs
Message-ID: <2026062229-pesky-wasabi-ae9b@gregkh>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com>
 <eb7093a47b77e9ef3ab55ada4c9591ae472da645.1781744946.git.naveen.reddy@ftdichip.com>
 <2026062250-sassy-hamper-025b@gregkh>
 <SG2PPFE985372F0DEC3C668B0C138E0684BEFEF2@SG2PPFE985372F0.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PPFE985372F0DEC3C668B0C138E0684BEFEF2@SG2PPFE985372F0.apcprd01.prod.exchangelabs.com>

On Mon, Jun 22, 2026 at 09:05:53AM +0000, Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG) wrote:
> Hi Greg,
> 
> On Mon, Jun 22, 2026 at 04:52:00PM +0000, Greg Kroah-Hartman wrote:
> > This is not the 1990's, module parameters should not be used anymore...
> > Why not just fix this at the root of the problem?
> 
> Thank you for the review, Greg.
> 
> You are right on both points.
> 
> On the module parameter: I will switch to sysfs if the per-driver approach
> is accepted, or drop it entirely.
> 
> On the location: your core point is well-taken. The DMA channel starvation
> is a BCM2835 DWC_OTG host controller deficiency, and the correct fix
> belongs in the host controller driver, not in each USB device driver.
> I will investigate fixing it there instead. If that is not feasible (the
> BCM2835 DWC_OTG is a vendor tree that Broadcom/RPi maintain outside
> mainline), I will report back before proposing any per-driver workaround.

As this is an out-of-tree issue, there's nothing we can do in our
in-tree drivers for that.  Please work with that team to either get
their code merged properly upstream with us, where we can all work on
the issue together, or just work with them out-of-tree.

thanks,

greg k-h
