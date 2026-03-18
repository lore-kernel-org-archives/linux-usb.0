Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D2936214D;
	Wed, 18 Mar 2026 05:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773813551; cv=none; b=Ur7cEfyUgClbJLBzBkmG8WFPziiV+Gb+AtzkY1zf1i/4ztD0P29yjiD74bDr/2SYcDz3eZ3xTAnOk+uk2HzcYF7Jqxcs17jpRPU69nYvOwCteB4HCrfjN5I19G5jo43k2VH3Cd1hvEhXjdgfrhldzbCjRCadwCsVSEdv2GA0AeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773813551; c=relaxed/simple;
	bh=I57/mwkPwJmgmk2ypVTKx8cID1JimxqeZSvcaTNmllo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXJqV0on6yANJfOP8tY7YUDyG9lhVxJySiB8+lP82ugSR7UNmu+B3vilsgUK3NGB4BHnLBoiLCORf2y9iUOOxDii89vDa9uBUGQtkIabBrYBI+mcE3qNQTlhkMrpMXA4ij3d0L4WdfsfoQT7PbHRicFAObbKXEcIW5Y4Yfi7aKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NIwDTVRI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NIwDTVRI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E46AC19421;
	Wed, 18 Mar 2026 05:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773813550;
	bh=I57/mwkPwJmgmk2ypVTKx8cID1JimxqeZSvcaTNmllo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NIwDTVRIhKfaA0vSxOATiJcRywX/CHfD9D3bEKEV/w7IscO//T1UjLelzLTh2tZi9
	 Ixu2fIOZytnP86sGb5EUu6Rh93+ziPzY95p5pYqoZhWJ040STfW9wpm3Y9cJVCZYBS
	 MCflHBwBA+xMm9m5ExMs4f/t35ZhAXI6NyoE3SF4=
Date: Wed, 18 Mar 2026 06:58:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com,
	quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de,
	christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn,
	wesley.cheng@oss.qualcomm.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ALSA: usb: qcom: manage offload device usage
Message-ID: <2026031815-heroism-devotedly-e730@gregkh>
References: <20260309022205.28136-1-guanyulin@google.com>
 <20260309022205.28136-3-guanyulin@google.com>
 <2026031115-unboxed-spouse-1dcd@gregkh>
 <CAOuDEK3k6nyiHxhcL1kv=QNQaZMF6ms=sLerSZ5JBc5WBd7nAw@mail.gmail.com>
 <CAOuDEK2pyt4nKWxXXwtzgRuP6u9kvi_Joe8Ec8qDDHVzSue1rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOuDEK2pyt4nKWxXXwtzgRuP6u9kvi_Joe8Ec8qDDHVzSue1rg@mail.gmail.com>

On Tue, Mar 17, 2026 at 04:45:00PM -0400, Guan-Yu Lin wrote:
> > On Wed, Mar 11, 2026 at 5:31 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > You have multiple levels of locks here, which is always a sign that
> > > something has gone really wrong.  This looks even more fragile and easy
> > > to get wrong than before.  Are you _SURE_ this is the only way to solve
> > > this?  The whole usb_offload_get() api seems more wrong to me than
> > > before (and I didn't like it even then...)
> > >
> > > In other words, this patch set feels rough, and adds more complexity
> > > overall, requiring a reviewer to "know" where locks are held and not
> > > held while before they did not.  That's a lot to push onto us for
> > > something that feels like is due to a broken hardware design?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> 
> Hi Greg,
> 
> Thank you for the feedback. I understand the concern regarding locking
> complexity and the reviewer burden. The usb_offload_get/put functions
> track sideband activity that runtime PM cannot reflect. This is
> necessary to prevent the USB stack from suspending the device while a
> sideband stream is active. Ensuring atomicity requires orchestrating
> three asynchronous subsystems: System PM, Runtime PM, and USB Core.
> 
> To address the concerns effectively in the next iteration, I would
> appreciate clarification on your primary concern:
> 1. Preference for fine-grained locking:
> Using USB device lock ensures atomicity across these subsystems, which
> is inherently a device-wide requirement. A fine-grained approach risks
> races during concurrent software events, such as a reset occurring
> during a runtime suspend transition.
> 2. Preference for improved transparency:
> If the coarse lock is acceptable but the implementation is too opaque,
> I will refactor the next version to be more explicit. I plan to
> include device_lock_assert() calls, __must_hold() macros, and add a
> "Locking Hierarchy" comment block documenting the vendor-mutex and
> USB-core lock interactions.

At the very least, this is going to have to be required so that we can
catch any future changes and ensure that changes do not create locking
inversions and the like.  I guess we are stuck with this for now, due to
this being "outside" of the normal runtime PM, which still feels wrong
to me as runtime PM _should_ be able to handle this (if not, why is this
case somehow unique from all other hardware types?)

> To clarify the "broken hardware" point: this isn't a hardware bug.

It was described as triggering when a shock happened to the system to
cause the system to reset in places, which is a hardware issue :)

> These races are triggered by standard software events, such as a reset
> occurring while a sideband stream is active. Please let me know which
> direction you think is more appropriate for the kernel, and I will
> refactor the next version accordingly.

And how exactly can a "reset while active" happen as just a normal
software driven event?

thanks,

greg k-h
