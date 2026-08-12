Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22072F7F1B;
	Wed, 12 Aug 2026 00:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786493912; cv=none; b=VAGExgiGGv5cGhXq8SUoR6PlLM57P9ntvMm5nDe+pxtMCrfJqWUjWpnLkZfqPUU6BC5pPS9gxCksQ290s8UCxKf9wHfFKCv5j/hzEDPBdlRjVmTRYxKaUD4EkFJJ3xwTzuVDgrNCheaP9GcmSqrZ108ojaMT3eW+CHDRc0Sg+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786493912; c=relaxed/simple;
	bh=9AFnzOxbS0WIaXEtDBDqzEjA2xW8uZJrvsoRNhJ6ucM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcEtDWIjv47rqH7jaCvHUyMhmh8s19w9iYP2JIKo3IDciqB/kKHcS54MK4sjnpj2GEcLIKHNEBh9hRu2t45BOAnjW2uFZt4OtIWgJR572VgTX9CDnXUFttHOqWX2IjWfpZ4aMV4pZC/kYzfw/d2hB4FiOtmbAz6xNP2iJp2i6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pc98JJvO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pc98JJvO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFC21F00A3A;
	Wed, 12 Aug 2026 00:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786493911;
	bh=Fhohq0YeApVJZMAIKOTVHtLwtvMpDfkKYE3O8L336Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pc98JJvO2EZyEqEEqxWqEkJG+Lxk+0TMaCPWNnVfwycHtg2i/dxthyYpWf/QEKrfd
	 w3he32bksPDF9YZK+A5+1KIbkA43qX0tC+UdL87+n/bR1Xvh9Otb3NQFMc2UvXFpES
	 irXqTeguQmCMm8ZqJoGQXePcu5uwkeQir8Pd8y1U=
Date: Wed, 12 Aug 2026 09:16:58 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, troy.mitchell@linux.spacemit.com,
	peixin.xie@linux.spacemit.com
Subject: Re: [RFC PATCH] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
Message-ID: <2026081244-crushed-headband-dc5a@gregkh>
References: <20260811090817.109350-1-panjunzhong@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811090817.109350-1-panjunzhong@linux.spacemit.com>

On Tue, Aug 11, 2026 at 05:08:17PM +0800, Junzhong Pan wrote:
> USB controller runtime suspend halts the controller on disconnection.
> It relies on platforms with custom connection notification to start
> the controller again.
> 
> The host branch of dwc3_runtime_resume() does nothing currently. There
> are two paths that can trigger a runtime resume of the dwc3 core in
> host mode:
> 
> (a) Wake lands on the xHCI child (DT platforms, e.g. Qualcomm, i.MX8MP)
>     A platform wakeup IRQ fires and the glue handler calls
>     pm_runtime_resume(&xhci->dev). Runtime PM walks upward, resumes
>     the dwc3 parent first, then resumes xHCI. Both wake correctly.
> 
> (b) Wake lands on the dwc3 parent (ACPI platforms)
>     When an ACPI Notify(ACPI_NOTIFY_DEVICE_WAKE) targets the dwc3
>     parent device -- for example via a Generic Event Device on a
>     hardware-reduced platform where dwc3 is enumerated as an ACPI
>     device without a glue driver -- the ACPI core turns this into
>     pm_request_resume(dwc3_dev). Runtime PM does not propagate resume
>     downward, so the xHCI child stays suspended. Root hub polling is
>     never re-armed, and a device plugged in while suspended is silently
>     dropped.
> 
> This patch fills in the host branch to cover case (b) by requesting an
> async resume of the xHCI child so xhci_resume() can restore the port
> state machine and re-arm root hub polling. Async is required to avoid
> deadlocking on the parent's own rpm_resume() re-entry.
> 
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> ---
> base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Did you get LLM help with creating this patch?

thanks,

greg k-h
