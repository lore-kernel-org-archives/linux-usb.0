Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B96E47D938
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994936; cv=none; b=Vx3dpqZ4d+Hak2IpGApiup4XbsXWjTe5OeqkQ6w3D4XFE3mJCPF2bK8M5tAfjRSYm87wDn2vnYCs6VscQE/CwwUVQEt8F13ZAU2+wgmP+GoZ61II9Gg67bFw8fDjdwddfMPw+LP/8zkJuP28P3m3KpBV95o6XgjC9Az6WeSaf+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994936; c=relaxed/simple;
	bh=+/Y0bWXboSmAdLvJkmyNx6d6S+V5jqoyIBJ6QPt/OMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5363xYJVQ8bEhZc6olkIcZ6b4AFgv4DHIXnV7YknGPrjdD9tJokibVyRGqLOmqja5JSsxlsqe7n9ktmg12ewcqtLl4ddJnPU51AwsU5QDulhLDZte03T71PilBGB2iyTgoY2QO4TJXSV3r1+i2q5A5/AFNqGVfe7NlwXx6tRuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S9W/+fRR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S9W/+fRR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57111F000E9;
	Thu,  2 Jul 2026 12:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782994935;
	bh=mRdfsCgHaUG/8wzYmhY0yiLJzXpwBFKNqpppIBieDxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S9W/+fRRYkwwOAxBIsaFWZ56h/azkaudB0xIRA0CWvz5DUUV9hTTNskC3oQ8BUCtT
	 usez7WI0z1a69BLd37SHnzp+zz6ccIeJ44oQE+tRfvDVxlED/dFphMmEdMA3RtRHEA
	 Z8rp7efz85BPACAy+0Kw6bxQi1HcGRcCBY5f9ci0=
Date: Thu, 2 Jul 2026 14:22:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: 7.1 regression bisected to "usb: core: Fix SuperSpeed root hub
 wMaxPacketSize"
Message-ID: <2026070255-rerun-unstable-a90a@gregkh>
References: <cb287e3d-3066-4820-b464-6208b947974b@mailbox.org>
 <577c7ba6-c638-4e73-acac-fbf6c4fb4ccc@linux.intel.com>
 <20260702105152.415afeaa.michal.pecio@gmail.com>
 <80bdd3da-33c0-44b4-a1af-6aca44c1acd6@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80bdd3da-33c0-44b4-a1af-6aca44c1acd6@mailbox.org>

On Thu, Jul 02, 2026 at 02:20:05PM +0200, Michel Dänzer wrote:
> On 7/2/26 10:51, Michal Pecio wrote:
> > On Thu, 2 Jul 2026 00:09:42 +0300, Mathias Nyman wrote:
> >> On 7/1/26 19:02, Michel Dänzer wrote:
> >>>
> >>> The ethernet port of a Lenovo ThinkPad USB-C Dock Gen2 connected to
> >>> a ThinkPad P14s Gen 5 AMD stopped working in 7.1.
> >>>
> >>>   ip addr show enx482ae347e7c3
> >>>
> >>> says the interface doesn't exist. The only thing about it in dmesg
> >>> is:
> >>>
> >>>   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
> >>>
> >>> In previous kernels, dmesg had more lines about it:
> >>>
> >>>   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
> >>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
> >>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier off
> >>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
> >>>
> >>>
> >>> I bisected this to d1e280334b7f ("usb: core: Fix SuperSpeed root
> >>> hub wMaxPacketSize"). Reverting that commit on top of 7.1.2 fixes
> >>> the issue.
> > 
> > Incredibly bizarre, I wonder if it's some userspace madness.
> 
> That reminded me that I'm using (an older upstream version of) usbguard. Unfortunately its GUI notifications when it blocks a USB device aren't working reliably currently.
> 
> Manually firing up its settings app revealed that it was indeed blocking the USB3 hub. Overriding it to be allowed fixed the issue with the bisected commit.
> 
> Looks like a false alert after all, sorry for the noise, and thanks for the help.

Thanks for letting us know, and this isn't the first time that usbguard
has caused a problem recently.  Did we change something that broke it's
functionality?

thanks,

greg k-h
