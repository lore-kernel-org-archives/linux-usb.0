Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648734B662;
	Sat, 22 Aug 2026 10:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787394926; cv=none; b=YwiVVpGS6UQSOGP1pykFT0c5bVQGdBDRToot64lAP6pCZtVZmUPh+KZwE5Fi+PBOsh/uxYTUwzZ1T7Fk7Q8XGIZ9gsn2y5aOnH2tZsX15EKLSyM3BiKmDZxQvnw79fyLNYxSdQekBqFQ5IQpMGOkyvHRMDZY/w7g7TuoD0lZDuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787394926; c=relaxed/simple;
	bh=5xcBYyXkGh5ZzUlPGhM6n3W19BUQH+6fltaT8eDfRtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeCsmycfvV6YxOqsPgFJ/W0J3ICnDu0UkqQ5+Xcd0gKUr8w7Avc3A+5qEygFOdjganVA5LFPeMXUFqemUBEVmcMZi4GAmA2F2AiM04mHtrSP0NVPecTri55CFGuHKffTkBeiVebDwHOgn+e13ApywobryftqMFxS68GNzfHCa/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fIm1PUGC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fIm1PUGC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CDC1F000E9;
	Sat, 22 Aug 2026 10:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787394924;
	bh=8QhddWY6sGXYqxFzZkBHBmltsRym02fO16NW0dy/Tms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fIm1PUGCwKqmbP19vB1XMONdnFt7fylJv9hMGm+7R9ceIjM7QAdGQjOZ+sKpNVpaR
	 vujBPSED+dGZ3SV02MvhYTuZQX6GM8uN1DQX3PM5G/GZkkmBhEmCFQr99hSzI7j2Vi
	 2CfWuM+YabnaOPXntEP2IcnDO+RIwCfywUkxLCKI=
Date: Sat, 22 Aug 2026 12:33:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: erdaitianjiao <erdaitianjiao@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: validate CAPLENGTH in xhci_gen_setup()
Message-ID: <2026082229-alkalize-animating-bd24@gregkh>
References: <20260822102357.4634-1-erdaitianjiao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822102357.4634-1-erdaitianjiao@gmail.com>

On Sat, Aug 22, 2026 at 06:23:57PM +0800, erdaitianjiao wrote:
> xhci_hcd can be bound to arbitrary PCI devices via the
> driver_override sysfs knob. When this happens to a device whose
> MMIO registers are not xHCI capability registers,
> xhci_gen_setup() reads CAPLENGTH from the foreign register
> layout and uses it as a byte offset to compute op_regs.
> 
> A non-xHCI device can return a CAPLENGTH value that is
>   - not large enough to fit the capability register block, or
>   - not 4-byte aligned (e.g. the NVMe CAP register's low byte is
>     0xff, which becomes CAPLENGTH = 0xff).
> 
> The unaligned case is especially harmful on arm64: MMIO is
> Device memory and Device-nGnRE accesses require natural
> alignment, so readl(&op_regs->command) faults with an
> alignment exception even when the address is within the
> ioremapped region.
> 
> Validate CAPLENGTH in xhci_gen_setup() and fail probe with
> -ENODEV if the value is smaller than 0x20 (capability registers
> are 32 bytes per the xHCI spec), not 4-byte aligned, or leaves
> no room for the operational register space within the mapped
> region.
> 
> The run_regs_off read on the next line has the same shape, but
> is not reachable on the xhci_halt code path and is left
> untouched here.
> 
> Reproduced on a QEMU virt machine with a syzkaller repro that
> unbinds the NVMe driver on 0000:00:02.0 and binds xhci_hcd via
> driver_override. Before this patch the kernel Oopses and
> panics; after, the probe is rejected cleanly. Ran the repro for
> over two hours (66,709 consecutive probe attempts) with zero
> Oopses.
> 
> Reported-by: syzbot+c90273bf9017ef1462af@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?id=44c85514940262c7e2fad6f8fd0c07d8f2884154
> Fixes: 552e0c4f12fe ("usb/xhci: move xhci_gen_setup() away from -pci.")
> Signed-off-by: erdaitianjiao <erdaitianjiao@gmail.com>
> ---
>  drivers/usb/host/xhci.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
