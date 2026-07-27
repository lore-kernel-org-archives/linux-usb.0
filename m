Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C52302753;
	Mon, 27 Jul 2026 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161991; cv=none; b=rHpIG5184vI+0fpOCfNMNm8gB3hUPfLtSbtbRpahubiTtw9u47ZIXc6wzopSMEiJn5CRkGD6iLjzR8KR4ipQE55iLDKs7v9H2d+bWQj5zRctsNGCmJ64MLcLW0VOgB7nxKJy+XjTHhVN9v8BTv++xeE8EHUgE+PpA1YVYl8NvBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161991; c=relaxed/simple;
	bh=V9p2YWwy+qDp++oEzl/SFUPoEgtrzmfwQYJdAYRgwns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mr2HbbNxQb5TDPnfpxankPz09ARV5jqXwsBJAudUgqqn5JLKNKIagftjNDBzSLWpMQXqCbKhpRLnZgDpd5NEeYBgH5CTb9zVuy1/3IVbgXVKfUbNNL0JYKDsZkPdJR6UAeHe9ESg7rTZz36ky387XOOVgUamINu5NkeSQDaAeSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTqEAzlR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTqEAzlR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785161989; x=1816697989;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=V9p2YWwy+qDp++oEzl/SFUPoEgtrzmfwQYJdAYRgwns=;
  b=GTqEAzlR/CEAllMyoTB14bERU4tSksqZSRDp1DgdNoMNfOcNJg6l21zo
   m4KD2ATTpLAHSngjyOWlm93zP7lU48s05LPCpCT4Hyxcg4Lj2RKrZCUUG
   C0brwXWOvOUawS9HA3bJP9tOUD1vHmVIPqmJgr9a2FTY5n6EfOFupc7Ft
   hI0Czx4ebAGWwaWOkex2ktq8SvzIQp+WflvqrmPbRqKWo+AZVuw7dP3Bx
   /R8WCVh7P0od2rm2LJgtqNX1SmlJmpXgiWjtUUCZ4EBr+MAsV0S7g2fHs
   qWVv7ezKCmdTt7pvedQ9kL4VS6B6+ykXgQvxB4fOdphgi3ZAJ4YzbFudF
   w==;
X-CSE-ConnectionGUID: 13rCGCgWQBSpOfPDqZuDAg==
X-CSE-MsgGUID: 0UYVJrUCTuqHuBg321TxfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="97104514"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="97104514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 07:19:48 -0700
X-CSE-ConnectionGUID: xxyaqvFQQ3erpc+oJfFetQ==
X-CSE-MsgGUID: a1AIrb0HS/itmtyAfYHiWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="258861289"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.171]) ([10.245.245.171])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 07:19:47 -0700
Message-ID: <2fd4299c-c455-497b-a122-5f94eeb9d1bd@linux.intel.com>
Date: Mon, 27 Jul 2026 17:19:43 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Restore MSI/MSI-X reinitialization on resume
 for RESET_ON_RESUME hosts
To: Jie Deng <dengjie03@kylinos.cn>, mathias.nyman@intel.com
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20260714090210.1201964-1-dengjie03@kylinos.cn>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260714090210.1201964-1-dengjie03@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 7/14/26 12:02, Jie Deng wrote:
> Commit 944e7deb4238 ("xhci: Avoid PCI MSI/MSIX interrupt
> reinitialization at resume") moved MSI/MSI-X setup out of xhci_run()
> into a PCI-specific xhci_pci_run() that is only invoked at probe time,
> and removed the xhci_cleanup_msix() call from xhci_resume().
> 
> The rationale (avoid redundant MSI reconfiguration on every resume) is
> sound for controllers that preserve state across suspend.  It is however
> *harmful* for controllers carrying XHCI_RESET_ON_RESUME: those hosts are
> fully reset on every S3 resume, and on some of them (e.g. ASMedia 3042)
> the MSI/MSI-X delivery path is no longer functional after the controller
> reset + D3->D0 transition.  Because the MSI vectors are now kept around
> unchanged across resume, the first post-resume command-completion event
> (ENABLE_SLOT) is delivered to a stale MSI channel and never reaches the
> CPU, which surfaces as:
>    xhci_hcd 0000:05:00.0: Error while assigning device slot ID: Command Aborted
>    xhci_hcd 0000:05:00.0: Max number of devices this xHCI host supports is 127.
>    usb 1-2: device not accepting address 3, error -22
>    xhci_hcd 0000:05:00.0: Error while assigning device slot ID: Command Aborted
>    xhci_hcd 0000:05:00.0: Max number of devices this xHCI host supports is 127.
>    usb 1-2: device not accepting address 3, error -22
>    xhci_hcd 0000:05:00.0: Error while assigning device slot ID: Command Aborted
>    xhci_hcd 0000:05:00.0: Max number of devices this xHCI host supports is 127.
>    usb 2-2: device not accepting address 3, error -22
> 

Thanks for reporting and debugging this.

Is this also an issue in runtime resume where system stays in S0 while
xHC transitions from D3 to D0, and is then reset?

Or is it only in system suspend, or in hibernate?
Does it matter if xHC was in D3hot or D3cold before resume?

Not sure if gating with XHCI_RESET_ON_RESUME is the right way as some of those
xHCI PCI hosts may just need to be reset in resume, but retain their MSI settings.
(xhci specs states that resetting xHC should not touch PCI config space)

This may just be a ASMedia PCI xHCI issue.


> Up to v6.3 the resume reset path did xhci_cleanup_msix() and, through
> xhci_run() -> xhci_try_enable_msi(), re-allocated the vectors, which
> incidentally re-armed the MSI delivery path and masked the hardware
> issue.  Work it around by restoring that behaviour, but only for hosts
> marked XHCI_RESET_ON_RESUME and only for PCI devices (platform/RCAR
> hosts using the same quirk must not be touched).
> 
> Fix: 944e7deb4238 ("xhci: Avoid PCI MSI/MSIX interrupt reinitialization at resume")
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> ---
>   drivers/usb/host/xhci-pci.c |  6 ++++--
>   drivers/usb/host/xhci.c     | 19 +++++++++++++++++++
>   drivers/usb/host/xhci.h     |  2 ++
>   3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 6b3fcba44b08..77b3215c95f3 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -126,7 +126,7 @@ static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
>   }
>   
>   /* Legacy IRQ is freed by usb_remove_hcd() or usb_hcd_pci_shutdown() */
> -static void xhci_cleanup_msix(struct xhci_hcd *xhci)
> +void xhci_cleanup_msix(struct xhci_hcd *xhci)
>   {
>   	struct usb_hcd *hcd = xhci_to_hcd(xhci);
>   	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
> @@ -138,9 +138,10 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
>   	pci_free_irq_vectors(pdev);
>   	hcd->msix_enabled = 0;
>   }
> +EXPORT_SYMBOL_GPL(xhci_cleanup_msix);
>   
>   /* Try enabling MSI-X with MSI and legacy IRQ as fallback */
> -static int xhci_try_enable_msi(struct usb_hcd *hcd)
> +int xhci_try_enable_msi(struct usb_hcd *hcd)
>   {
>   	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
>   	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> @@ -207,6 +208,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
>   	hcd->irq = pdev->irq;
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(xhci_try_enable_msi);
>   
>   static int xhci_pci_run(struct usb_hcd *hcd)
>   {
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 091c82ca8ee2..7dd3afcf6b2e 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1190,10 +1190,29 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>   		xhci_for_each_ring_seg(xhci->cmd_ring->first_seg, seg)
>   			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
>   
> +		/* XHCI_RESET_ON_RESUME hosts are fully reset on every resume.
> +		 * On some of them (e.g. ASMedia 3042) the MSI/MSI-X delivery
> +		 * path is no longer valid after the reset + D3->D0 cycle, so
> +		 * tear the vectors down here and let xhci_try_enable_msi()
> +		 * re-allocate them below, matching pre-6.4 behaviour.
> +		 */
> +		if (xhci->quirks & XHCI_RESET_ON_RESUME)
> +			xhci_cleanup_msix(xhci);

Ideally all PCI related xHCI code should be done in xhci-pci.c, like xhci_pci_resume()

In this case it's a bit tricky as msi cleanup and enabling is done mid xhci_resume(),
and would require a lot of refactoring to get it done.

Might need to do it this way first to get the ASMedia host working, and then refactor later.

> +
>   		xhci_debugfs_exit(xhci);
>   
>   		xhci_init(hcd);
>   
> +		/* Re-arm the MSI/MSI-X delivery path for RESET_ON_RESUME PCI
> +		 * hosts. xhci_run() no longer does this (it was moved to the
> +		 * probe-only xhci_pci_run()), and the stale vectors left over
> +		 * from before suspend cannot carry the first post-resume
> +		 * command-completion event on affected hardware.
> +		 */
> +		if ((xhci->quirks & XHCI_RESET_ON_RESUME) &&
> +		    dev_is_pci(hcd->self.controller))
> +			xhci_try_enable_msi(hcd);

Same comment as above

Thanks
Mathias

