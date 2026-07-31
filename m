Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EE44192F7;
	Fri, 31 Jul 2026 10:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495106; cv=none; b=K+qeScGt1GeFNWbPtheRSdtf+/4bBUtoTig98bUnb77wCm9pApW2eqrRDi5H9G2RzpsmKA0v0KEY1GK+b5H/VDwePnk5yoL/9KckIDJrzZUG+uBazWN66yrxeKK52iVGDYLnRoWrsiL5iFXQAEqpqe8g8syPMBFXIdFXCyYs+zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495106; c=relaxed/simple;
	bh=zBi9tSRnulrSV4vvXAVE9xuK5JVoLpiHky5zfQgH5wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2CgSUV3VzDxBzijTM+pFfbJ11VTaAg3GlD1T8Ir6nAGGGsTB+3A5Q9Cgpgzm4r9TVRUNusWmd4zeKMoIaeE/PxAhZ1YQFNFlsWwGP3ElUx2tt0oSq2vm5GGsbYF+iVWQbuCNCrXHanxPF5HWvOPgoGi6By0JSqijW+pk0K5mcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=it9PPgSI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="it9PPgSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785495102; x=1817031102;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zBi9tSRnulrSV4vvXAVE9xuK5JVoLpiHky5zfQgH5wE=;
  b=it9PPgSILvL2vuRx9QLFBxWgx6TGDe6H0Hfnp/OBs9Hn8ld0ejh5nwfK
   mAOuQVWwsaBczCX57RP6uquqpsEhkClD2m98fpVtdZMkSd6ruDC0DXNj3
   JkzNvm5QxRFP4psyBJkdNZm00y4OQoEuhbJ5wBJaqk9411Fx1acQj4sEe
   boymO5Q0B+59OdTnxNaT2dS4aIwAxpSeSAMURZPS4Ydy/2o09uzl/4UyZ
   G6y+ByFKVJ8EBWJ02YNhgkNYLxgKma/tQpBio47paXocKuwpsGYHCsMMo
   b8GmIdR5YwQdBsSycvCAIE3uAeu+Nsjiu6+H4a5cqPnTWoFgxVt01xrA7
   g==;
X-CSE-ConnectionGUID: iDiSJ3KrTvir/Ric9QTCyQ==
X-CSE-MsgGUID: vSoweTA3RYK7OKecpzB6/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86156437"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86156437"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 03:51:39 -0700
X-CSE-ConnectionGUID: Z7gsbuS3QT6lTpZGVXkeMA==
X-CSE-MsgGUID: ilqusEwTRvqLUdGHKbVmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="259966933"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.73]) ([10.245.244.73])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 03:51:37 -0700
Message-ID: <7f0618ed-d2da-42a1-a605-0660439255d7@linux.intel.com>
Date: Fri, 31 Jul 2026 13:51:34 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
To: Konrad Dybcio <konradybcio@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 usb4-upstream@oss.qualcomm.com,
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 15:29, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, the only way for the USB core to determine whether the link
> is native or tunneled is via an Intel vendor-specific Extended
> Capability.
> 
> The XHCI specification v1.2 and newer expose a common ext_cap,
> indicating whether BIT(2) of PORTSC can be interpreted as the tunneling
> status.
> 
> Make use of that and fall back to the existing Intel-specific path if
> the ext_cap is absent.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/usb/host/xhci-ext-caps.h |  3 +++
>   drivers/usb/host/xhci-hub.c      | 19 ++++++++++++++++---
>   drivers/usb/host/xhci-port.h     |  3 ++-
>   3 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
> index 22e53a750e2a..af7d624cd38e 100644
> --- a/drivers/usb/host/xhci-ext-caps.h
> +++ b/drivers/usb/host/xhci-ext-caps.h
> @@ -66,6 +66,9 @@
>   #define XHCI_HLC               (1 << 19)
>   #define XHCI_BLC               (1 << 20)
>   
> +/* USB3 tunneling support capability - section 7.11 */
> +#define XHCI_USB3_TUNNELING_SUPPORTED	BIT(16)
> +
>   /* Intel SPR shadow capability */
>   #define XHCI_INTEL_SPR_ESS_PORT_OFFSET  0x8ac4	/* SuperSpeed port control */
>   #define XHCI_INTEL_SPR_TUNEN	BIT(4)		/* Tunnel mode enabled */
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index b0264bd8577a..402e98ab95ee 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -766,17 +766,30 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>   enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
>   						struct xhci_port *port)
>   {
> +	void __iomem *base = &xhci->cap_regs->hc_capbase;
>   	struct usb_hcd *hcd;
> -	void __iomem *base;
>   	u32 offset;
> +	u32 val;
>   
> -	/* Don't try and probe this capability for non-Intel hosts */
> +	/* Prefer the XHCI v1.2 ext_cap if advertised */
> +	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_USB3_TUNNELING);
> +	if (offset) {
> +		if (!(readl(base + offset) & XHCI_USB3_TUNNELING_SUPPORTED))
> +			return USB_LINK_NATIVE;
> +

The extcap 18 value won't change.
We can read it once in xhci_gen_setup()/xhci_setup_port_arrays() and cache it.

here we would just check:

if  (xhci->portsc_tunnel_reporting) {
	..read portsc and return, as you do below


> +		val = xhci_portsc_readl(port);
> +		if (val & PORT_TM)
> +			return USB_LINK_TUNNELED;
> +
> +		return USB_LINK_NATIVE;
> +	}
> +

Thanks
Mathias

