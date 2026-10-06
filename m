Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182FB35BDC7
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 06:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266499; cv=none; b=sdkfvckzeAgpTKqS+JQakZOX3tnRHRAAP4VHiJToOlZF5l1ePWqLc+tIdifouCZMb8ZGwzIV+u0OlLqr9FHVKzbq1xz34CyD+nrp9PHXCiEXtu8SQuc/a/Q/3ZmAkiXv5e5BjD+NQM98WRrVByqDDsokl1gB5dSJ3MMK5VFSSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266499; c=relaxed/simple;
	bh=VLq3JTDVqPKVlDRe4vepqA0cX+xnBlJEuFW37jVqwUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/9GxYumca+upDAUEqVMtA8Zq4YF6jFg/NtRwK/XYD0pqykWEDQrOmlSKyfD4lAbRSSzONQgnjNMMXQOe7vwfAJRcnMmF2e0AaVAJCDGPRHAUCq8gKjPLo6k/M25NqsPAL+UeNRLhJ7O48IQJ8CKQDv/2QOxI6KB70OpvGs3WK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IwOw/JNT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IwOw/JNT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245631F000FF;
	Tue,  6 Oct 2026 06:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791266497;
	bh=H60QoklCLZ+PLAcA5y4J/w0OOkAGQd9hoH5ITsPTEYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IwOw/JNTvIHaVZm4nWJh08jpZez45cygB4NnVfeyZ8c+Y+rDFT2INNj9LRti9X3HL
	 OKqRsr8lIcbN4egVhr5wc31cOEYLN7CWHtQ4T1/K3nrBMVw7LvRUKOKeAxxsT2WLBL
	 gRqRjIYYcOgArGKtpLMVuUI0IiW/3oKNzJXezVLg=
Date: Tue, 6 Oct 2026 08:01:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Thoughts on Sashiko reviews for linux-usb
Message-ID: <2026100622-kindred-alphabet-7802@gregkh>
References: <asRCTFE6gFlHBIu6@vbox>
 <2026100647-stilt-mongrel-b368@gregkh>
 <2026100602-overtly-scaling-3153@gregkh>
 <7ia4ld8b8jhj.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ia4ld8b8jhj.fsf@castle.c.googlers.com>

On Tue, Oct 06, 2026 at 05:51:20AM +0000, Roman Gushchin wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > On Tue, Oct 06, 2026 at 07:03:14AM +0200, Greg Kroah-Hartman wrote:
> >> On Tue, Oct 06, 2026 at 12:45:15AM +0000, Thinh Nguyen wrote:
> >> > Hi all,
> >> > 
> >> > I'd like to get your thoughts on having Sashiko send review results to
> >> > linux-usb for patches posted to the list.
> >> > 
> >> > I started looking into this after receiving a reference to a Sashiko
> >> > review for a dwc3 patch that I wasn't Cc'd on, which required me to
> >> > track down the review separately to understand the feedback.
> >> > 
> >> > Sashiko is currently configured per mailing list, so any change would
> >> > apply to all patches sent to linux-usb rather than a specific subsystem.
> >> > 
> >> > Would anyone object to enabling Sashiko reviews on linux-usb?
> >> 
> >> Not at all, want to submit the pull request to the repo to add it, or do
> >> you need/want me to?
> >
> > Now done:
> > 	https://github.com/sashiko-dev/sashiko/pull/651
> > but I don't know if that adds a "will email back the review" workflow
> > for patches sent to linux-usb@vger.
> >
> > Roman, it looks like the sashiko.dev/email_policy.toml file isn't in the
> > repo anymore, or at least it's not in the git checkout that I can see.
> > Does the linux-usb list need to be configured anywhere else as well?
> 
> I moved it to deployment/sashiko.dev/email_policy.toml while preparing
> to support other projects.
> 
> You need to define the email policy to receive reviews over the email.
> I can help with that, just let me know who it should to/cc?
> It seems that the most popular option is to reply to the author and cc
> the mailing list.

Ah, issed that file, sorry about that.  I've submitted:
	https://github.com/sashiko-dev/sashiko/pull/652
to add the default policy (to match what we have on linux-serial as that
seems the most sane for now.)

thanks,

greg k-h
