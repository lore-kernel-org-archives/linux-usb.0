Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361A038B140;
	Wed,  8 Jul 2026 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511420; cv=none; b=JJgv58LazfgsYo8TNX65wWNoX48dlGOIlTEfCsx2shpT1IGPloYLQK1ZS5VNm/J+2MwXEshtV5n1BKBdtuTPOpCYSFBPmGzWMfsnsNlIt+CeIJ6zyJwFrJfCTYMSnrjqGeNTNHkjELDJhzCEHz+zaaXKHmlRL/UFWj6Q4W4UDsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511420; c=relaxed/simple;
	bh=raKzsdQywYv3wPJd3W78LmhK2Ka/ddYy6YZ/ZyYfeeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7GDziXVphpArYRx6S5K08ugYe4S5t0ezvv5ydCLbU+ZNH6sI9H5JGhXqujDfmyEhNS6xQU6g/MAfAyFygNrKowI9fWPtI5wj8Oyvh1axFSaygUlmWw099RE5Avl8lXzAYdpmcad9DPPp/Wkyfa5OmYIza9ZpbhBe1169Vi6mDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W2vLHuCn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W2vLHuCn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615F41F000E9;
	Wed,  8 Jul 2026 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783511418;
	bh=tElwMpip4oddGcAAXGTOz8cNEFe0oLbAw/y117waMOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W2vLHuCnzFQ8OeTikq7fL/XNVNwLrbtGYsdPlkzu6Hh7J5v5/CamHlM0cxnxou1BD
	 D914Fn/dKhYuXwjkYsZPQBzuaTeykuDd93WFW3C7FlMcDvb1i9IhpUv/Otu94xHOJ9
	 Q35JwTbZZPnhNXZZ2bNK0guLeaoY8ljEjpW3KNO8=
Date: Wed, 8 Jul 2026 13:49:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: sideband: add missing kernel-doc parameters
Message-ID: <2026070849-dollhouse-overarch-f74f@gregkh>
References: <20260604000442.15679-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604000442.15679-1-rosenp@gmail.com>

On Wed, Jun 03, 2026 at 05:04:42PM -0700, Rosen Penev wrote:
> Add @imod_interval and @intr_num to
> xhci_sideband_create_interrupter(), and @type and @notify_client
> to xhci_sideband_register().

Why?  This says what it does, but not why you are doing this.

thanks,

greg k-h
