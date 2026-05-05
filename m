Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF6396B73;
	Tue,  5 May 2026 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983250; cv=none; b=EpGdufqwUGTOFodpi9DJjYHvN/R6vr6GG/eY8+meiCw7af+GvITejSCfh28l7C3aYyZYscNhqvQEIgSNDm9dFHLWC6jT8xaRq/hw5i2b9r8EpzKSjyZh4fx1PrDVBvLC9uf6iMaLQW+IU6VwxaE4O2a47ImrV/yUnGw5hYTBlos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983250; c=relaxed/simple;
	bh=8dSoXPZygWVPtyXiSpVIBOIVstqia1BSRKp//ijHQK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBejvoM6sg8PR13aCbCK6yckuvvibZB2nhoT3wfMlLlnPT1Ro9F/tCQWCYOtBLEbaJjcOj4dh7RACyU7o6xzJUJVCyf4/Ekoh0WQY9atwV8ugmVHfN+3oIifoor1x1p9W9lSVAZrW/bI3aiEikYlynQY9bywYU5skM3gu/aTmLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=attG+CJR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="attG+CJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777983248; x=1809519248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8dSoXPZygWVPtyXiSpVIBOIVstqia1BSRKp//ijHQK4=;
  b=attG+CJRlEhmoLaIuZLQXxi/Bsfvg3UKuKqhHRF73xVtumOAYBCREKRs
   VUs7Nha7ig+stUV9A2oEjwpMOf05sKyx720mkB6TgipdZwEyBjqkUwapi
   ppPQOC8cvUotgfelR4LI245hVUM11dvCxkd9ACpYsJKF+pPmCLnnje7Kv
   NlEHdel3T3tA+3Eiy2oEnLLXtVhknWQwS9UBqkDqvSY0M1lT2RmA6Xg0E
   aNiB/Nnz4nH/8e+wpgky6gmhv95t4C4f4qRvjtv9+sxVUbFOVgjotI85R
   UGcLUmakU76P86272oXEpadA032MPxZDSp0pzArksah9vWtDEzrglvvho
   A==;
X-CSE-ConnectionGUID: Jx1EDEFuTQizdOt3F+Y4jQ==
X-CSE-MsgGUID: 551DSAdqQK+uqW7PS5j0yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78875554"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78875554"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 05:14:08 -0700
X-CSE-ConnectionGUID: 5Katc3A2Q2eQ/GCy+y+u+g==
X-CSE-MsgGUID: IM1h9J9pRgiC1DZ2kuNvYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="237571967"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2026 05:14:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D8A5895; Tue, 05 May 2026 14:14:04 +0200 (CEST)
Date: Tue, 5 May 2026 14:14:04 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] usb: host: xhci: Allow non-Intel
 usb_link_tunnel_mode reporting
Message-ID: <20260505121404.GG6785@black.igk.intel.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-1-4aaa6c3c14cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505-topic-dwc3_tunneling_state-v1-1-4aaa6c3c14cb@oss.qualcomm.com>

Hi,

On Tue, May 05, 2026 at 10:55:04AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Thunderbolt framework relies on the USB core to create device links
> for tunneled ports, so that the USB3 controller is only kept
> runtime-resumed for the duration of the tunneling.
> 
> Currently, retrieving that information is only possibe on Intel XHCI
> hosts, through a vendor-specific capability. Extend xhci-plat to allow
> plumbing a custom one.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/usb/host/xhci-hub.c  | 4 ++--
>  drivers/usb/host/xhci-plat.c | 2 ++
>  drivers/usb/host/xhci-plat.h | 1 +
>  drivers/usb/host/xhci.c      | 6 +++++-
>  drivers/usb/host/xhci.h      | 5 ++++-
>  5 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index bacd0ddd0d09..09e5da912066 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -750,7 +750,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>  }
>  
>  /**
> - * xhci_port_is_tunneled() - Check if USB3 connection is tunneled over USB4
> + * xhci_port_tunnel_mode() - Check if USB3 connection is tunneled over USB4
>   * @xhci: xhci host controller
>   * @port: USB3 port to be checked.
>   *
> @@ -764,7 +764,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>   * detecting USB3 over USB4 tunnels. USB_LINK_NATIVE or USB_LINK_TUNNELED
>   * otherwise.
>   */
> -enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
> +enum usb_link_tunnel_mode xhci_port_tunnel_mode(struct xhci_hcd *xhci,
>  						struct xhci_port *port)

I'm wondering if this could be:

bool xhci_port_is_tunneled()

becase if I understand correctly that's the only information we need e.g is
it going over tunnel or not.
