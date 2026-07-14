Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA46B3DB31D;
	Tue, 14 Jul 2026 06:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010624; cv=none; b=gfGoosDUZiRN7Jp2surFesW8fFJFCCbdcs694JUcrl6XPa4sWxynCBxSec0bP8Osqy2K5FpvPU0yh4Fp+RXNDj+0cXsXCL5YHmnOaU+nAtqIQ/G2Pd5lK9rpcRRtuc1Gm48X/8bbUJ7s946C13fqgXG7zbuh6dKQLlclzf6quI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010624; c=relaxed/simple;
	bh=QDHPA35FMcee2MX1w4FElgTAtECUUfEnKq6LV/eQL+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chclttTCsJv9QudkLrtcvso5D0rzHqZlQAQa+koU+9w+Mnr3OVuYufLH+fC8EdTU/BHMQyALZAKcmyvlCphN4iUzVSH0n/wSaoSw8GnE0PqmGm8KeR5XL5oK+J3C1wrJHvqIjYmKxIfRg6n1Q8txB748bDShtmncPNX6mW8bas0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hyI01+qv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hyI01+qv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFC01F000E9;
	Tue, 14 Jul 2026 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784010622;
	bh=REW7MRXqjAkC+tRQfUCHMxql6Vo26tbSR/lrmGj51AI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hyI01+qvgnu+6Z5hTu50MU6AmkCuGz4YKMy0O4SZ2dfWC+0pDmFKyFwYjX0ncUqWe
	 j+MgrgiF3R7hgWO23MLA1FJR13UFdmRvWBX4BiV4fLCSuWXgS4YHZccrgnOQTygEed
	 xaOhaObElrq4MQNU9ld/ddEFgAH9zE9d+PwN/tXM=
Date: Tue, 14 Jul 2026 08:30:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: core: strengthen size check in
 usb_parse_interface()
Message-ID: <2026071438-emptiness-judgingly-4a1c@gregkh>
References: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
 <20260713-usb_core_patches_1-v1-2-7721c2b33f53@kroah.com>
 <b2498cb4-61f7-429a-920a-e27ecd7986e4@rowland.harvard.edu>
 <2026071406-ambiance-rogue-39bb@gregkh>
 <f298dd66-987f-4e37-ad26-621dac5b5d1f@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f298dd66-987f-4e37-ad26-621dac5b5d1f@suse.com>

On Tue, Jul 14, 2026 at 08:20:32AM +0200, Oliver Neukum wrote:
> 
> 
> On 14.07.26 07:53, Greg Kroah-Hartman wrote:
> > On Mon, Jul 13, 2026 at 12:13:04PM -0400, Alan Stern wrote:
> 
> > > No, because usb_parse_configuration() has already performed this check.
> > > A malicious device can't avoid that earlier check, and so we don't need
> > > to do it again.
> > 
> > Ok, this is my fault.
> Speaking about fault here isn't likely to be productive.

But it is cathartic :)

> The error is easy to make. I made it once. We have the power
> of using comments. That place needs one.

Sure, which place, usb_parse_configuration() or the other parse
locations or both?

thanks,

greg k-h
