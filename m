Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3393D301E;
	Tue, 14 Jul 2026 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008475; cv=none; b=Nxc3R79OE+7wbbPHYHloDvd6fGNVzXemXRYwwDOja881j9caiYKf5khLw860HUsU7bDj1OrPyvBnh+ifCfiqCy+Ym1BG0NmbKk/Zwj6OLI7Q1UPEawJYPXN9N3PWYR3kiBRMx1mllkmNZDlkmQ7D64eUBjhhudAtHyFmJ79RVEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008475; c=relaxed/simple;
	bh=BagwUAwLlXf3LypJQ1vzlK2NYLVvozG951KLi8BIaQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeITeLDOhVJr6QFAKAe57oKPUg9x8QlKJXKroLJER+ag0/P/49JitxVlF5Tmci8n0RSS878ATidYnlmXR2DILkx72N/dJq4ZD0jRF50h2VftJLFbhAQDRf+uFZZ2uM8rqH4hYCufmOt599qrLPu+CWPbPkZYYSvYlVc4oP2f/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iFQi5y+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iFQi5y+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A429D1F000E9;
	Tue, 14 Jul 2026 05:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784008474;
	bh=AmuTe8hbTEUYWSP08BLMTndKPguWrVg/DpUVm0YOp08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iFQi5y+c0/JwVIcYRrHgHP38R+7da9zcs2zM/y88twcJzLoyR7jQK6jrqEB6yO0T2
	 eVNVEOcqgyEnjpdfi62OnXUmwCJ9nQvdxbhj8Pcjs1YOZN0gj6pDMkhvYIMr3gr/Vs
	 l8ATW4TjiOSB7FJ2TmWvhgd8EpPNiZ9hM38Sn3y0=
Date: Tue, 14 Jul 2026 07:53:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: core: strengthen size check in
 usb_parse_interface()
Message-ID: <2026071406-ambiance-rogue-39bb@gregkh>
References: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
 <20260713-usb_core_patches_1-v1-2-7721c2b33f53@kroah.com>
 <b2498cb4-61f7-429a-920a-e27ecd7986e4@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2498cb4-61f7-429a-920a-e27ecd7986e4@rowland.harvard.edu>

On Mon, Jul 13, 2026 at 12:13:04PM -0400, Alan Stern wrote:
> On Mon, Jul 13, 2026 at 05:43:52PM +0200, Griffin Kroah-Hartman wrote:
> > Change the size check from size > 0 to size >= sizeof(struct
> > usb_descriptor_header) in usb_parse_interface().  This prevents a
> > malicious device from utilizing trailing bytes to incur an OOB read.
> 
> No, because usb_parse_configuration() has already performed this check.  
> A malicious device can't avoid that earlier check, and so we don't need 
> to do it again.

Ok, this is my fault.  I gave these tasks to the author here, as part of
an project for computer security masters students at vu.nl to help grind
down the huge number of LLM-reported issues that I've gotten over the
past few months (you'll see other patches from these students being
submitted all over the tree right now as well).  Right now the LLMs seem
to be running at about 1/3 to 1/4 of "false positives", and these two
patches are a good example of that.

The thread here:
	https://lore.kernel.org/all/alEsSl8i1_FpoU0f@fudgebox/
is also another example of where the LLM wanted to add more defensive
code, despite it not really being needed.

The bots really really want to please you, and come up with ways to
swear that the change is needed, and so manual code review is still
always required.

Even with that manual review, these two fooled me, as they are obviously
not wrong (what's the harm in adding more checks?)  I caught that we
parsed the descriptors in usb_parse_configuration() but missed where
size was not incremented (I was looking at the buffer pointers).
Sashiko also missed this (catching it for the first patch, but not for
this one), proof that even the "best" LLM models out there today are
still not reliable.

Thanks for the review, much appreciated.

As for patch 3/3, I'm pretty sure that can't hurt as well.  I'm starting
to get a lot of "something could happen in an IRQ while a device is
being removed" bug reports from these tools.  Looks like they all just
discovered that very rare code path at the same time, something that
syzbot can't really fuzz for.

thanks,

greg k-h
