Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF603793BA;
	Tue,  7 Apr 2026 05:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775541517; cv=none; b=Ap6IeRroxTP/3fz7Z6q21lmvhyVIay7r2wnq6S1mckj2Rzar2yImaC4kBiQBrJAJgHGz1hO4/I97J1i6zK9jXKrAJ3TSsdGCYzWfWDSfX3Qp6Y4J7xzpXCjY3j882+OSY44pPFY6vyJ03YcCGl3fFjxRnEvgNUc5DCilT6TDpME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775541517; c=relaxed/simple;
	bh=SRb6lI5vuZhiKmrZDP02LO5nBA4m/THZfSQ65DXCk0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+TgwXalG8+hLyiA23SzoSMm0jhpjdq90i0B189jCdDthwV7jbbAPNYRu2HEF5uXHUKKxYNMcGqWmHiSglFHMUqRxBGqU7yDge5OkJ2hczY03KaJVOBLMQEKVbvs5CrxaIjBEpLnveXsF8N4FsF1sMIKiYxL1Nsw3prRDIyTivw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zJypJSm/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zJypJSm/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61460C116C6;
	Tue,  7 Apr 2026 05:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775541516;
	bh=SRb6lI5vuZhiKmrZDP02LO5nBA4m/THZfSQ65DXCk0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zJypJSm/mRlg30KMDoBTaJRyipzMkzlBaDFGuwlL0BMUSji0d3P+pHKeFMQC95Ec8
	 +PXAEOpt55TJbMCYoiMOho4hOHGvXDzV0qRI/MxWA1rdSfoM2MhiEEjZOapDujZKPp
	 A3Yr7Hyo/eSTJ34Zz/CK1NyvSFXYgCjlNiH0vUqg=
Date: Tue, 7 Apr 2026 07:58:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: Spurious errors "ucsi_acpi USBC000:00: bogus connector number in
 CCI: 1" on 7.0-rc7
Message-ID: <2026040734-headfirst-tingly-e6ea@gregkh>
References: <875x63gwid.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875x63gwid.wl-tiwai@suse.de>

On Tue, Apr 07, 2026 at 07:38:50AM +0200, Takashi Iwai wrote:
> Hi,
> 
> since 7.0-rc7, I'm getting a few errors
>   ucsi_acpi USBC000:00: bogus connector number in CCI: 1
> at boot of Thinkpad T14s Gen 6 AMD with a dock.
> 
> Obviously this came from the commit d2d8c17ac01a ("usb: typec: ucsi:
> validate connector number in ucsi_notify_common()"), and reverting it
> made it gone away.  I didn't notice anything practically broken either
> before or after the revert, though -- the USB devices connected on the
> dock keep working, at least.
> 
> Is this a firmware bug, or some missing piece in the code?
> Judging from the message, it means that ucsi->cap.num_connectors is 0,
> I suppose.

Ugh, what's the odds this is an off-by-one error in the firmware? :)

Nathan and Heikki, any ideas?

thanks,

greg k-h
