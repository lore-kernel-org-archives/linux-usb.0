Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C1F33893D
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995883; cv=none; b=DPZDKQ29JcCqSEKL2TjYaHkVqNhyu6s3ia5AyEv0R50w5ykdn2W+e6Sfoh7fyurvRRIRj0SqSsLUdTBCEwTRljeUhp6IbwT6kG4r22vV1ZYIdo2PkxgcnCheu+XM4tgo0tb6ql4IQNcMuPArZRh7PEYRFOsFJHcFVtub8ykX7Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995883; c=relaxed/simple;
	bh=fI/kg1j3QsJj/0vMDoXx3etTN/la7/+DE5ipR2ZjLDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLmu2qAYVVPgtwvTeAlgdcRUvJHkYAAVnOY4bJBcQ3zYAagQ9sueNipVVSiDBkaDEa83lt3gPht0OgqEPyDawXqTitKRTrGxaghbWR+kViB1320uqxnBz53xrS8bL77tUPOeYUG98VKBiy71gNSTrTb4LeFW8TZySiC2o3Vo3Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lWlQoFSw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lWlQoFSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679F21F000E9;
	Thu,  2 Jul 2026 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782995881;
	bh=cKJJbAarMlL5ji0pQixfSwCuKY7yoCt123pmPCfbVJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lWlQoFSwuUx9YO8Qiw1MdXjFPLzWwwbOhtipgiLAJ19tcgp1dlniS1so0upg1Tjav
	 VZWCSXC9rwFxkFCzMbs2IbGF1Ep74PI10zFplvCu21ggOo+Dm1zUl72EJ+1y1AomNS
	 adeltlNWy2M1CBC0tAcklT/InlNkqs0px1wftuO0=
Date: Thu, 2 Jul 2026 14:38:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: 7.1 regression bisected to "usb: core: Fix SuperSpeed root hub
 wMaxPacketSize"
Message-ID: <2026070243-retread-sensuous-aab2@gregkh>
References: <cb287e3d-3066-4820-b464-6208b947974b@mailbox.org>
 <577c7ba6-c638-4e73-acac-fbf6c4fb4ccc@linux.intel.com>
 <20260702105152.415afeaa.michal.pecio@gmail.com>
 <80bdd3da-33c0-44b4-a1af-6aca44c1acd6@mailbox.org>
 <2026070255-rerun-unstable-a90a@gregkh>
 <ee889a90-6ef3-4546-a05c-227ed3e742a7@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee889a90-6ef3-4546-a05c-227ed3e742a7@mailbox.org>

On Thu, Jul 02, 2026 at 02:25:04PM +0200, Michel Dänzer wrote:
> On 7/2/26 14:22, Greg Kroah-Hartman wrote:
> > On Thu, Jul 02, 2026 at 02:20:05PM +0200, Michel Dänzer wrote:
> >> On 7/2/26 10:51, Michal Pecio wrote:
> >>> On Thu, 2 Jul 2026 00:09:42 +0300, Mathias Nyman wrote:
> >>>> On 7/1/26 19:02, Michel Dänzer wrote:
> >>>>>
> >>>>> The ethernet port of a Lenovo ThinkPad USB-C Dock Gen2 connected to
> >>>>> a ThinkPad P14s Gen 5 AMD stopped working in 7.1.
> >>>>>
> >>>>>   ip addr show enx482ae347e7c3
> >>>>>
> >>>>> says the interface doesn't exist. The only thing about it in dmesg
> >>>>> is:
> >>>>>
> >>>>>   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
> >>>>>
> >>>>> In previous kernels, dmesg had more lines about it:
> >>>>>
> >>>>>   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
> >>>>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
> >>>>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier off
> >>>>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
> >>>>>
> >>>>>
> >>>>> I bisected this to d1e280334b7f ("usb: core: Fix SuperSpeed root
> >>>>> hub wMaxPacketSize"). Reverting that commit on top of 7.1.2 fixes
> >>>>> the issue.
> >>>
> >>> Incredibly bizarre, I wonder if it's some userspace madness.
> >>
> >> That reminded me that I'm using (an older upstream version of) usbguard. Unfortunately its GUI notifications when it blocks a USB device aren't working reliably currently.
> >>
> >> Manually firing up its settings app revealed that it was indeed blocking the USB3 hub. Overriding it to be allowed fixed the issue with the bisected commit.
> >>
> >> Looks like a false alert after all, sorry for the noise, and thanks for the help.
> > 
> > Thanks for letting us know, and this isn't the first time that usbguard
> > has caused a problem recently.  Did we change something that broke it's
> > functionality?
> 
> My assumption is that this change results in usbguard considering the
> USB3 hub a different device, so the persistent settings to allow it no
> longer applied.

"different" in what way, because it is a different speed?  Why would
usbguard be prohibiting hubs?

thanks,

greg k-h
