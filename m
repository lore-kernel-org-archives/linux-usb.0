Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6398443DA30;
	Tue, 14 Jul 2026 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031561; cv=none; b=j9N/G6bSBwCWR9gvL/0bKrDRMnzsSsL7n8Et31vTwpjr+q8lNj1XKuXt5TR4FRrhk+vK3uQ8wQhbWFqr2lcbaeY4S8EWjxEP4kSjqix8DxxzIFEGP2TwqtDAjrsoeXg4lrg9uQ2o+Hv1WePGcGgBIbZLG0/XAQ5Mtcoo/umM56U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031561; c=relaxed/simple;
	bh=JLrvepMl0KQc2Csf9C+SKBDfV8CvZSKZLPmRKY2tDgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRJj4vywrBoTpcDIJHeJ73bptXiBRN3BWOm6TAjHPwezKtwo32zu81zgkKn9Ex90lnaw2WsVOTZLN1Z3IM+ArZLOrZuKfvkUoHEvnmWkZJ/8nYwTdy65d/zWoroVL3nvZe2dp/IR8sw83DSxwGJAPwdB/H1VmUE09v/00F30/kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JDfUGjGQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JDfUGjGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4531F000E9;
	Tue, 14 Jul 2026 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784031558;
	bh=hNG9FdmuIacDWwU4qhmyGLhPvhvl8zd1Jie2Xq+xdIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JDfUGjGQRvb8S1aaWRPMYX7DsiGfJz8204Kk5vIdyKqLSvRa09VBjoh/g/QbofVxP
	 XZ9S+LxWVtRfsGlFOzbH78pP7/+ZqkvbU0QxnOPphcYaJB+J9o9M92MMfbgb//b7Xr
	 lvbC8+JztF3s7BRoEKu938TJURf/DU5/8oG+UpBI=
Date: Tue, 14 Jul 2026 14:19:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sunho Park <shpark061104@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] USB: serial: io_edgeport: cap received transmit
 credits
Message-ID: <2026071451-perennial-salad-1068@gregkh>
References: <20260714104230.893968-1-shpark061104@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714104230.893968-1-shpark061104@gmail.com>

On Tue, Jul 14, 2026 at 07:42:30PM +0900, Sunho Park wrote:
> The interrupt-status packet reports transmit credits returned by the
> device. edge_interrupt_callback() adds the 16-bit value to txCredits
> without checking maxTxCredits.
> 
> edge_write() uses txCredits minus the software FIFO count as the amount
> of data that fits. Since the FIFO is allocated with maxTxCredits bytes,
> txCredits exceeding maxTxCredits can cause OOB write in ring buffer.
> 
> Cap accumulated credits at maxTxCredits. Conforming devices should never
> hit the cap.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Sunho Park <shpark061104@gmail.com>
> ---
> V2 -> V3: Added missing revision history (no code changes)
> V1 -> V2: Replaced min_t() with min() 

Please slow down and don't send patches right after each other.  There
might have been other review comments...

