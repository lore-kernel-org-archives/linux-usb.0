Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120FD3D953D
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117924; cv=none; b=HBhRXT048B6Lu+8ymFeU6ub8ttw+AOn+V+Gkfs/jjQthffKgJlEpOYUL/TfEkPHD77gTVI/+wtIOddX4CprvhR2yGdruvlkrLfEua3m8F5LRNAzgJstwDI8zgqrHdnouComjrwWIo4Sou6HQ8NeUhnF+7Pip5s4SVnIFXUCtfOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117924; c=relaxed/simple;
	bh=OyKdifc9oTAwXhJYfWgEe5xHS+L45ctUVIgWY5scJtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XF5qw4SQCm3LYfK0Ir5ihUAEFunvUuz/+xsS0bp9YxMs4FXmrfMuwWTk4Tity7k2pwYAaADXdJbQpihSst1T9wGbsZv861Edl4xgTirBr2PsKw1ZXDaHg9PCZbdQbNjAYVrzxFvUxX01Mt51OUvHGWFZKVngiGmDNQj+xu2pIKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgkCoFFO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgkCoFFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983EE1F000E9;
	Wed, 15 Jul 2026 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117922;
	bh=sj1QvAl6lcs0/fAJLPzbbSVAKNVgPV7WhJueE2Ib5hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XgkCoFFOh532ZfuTZuzc7186WUkEBGeTknGLdXrMKN1HJwT4y9TEBwWHck9FNOGqx
	 eg6jL4hLh1FUB9MOMpMGHNd/XxEUmTvRKse7PYUKFwF87XJVBvvwQRgzZUFTghWsgU
	 0IIt+TruUrUD9PViMRwkdMff/kgzWcghXf54XS4QCl6w77yRnnwEmUUXCd7BiMBQpA
	 L4aKsBNM2HhncnmLg4xmWu+67S1/IfPOB+atDray81JAoGwiZ0rVrvjZwqyghbiFpC
	 SFbl0dfcdRidy2JlBrb4iEN5lw5IisP9seHbsSBJVZuWhagBEEo8dop+CBf4oAHsKt
	 vZccs36YGtVvQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wjyZU-00000005xCg-123c;
	Wed, 15 Jul 2026 14:18:40 +0200
Date: Wed, 15 Jul 2026 14:18:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, jkrshnmenon@gmail.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: sierra: deal with insufficiently long
 notifications
Message-ID: <ald6oCb3Y2lLvJJ7@hovoldconsulting.com>
References: <20260714183305.1331363-1-oneukum@suse.com>
 <alc1KYBzqiOWUx4u@hovoldconsulting.com>
 <a410147d-29f7-427d-a8cd-bff0397f1988@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a410147d-29f7-427d-a8cd-bff0397f1988@suse.com>

On Wed, Jul 15, 2026 at 12:05:10PM +0200, Oliver Neukum wrote:
> 
> 
> On 15.07.26 09:22, Johan Hovold wrote:
>   
> >>   	/* Resubmit urb so we continue receiving IRQ data */
> >>   	if (status != -ESHUTDOWN && status != -ENOENT) {
> >> +skip_too_short:
> > 
> > And please move the label before the conditional and rename it after
> 
> That really makes no sense. If we encounter a short packet
> the status must be good. We wouldn't be allowed to look
> at the packet in the first place if that weren't the case.

It makes the code cleaner by not adding labels inside a conditional.

And we don't care about that extra status check in the theoretical case
that a malicious device ever sends a short message.

Johan
