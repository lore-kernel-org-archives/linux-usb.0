Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EEB30677B
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603239; cv=none; b=rdK2Z5tpnwtwSiEiSE681unq9zuvE6eYz+dLgSzRYXLlHIBZVYtg7c63BRn/8oi6dcUTlHI9ne5DZUz3rp/F/OwIfVhLd7q6rdxdKXV/w6vczd3aPgzRCE01iDA0XXkNQV/adkItzx31OOHbqLAuO+qEHlVQ1SKJOXYJfOaMfYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603239; c=relaxed/simple;
	bh=4Myxajr584GTYSshA9ty/cEdvgoP78XY9dv4mQAaM0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNBLFAnkqPbEWsez9JN7YXnLJpAh2SxsrZVFbtuvXXgSBkrYn1ErCW76DwXh2dGFeaWa544nisSxRUbL1TGKEoos4K55hFNiKzwvqHQlMSFfW74uxewiIsXrvTqyIgzeDPBsd1e+DqUXhOE5inDn/3/sXdg46825L88eOzYu/8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sivpY4GK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sivpY4GK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D059D1F000E9;
	Tue, 16 Jun 2026 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781603237;
	bh=mf2Vlt80PehLEaUJP6y4XMfV9Yc/cI23jUO2Ouf0eDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sivpY4GKDhET8NX8vHCxmLHxXHNmEZhr/QozamY3FucaLoufk0muXyxgGSkuizsQH
	 TyFHCqaGeqT63WObdxUSe70TZw8IwrVWnnggQOvEkn1tjCtoMs7UJ5x0+5B5iUCs3j
	 ur1o2d8xy5pM5NvVZhhywB7iSj4NlMPMWR5bn2/U=
Date: Tue, 16 Jun 2026 15:16:12 +0530
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: chaitanya.kumar.borah@intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] xhci: dbc: support runtime suspend while DbC is in
 enabled state
Message-ID: <2026061602-underfed-glue-19b8@gregkh>
References: <20260616080932.2229237-1-mathias.nyman@linux.intel.com>
 <20260616080932.2229237-2-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616080932.2229237-2-mathias.nyman@linux.intel.com>

On Tue, Jun 16, 2026 at 11:09:32AM +0300, Mathias Nyman wrote:
> Allow xHC to runtime suspend if DbC is in 'enabled' state for over
> 15 seconds without a connect.
> 
> Idea is that every time we go to 'enabled' state we make sure DbC runtime
> pm usage is '1' and save a timestamp. if the event loop still finds DbC in
> enabled state 15 seconds later then it decrease DbC runtime pm usage by
> calling pm_runtime_put().
> Enabled state is reached either when DbC is enabled by userspace or a
> connected/configured DbC is disconnected.
> 
> When a connect is detected we make sure DbC usage count is 1.
> 
> If DbC has been in 'enabled' state for 15 seconds and DbC usage is
> decreased to 0 by pm_runtime_put, then the whole xHC controller may
> runtime suspends to PCI D3 state if no other devices are using it
> 
> DbC sysfs file will show 'suspended' when xHC is suspended and will wake up
> and enable DbC at cable connect, or when user writes 'enable' to the file.
> 
> This patch was originally part of a larger DbC series, but dropped before
> the series was submitted to 7.2-rc1. The series has a locking issue in
> commit 520058b73ba3 ("xhci: dbc: serialize enabling and disabling dbc")
> which is also resolved by this patch
> 
> Fixes: 520058b73ba3 ("xhci: dbc: serialize enabling and disabling dbc")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  2 +-
>  drivers/usb/host/xhci-dbgcap.c                | 60 ++++++++++++++++++-
>  drivers/usb/host/xhci-dbgcap.h                |  3 +
>  3 files changed, 62 insertions(+), 3 deletions(-)

No "reported-by:"?
