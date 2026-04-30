Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9566365A19;
	Thu, 30 Apr 2026 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777568009; cv=none; b=VBe9BB0GYKoqS/Z/Bn2CILWvMALZugGzigMXMG9ANp/VpbYq8rxnwmIDEUGScqHISi2Jt25la2RG0Y7JmOwNR5+Jv2L6fw+KUkRqUXZAAwP/igoCXdmIanXhy3DE5xrVKsLnWp9oq/mq4endQ0L3Px25mcrPkgkeQMNy6TzuR+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777568009; c=relaxed/simple;
	bh=6w4iw2zeADltB653674XblRvf+VzLBCWAhzSrkTyIYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc8K2G+6Eal3TpomyJz4KEzq27jManzxD3ut7uU3gUTT10vU1lQbSAT8MEcxIHJOBcG5dV9cmzISnFH7FtjiT8kxx5M02ve1LQ8yhWAZ5xdul0Z+OCi+FExe40A8vyPHF0j8klzcFu5vLGL7+4Wbz6Mgp0I3Dlo5anWnL4h7fYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YczDOytn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YczDOytn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5421C2BCB8;
	Thu, 30 Apr 2026 16:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777568009;
	bh=6w4iw2zeADltB653674XblRvf+VzLBCWAhzSrkTyIYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YczDOytnbHOog3TjPbkM00wBTm9uVWcmzIEhrktmXn9L2VwRx+guepvsOhfePyoOo
	 pWZSxgu2MfGIZ/sDR7wPlrnddAvuZda1R1AH8KznjCxDIebL2aWrx75nF/20p6jbmX
	 ELqnxBz7IToZxa2YcVXlNHV0VU/VB5EZrpcclusI=
Date: Thu, 30 Apr 2026 18:47:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: SnailSploit | Kai Aizen <kai.aizen.dev@gmail.com>
Cc: linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	balbi@kernel.org, w@1wt.eu,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	SnailSploit | Kai Aizen <95986478+SnailSploit@users.noreply.github.com>
Subject: Re: [PATCH] usb: gadget: uvc: hold opts->lock across XU walks in
 uvc_function_bind
Message-ID: <2026043055-atlantic-boots-cc28@gregkh>
References: <20260430154104.61633-1-95986478+SnailSploit@users.noreply.github.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430154104.61633-1-95986478+SnailSploit@users.noreply.github.com>

On Thu, Apr 30, 2026 at 06:41:04PM +0300, SnailSploit | Kai Aizen wrote:
> From: "SnailSploit | Kai Aizen" <95986478+SnailSploit@users.noreply.github.com>

Again, please use a real name/email address.

thanks,

greg k-h
