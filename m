Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26902367B8
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 05:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262998; cv=none; b=C0vvj8Xu6tPSL+ZhZ0ObkzC7Mb1S161dtfqEIsqd8zfgvjuqGoIZKN0abNZ2HGDHPfVnKD2iGQfejNDyhZ738I/GMNbDtifbH+9DKG9e6GZv+YrwxRVoofLs1aN/EWnB9SUfjUuC4/BUaYI1Xk/jb1MBlAUG/3SKQOAGaMy+fAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262998; c=relaxed/simple;
	bh=lBmjY0i7001K3L8T8ZZrhYv9yw6huomZoev+FXftu7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp58srRBM+f5jNMM3J2InBZDZviYyrFYqRoEzn4GdrmVzW/jdzj+8bQMAWWzHRCRDrWaQwt0M+0LH3yIBLwEwAmVhohCE8bD5gTm43+Vp7otR2vjr+zcvCi/4TmZ056K11lB0rvHK3CQVf3ke8c/7v9c6Pr02yWLKUIdznqilAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EVtHorSu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EVtHorSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC931F000FF;
	Tue,  6 Oct 2026 05:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791262997;
	bh=3pUjN8J7ZIF8B1i4sZdZtxykmfQ2LfACbU8tSMR3ZZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EVtHorSuiSQoxQh8TS8CCHNm31bWFwfDNlGUz3n9l3P4giLDkZIlt65m4wcQSbkLv
	 fL8+pTQmbSkmVbrGmqzMGu7KFdP28fkQf00Gb90q6nuwzFSBrzeb6bJ8JXqOnsNFrA
	 +1U3KFTy7Eub4Vnjb1Vj/+oOyk61WROyFCAwTpJk=
Date: Tue, 6 Oct 2026 07:03:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: Thoughts on Sashiko reviews for linux-usb
Message-ID: <2026100647-stilt-mongrel-b368@gregkh>
References: <asRCTFE6gFlHBIu6@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asRCTFE6gFlHBIu6@vbox>

On Tue, Oct 06, 2026 at 12:45:15AM +0000, Thinh Nguyen wrote:
> Hi all,
> 
> I'd like to get your thoughts on having Sashiko send review results to
> linux-usb for patches posted to the list.
> 
> I started looking into this after receiving a reference to a Sashiko
> review for a dwc3 patch that I wasn't Cc'd on, which required me to
> track down the review separately to understand the feedback.
> 
> Sashiko is currently configured per mailing list, so any change would
> apply to all patches sent to linux-usb rather than a specific subsystem.
> 
> Would anyone object to enabling Sashiko reviews on linux-usb?

Not at all, want to submit the pull request to the repo to add it, or do
you need/want me to?

thanks,

greg k-h
