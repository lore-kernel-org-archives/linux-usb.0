Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38795208C3
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067551; cv=none; b=XZefJ1Ol1gn+EIKxO8ho6txURKAxTj/utL+MzCkFbMTF+MehR+UoO2z6vF5zll7edj5XOzvL+eLQcExlVIRyzYRNWT9n/UwMO2IRn4juiuFs/5/feFO1SL4W867D9DnUk2Z87S07dnJjqgx0xgzyXeGm42IFND4RJQs2hbtssc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067551; c=relaxed/simple;
	bh=aqSSaaRUjkzBIqPKiFZt2nkI+SrF6UHVeOOeh0bx4NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1FEAMD/BHSVIHentVvSzF36oUUkXXKr89ddxfVBDzxiTT3F14/LUWpfkmxCTrSAZ2ostm5f1IB6oUsZHJxbhNcU+d396HS2XAeSaLrT+SFsLXERGzb8y/0AMK8ahrn78OoK8daGpIRJcBGsD8IXic4OAE1qs+eBumxfyrTIW1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TVU4is2z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TVU4is2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074831F000C5;
	Thu, 15 Oct 2026 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792067549;
	bh=U67tFEPMt66yWcAkLW2+ElhfuXr4wiN51+Hn1Bp9KLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TVU4is2zFgn5YKbE/VNjsOlXXBnfCX/CTPhkWl4/6RzY0+sD/kyzVA6xd+RFoy9OL
	 6bCQl8G2a4xcYDq0tg2KFWDgqs2jE6X68roqSFGM5G54o50OuiJFo6R2qyH6kESleO
	 RHp8pLS5TeKsx0feN+FrIkX5Kck4VQMRHkXfHTU4=
Date: Thu, 15 Oct 2026 14:32:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Reid D <skibletz@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb: devio: USBFS_XFER_MAX check bypassed for iso urbs due to
 incorrect ordering, potential oob heap write
Message-ID: <2026101508-yam-countable-ad14@gregkh>
References: <CAGNJ+_3qpWtzjTLntxTzF2v0jU9mVssukGfhrJFOx_yb+2Abyg@mail.gmail.com>
 <2026101531-secular-entire-f7a4@gregkh>
 <CAGNJ+_0ShEM-G+8p3oHx1uF8rBtC7JyqmyFzswDB50qsW=qwuw@mail.gmail.com>
 <2026101509-reggae-whacking-6598@gregkh>
 <CAGNJ+_3ug6Xs-A45-MMA5q-qHLvu=8OhbMLmVkzE_Cm6N=HbUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGNJ+_3ug6Xs-A45-MMA5q-qHLvu=8OhbMLmVkzE_Cm6N=HbUA@mail.gmail.com>

On Thu, Oct 15, 2026 at 08:07:49AM -0400, Reid D wrote:
> Greg, sorry about that.
> 
> The fix moves the USBFS_XFER_MAX check to after totlen is computed so it
> validates the actual transfer size used for the kmalloc.
> 
> On Thu, Oct 15, 2026 at 8:02 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Thu, Oct 15, 2026 at 07:30:26AM -0400, Reid D wrote:
> > > Greg,
> > >
> > > Please check out the fix,
> >
> > <snip>
> >
> > For some reason you sent this only to me, which is a bit rude to
> > everyone else on the mailing list.  I'll be glad to respond if you
> > resend it to everyone.
> >
> > thanks,
> >
> > greg k-h
> >

> From e3b32fafac13bc84183624fabc616cdcf3719cad Mon Sep 17 00:00:00 2001
> From: "Reid Downing (b1nv0id)" <skibletz@gmail.com>
> Date: Thu, 15 Oct 2026 07:24:20 -0400
> Subject: [PATCH] usb: devio: fix USBFS_XFER_MAX check ordering for iso urbs
> 
> Signed-off-by: Reid Downing (b1nv0id) <skibletz@gmail.com>
> ---
>  drivers/usb/core/devio.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)

Please point your llm at the docs to show how to create a real patch
(hint you need a changelog and it can't be attached.)

Also please test your patch so that you know it actually fixes the issue
you are reporting.  Remember a huge % of llm-found bugs are actually not
bugs at all, you need to make a patch (which you did here, so that cuts
the odds down to 50%) and then test it (which cuts down the number even
more.)

thanks,

greg k-h
