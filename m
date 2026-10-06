Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB3A22425B
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 05:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791265308; cv=none; b=fxibxtiBT6mRus9AQdzMZJeIKBl0kYherNeCrhyljh5TZAzZ6aKDGagFWgXEz3RJiDZ1M5ScdbhAuUWyhtrQryu/EhVDYgodNY9EvcxB+ORNkeonsKEx65nivUTdqtW2+OmQzoYv4zrnDoO8led2exg5Z39g9jkUbI6TUsOxGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791265308; c=relaxed/simple;
	bh=EdJnnIUP5DR0UYTWrM/GJf+b8Z08YwDa5N6Bwcq4d1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxjwEcTcOxM9Fv4dn5iffdT4w2WaS06DuG16fmIeja3b/LezLIiAwjwpT5hOMa0upJVAU4C02iz5T5MBwzlUt+aXbMFM4e3cR/ph6tLbQPTE2eujd0zYfhvnLLCDk2AIuVDnPlndFjRAZ+iZlAd8rU5nceXKS0+fEefYftcrnS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hojCvMAN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hojCvMAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1801F1F000FF;
	Tue,  6 Oct 2026 05:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791265306;
	bh=qeTow55ZtVSQZhgqmBPLp9ANymDlH+OFFye0kOzCTLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hojCvMANgTmZWR8h76Qog4v0KiGiFoCFLE8TsEuRuVn7VmzPGVHv0vJBdXNWnYPKZ
	 uNJRxDo23SuYGlYcPK1MbExm3Yu1qHCxpE3FrTD/2tnujEKMV2OABsq93UCnrYoOOz
	 x57cykAVJu7PngH+qqL3vpz6zAdZQuKOYUIjDG3o=
Date: Tue, 6 Oct 2026 07:41:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Roman Gushchin <roman.gushchin@linux.dev>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Thoughts on Sashiko reviews for linux-usb
Message-ID: <2026100602-overtly-scaling-3153@gregkh>
References: <asRCTFE6gFlHBIu6@vbox>
 <2026100647-stilt-mongrel-b368@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100647-stilt-mongrel-b368@gregkh>

On Tue, Oct 06, 2026 at 07:03:14AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 06, 2026 at 12:45:15AM +0000, Thinh Nguyen wrote:
> > Hi all,
> > 
> > I'd like to get your thoughts on having Sashiko send review results to
> > linux-usb for patches posted to the list.
> > 
> > I started looking into this after receiving a reference to a Sashiko
> > review for a dwc3 patch that I wasn't Cc'd on, which required me to
> > track down the review separately to understand the feedback.
> > 
> > Sashiko is currently configured per mailing list, so any change would
> > apply to all patches sent to linux-usb rather than a specific subsystem.
> > 
> > Would anyone object to enabling Sashiko reviews on linux-usb?
> 
> Not at all, want to submit the pull request to the repo to add it, or do
> you need/want me to?

Now done:
	https://github.com/sashiko-dev/sashiko/pull/651
but I don't know if that adds a "will email back the review" workflow
for patches sent to linux-usb@vger.

Roman, it looks like the sashiko.dev/email_policy.toml file isn't in the
repo anymore, or at least it's not in the git checkout that I can see.
Does the linux-usb list need to be configured anywhere else as well?

thanks,

greg k-h
