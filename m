Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4063E205E25;
	Tue, 27 Jan 2026 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523774; cv=none; b=SgrSMlskh63jPmvMz9iBL40EB60/x4ijr6QwM82xrKg1Ng3ee4JYue3LEiC/LsocXh4h21WbwoMa+RGlqOcqpqKfjB56hV/36+4+mHaRkq8Dmg2v3guicVKX/bxZ5lFl/RQUWLOhH6qlzifJOVFUJ6dygIDG/o/tCD8UIV3T0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523774; c=relaxed/simple;
	bh=dpjU6mJDBtum2+5zlVCW9Efk6cyaxO8GOg2RoRovxZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gy88vlBaGTwmzkd9SHmi37CPJqBMxNkxuyCi6Ff3yTDkFB4DuW19r54y7AAtQZNoiSOR3f5E+GWo7qmMxOE6Z/EcYx2BGP13ZUzLZ7mNKc//f87i5XtURxFIj/rViTRyjcBQY8DyXgeD19eiKGJ4UX5AXuQI7flMOKgs5n05lb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lb46GpRY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lb46GpRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A5AC116C6;
	Tue, 27 Jan 2026 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769523773;
	bh=dpjU6mJDBtum2+5zlVCW9Efk6cyaxO8GOg2RoRovxZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lb46GpRYr7b81Jr15wtvcXJQ5u5Q6KFXDgbrthXgufDQFVCptjtqJgfpGJyIqQhM6
	 cqw3tjtBGBPjY9Tfpfgp3sqs/q8bnkX1opxKnYTbTDGhOpuP0K5ejmsGRKsi7EeS9d
	 ar+GebNthJMv8n0Sm2/WEEmlWDSeM8Q/P6XFZNBQ=
Date: Tue, 27 Jan 2026 15:22:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] usb: gadget: Add a prefix to log messages
Message-ID: <2026012744-disfigure-plural-5699@gregkh>
References: <20260123142221.14285-1-jszhang@kernel.org>
 <2026012339-landmine-risk-5c9c@gregkh>
 <04929f5f-8760-45f1-999a-c48e8dea6876@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04929f5f-8760-45f1-999a-c48e8dea6876@rowland.harvard.edu>

On Fri, Jan 23, 2026 at 11:18:29AM -0500, Alan Stern wrote:
> On Fri, Jan 23, 2026 at 03:52:11PM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Jan 23, 2026 at 10:22:18PM +0800, Jisheng Zhang wrote:
> > > I met some log as below:
> > > [  581.262476] read descriptors
> > > [  581.265558] bcdVersion must be 0x0100, stored in Little Endian order...
> > > 
> > > To be honest, if I'm not familiar with the usb gadget framework, I dunno
> > > which component is complaining. Add a prefix to log messages, so the
> > > above messages will be look as below:
> > > 
> > > [  581.262476] usb_f_fs: read descriptors
> > > [  581.265558] usb_f_fs: bcdVersion must be 0x0100, stored in Little Endian order...
> > > 
> > > Then solve similar issues for f_mass_storage and f_tcm.
> > 
> > These should all be using the dev_info() and like calls, not pr_*(), and
> > if that happens, then you will get the correct prefix.  Can you make
> > that change instead?
> 
> Unfortunately, the composite gadget driver doesn't create sub-devices of 
> the gadget for the various function drivers to bind to.  The only device 
> available is the gadget itself, and its driver's name is just 
> "composite".  Therefore dev_info() and others will not show the 
> particular function driver, which is what Jisheng wants to see.
> 
> Also, some of the calls affected by these changes occur at module 
> initialization time, before anything has been bound.  They don't yet 
> have any device to refer to.

For things that happen before a device, sure, pr_() is ok (but really
should be quiet unless it's for debugging stuff.)  The other ones should
have or get a device pointer eventually.  Using dev_info() AND the
function driver name is the best way forward here, that way you know
exactly what device it is referring to.

thanks,

greg k-h
