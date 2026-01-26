Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9620D302741
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 09:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769418386; cv=none; b=malBTHyHm7OXvlCEokVd6RnlyC5lDWTck8xTYh+ACVFxzw5QWPJtHX66/s9/KE+1Bx6rHaq1Ow6j3pmBeZtz3+bSZGOPnb+63W78fCy1thWPw1APuMxoF4hh5rTVvF10tb58HZGzJcycoU5bqhMe2a2iwSU/Gg7VMHtqkSLuOUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769418386; c=relaxed/simple;
	bh=xoZqsEbba1Wqtg/ZA6A3r2unZRX8/UGbw4Hev3mQRmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1uc1d5fe095EilZOrjfjKZAE+XKh3d9sLHcTLXl17vpyWKGVeDpVw4gaXgc/2NAMOcH2dcVY/eIwlwxhoWCdHIaz8OBs3WdsWr62rP2Vhs7TrUBcMKU3VWGmp01w88ezR6hC0PJgUfYHUhYgjUTXhNJOMXV4nJvzAJzy7ZGZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SL22261T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SL22261T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A976EC116C6;
	Mon, 26 Jan 2026 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769418386;
	bh=xoZqsEbba1Wqtg/ZA6A3r2unZRX8/UGbw4Hev3mQRmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SL22261TYD/2+CFSAyvaPrEM8AwjsXu/pjdA2Q/TkaFMzaZZliB/rXrP3//LZYtQL
	 nmPN0FENqerh8hV8nVsvaXiQUzoDovnatBoO1j4zCILNzc3W+T80zngxUjSDY9EHpm
	 OsjZoVI2688pAYaBTtSxil6CKhIyl8ulwZkc1mWs=
Date: Mon, 26 Jan 2026 10:06:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: kenny@panix.com, linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com, michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com, zhanjun@uniontech.com
Subject: Re: [PATCH v10 1/2] usb: xhci: refactor IRQ/interrupter plumbing for
Message-ID: <2026012607-seducing-serotonin-f0fc@gregkh>
References: <B08F9D33F619A2D3+20260126085523.799849-1-raoxu@uniontech.com>
 <0D5BB0174F3D24D9+20260126085812.803496-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0D5BB0174F3D24D9+20260126085812.803496-1-raoxu@uniontech.com>

On Mon, Jan 26, 2026 at 04:58:12PM +0800, raoxu wrote:
> Prepare xHCI for multiple IRQ vectors/interrupters without changing the
> current behavior.
> 
> Introduce a per-vector irq context (hcd + intr_num) to use as request_irq()
> dev_id, and track the active vector count in xhci->irqs_enabled.  Use this
> single bound to enable/disable interrupters consistently across run/stop/
> resume and to sync/free IRQs.
> 
> Legacy IRQ fallback also keeps irqs_enabled >= 1 so interrupter 0 remains
> functional when MSI/MSI-X is unavailable.
> 
> No functional change intended: still uses interrupter 0 only.
> 
> Signed-off-by: raoxu <raoxu@uniontech.com>

We need a real name, not an email alias please.

thanks,

greg k-h
