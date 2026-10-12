Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8763BFAFA
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804375; cv=none; b=i2eCP2Lak6aBDUwpTAN6lupLVpMj+xxnDGwY9AO+MduYcK/KZBMTcVJ5sV9S+cfSfwv/8JR/KRjFwx/XxH9Ki44/ezz67q4cEiIsbwSJDkt1hc+l18AOvf20bs8rqQXKXgSFGr0C4RVfPoE+m/K9laJzH432RCSB1drSYt50i8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804375; c=relaxed/simple;
	bh=/2HWb3BmEgAjFs+GtCT4wyFhcCr3PF7OXI+2vEhvftg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVBHSIfbfjZ1igG8BRYPr6tRBdadgR+cqckhaWpPn0mDRtjz+NskqUmY/lY/lfDVa4ndY3FJzRB+Ud0ncDJE1RnToH1ITYlIPEXd26iPAA9M7xvkfoje2B+L6FmWyvV3lkKdXB3DPAG6FzipIrSvXjdY4nfhojhhH6lptJFdPFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YX1ubx81; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YX1ubx81"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983291F0089B;
	Mon, 12 Oct 2026 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791804373;
	bh=/2HWb3BmEgAjFs+GtCT4wyFhcCr3PF7OXI+2vEhvftg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YX1ubx81pXnQnhS3VYGQsEIy7j3ptCsqbT/gkk7gDcIJL6BtKJkGrd+V6udbXcxTR
	 dw6o+uaAG+1Bf+uHMdGZQeGtRc2jMlXuROuz5pBp05D+wtVs0qFrQD1TRO//Au24t9
	 HPLXxcINONAfZ2qmmMwqQHTGZecDbASou2vyo0gI=
Date: Mon, 12 Oct 2026 13:26:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-usb@vger.kernel.org,
	syzbot <syzbot+de553c19cb054f174a35@syzkaller.appspotmail.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH REPOST] usb: udc: Make tracing aware that
 usb_ep_alloc_request() can return NULL
Message-ID: <2026101222-retention-pecan-0061@gregkh>
References: <20261012094911.wHPc_9lJ@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012094911.wHPc_9lJ@linutronix.de>

On Mon, Oct 12, 2026 at 11:49:11AM +0200, Sebastian Andrzej Siewior wrote:
> The alloc_request callback of the EP can return NULL if it was not able
> to allocate a request. This NULL pointer will then be dereferenced by
> tracing in order to show details about it.

When does that happen?

> Let tracing check the req pointer and if NULL just write 0.

Why not fix up the calling point and if req is NULL, not call the
tracepoint as odds are something went really wrong at that point in
time, right?

thanks,

greg k-h
