Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725651;
	b=hdsDxl4FhsCs0DxDtDzvu90M3YFpoAAb7cXhBvZoHu/uwxO7BawrD7S7aTP/hes5/LvT
	 CtD6OT7tAyjSq4FBrpVYVDdLcpKrniZo+seWUd/N89ffYt7Niml0A/PXY+AwiLo8KggCo
	 7ZqvLpx17xPa/5nxB4Ty2eea25gPDitXAPSx2wq/sEfZLEl0oASeYJvcIcsfeSeAOKQn0
	 SvQjLZQ31BJrlRQXF9RA4jOXYN10e421VsvPrnE9r/RB7xolyiLjoMvd6EmlMt6uDegp+
	 IzRQcnSaPMST6cYSUtjbgoTLHgUiVttpLHtfXGDmMpLvIiiVzeilWJOvEoPDKejXY4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZXAnycV2Hcm8ldSEMEQ/+eptx4Ci6snzlqCMyAXlIBA=;
	b=QRViXDV5+E5cwoyhpngBOFKPC8o7diFxuMgdyw5nUT9ZwF50p0CQWteB2pOd0rg9Nby6
	 d6/56b8GsLJbAqfQ4BT5msjQ9JuASNXA0F+IElz+xXyRkFIo1G4GUP5+qgz0djAqQfsiL
	 pLYldgO6ShQqRDiUxJvS9uyty/XW0wOWXdqqosl3wK40PwrQku90kwgTkCZcJHLINt1cI
	 DQGzF/XJvors10VLzPIBmqGgh2VN+u1NdnIdD3nhll1FaNN4yeRXcNOYaWxgRtbrMq6mz
	 JWWUZ3Cyfhtzy5PDvFwps+u4ZFMBKSvU+ypLgtsVECV2wJ/Wp6gByDyweATLsnldIGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o7p+qhBv;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A532D606A329
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 06:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A532D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o7p+qhBv
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso835120f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 22:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725649; x=1795330449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXAnycV2Hcm8ldSEMEQ/+eptx4Ci6snzlqCMyAXlIBA=;
        b=o7p+qhBvrgRPR4ZTdHy2qwlNaJnbxeNfxS4SR9OzVPnJmTkUlTcFQPs3YKnsc5wvVU
         2FWAkbKqtm5XeNeNyVPLsnDRLb29/hItTp3oNyHl7S9McLZFWisG3cijOsu7p5PMkrJV
         Bbszz9s2gKEM/Kj22PDpUBlwXq3ALXiUZxMisjP4KZQesbKuZT8OZy7lb9gMS6Mq+4+b
         9f3lyLdDL7fQi3pICPDeeVs+CvMmS8wIvStge8MgtM8El4O0A0ud2P+RTvqZMrsHlwP4
         PcguhGBuE3rIpbgDSL1PKMvWmJJ7uKMK8Aq0bCX0oNpmAZ81yEa53crvCoPIIbTONFlG
         HKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725649; x=1795330449;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXAnycV2Hcm8ldSEMEQ/+eptx4Ci6snzlqCMyAXlIBA=;
        b=0WmtZB8JO0vqZcqqkVaxNBi9OBnGNRVwRCIr6QwfnqaZ/taXjS9U9ILI+xM4QsCGg4
         90mvRQ33HSbMAyytQXFRt+GVHE64vc8az41GAS3XsxheyjdbCQPyJGsGSermbnVpBdtT
         7fyGui2VjCj3PWlBzf/XQilRMiKDAJiM3IZmxN8M3+5yLk+HH3ULOAusQBFKKOcHtQzZ
         K8n2cazb9h3miRWhJfojOggRQcgBxeRBZOu6u5UZ+v1xEg2spaXEBBgba4k+DUyE9J8V
         HwtWe0xGbdsDCbnB5EVDG9Sr24IJfdlNpvHQ5qfOJRgGPPFSOcJZ41gYurDeDO0E5gSj
         G1Mg==
X-Forwarded-Encrypted: i=1; AL+hErG9fiLaEGeMgUA8/8gzaD/rvEBOriCihLbrOW0zeavqVAsijH/435NB/w4dRWD3itrAR5U2Z/fb1Ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qoDhV6qKphhXKTC+bvKjJQUc2bX+nNbsUk9W/NnZKBzO9E5e3
	TaXREid8+uT6RBqj+sHpJfsmBeNTSW/r56bf0DkRJ415NAZGhuHabKdR
X-Gm-Gg: AYBFou3A4MOhVk5gtg2pa2rFkBF6jiUcl/Z9iGCM6Y8ZaUNT4ewoTR0/U7Wi2bWlRjo
	tmwFztIeK8b+29oZ/0zQv6uWrRfEGV/P3Lyh6eJAWoBPbOhj9eFdzecZ6tayqscvDH6ecDGXVyk
	23YSeOus0MGRRkn72GydyyzkTyaUzu3hQgHItJTYIkKIT5sUOPI1+OK5oUc5lvQT0CLh8sHUJ8F
	iBrKWYSDXYBnkER2KsCKUaSCg4K+2Hc5F6RwMBT7Jm1YXBMHjnfspzlaWcGmTb6REooFKe9RxNZ
	eBGdkcVDixxWaszADojcwuJsYYaflLZPdBrITlhmRSfFlbHbMyKcj6xgAK/C+EE+1SI10ps67Ah
	MIeiLMI9e6T2CSdlQO+JVCXIjiGLSYfLsLH/hHS+3yvdWJ4QSNNSSe8bF2gP/+T1x4MWnqHk/6F
	BOYefnFj8/rRordz5yYVmhmyBPdjZjvCX1h6d1A1WPJNMwWu6XQtDQsngtXoKubSCTMRgexJtzK
	gQDUHBo59XSg5axwkZYZtx6wGQrAVBcysdellOCt1IB/2PYLk4KWvOJUsqWqDFyON/WQ48a8vSe
	LBeNxpuISkBJ1xhW173bk40UBB+CHSGyjBaIeQ==
X-Received: by 2002:a05:6000:29d2:b0:498:38b3:55a1 with SMTP id ffacd0b85a97d-49c71e3e27amr8823824f8f.15.1794725648797;
        Sat, 14 Nov 2026 22:54:08 -0800 (PST)
Received: from foxbook (bgu85.neoplus.adsl.tpnet.pl. [83.28.84.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm25699913f8f.44.2026.11.14.22.54.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 14 Nov 2026 22:54:08 -0800 (PST)
Date: Sun, 15 Nov 2026 07:53:59 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: skip companion handoff when no companion
 exists
Message-ID: <20261115075359.39ec8f71.michal.pecio@gmail.com>
In-Reply-To: <20261114051653.1353346-1-william@wkennington.com>
References: <20261114051653.1353346-1-william@wkennington.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 05:16:53 +0000, William A. Kennington III wrote:
> EHCI controllers without an integrated root-hub transaction translator
> unconditionally set PORT_OWNER whenever a root port sees low-speed line
> state before reset, finishes reset without enabling High-Speed mode, or
> is relinquished by usbcore after enumeration fails. When no companion
> controller is present or enabled, setting PORT_OWNER routes the port
> away from EHCI to a nonexistent or disabled controller. A single missed
> High-Speed chirp or transient D+/D- bounce during reset then strands
> downstream USB 2.0 hubs until EHCI is rebound, and connecting a USB 1.1
> device leaves the port dead to later USB 2.0 devices.
> 
> Check during ehci_setup() whether HCSPARAMS reports zero companions
> (HCS_N_CC == 0), both CONFIG_USB_OHCI_HCD and CONFIG_USB_UHCI_HCD are
> disabled in Kconfig (such as in aspeed_g4_defconfig,
> aspeed_g5_defconfig, and BMC builds without UHCI or OHCI), or a Device
> Tree companion phandle points to a disabled node. Runtime companion
> binding is intentionally not checked at setup time so modular or
> later-probing companion drivers still receive handoffs.
> 
> When no companion is available, set ehci->no_companion to skip
> PORT_OWNER handoffs and omit the companion sysfs attribute, matching
> the integrated-TT path so usbcore keeps port ownership on EHCI.

Hi,

That's for Alan to decide, but it seems that whenever you use
ehci->no_companion, you always add "|| ehci_is_TD(ehci)", and this
is unlikely to change since HCs with TT don't need companions.

So ehci_is_TDI() together with its associated comment could be
moved to ehci_has_companion(). Then you no longer need those funny
comments like "without companion there is no companion" and the
code becomes somewhat simpler too.

Regards,
Michal

> USB 1.1 full- and low-speed devices still cannot enumerate without an
> integrated TT or companion controller and will fail usbcore's normal
> reset retries instead of triggering a PORT_OWNER handoff.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> ---
>  drivers/usb/host/ehci-hcd.c   | 31 +++++++++++++++++++++++++++++++
>  drivers/usb/host/ehci-hub.c   | 21 ++++++++++-----------
>  drivers/usb/host/ehci-sysfs.c |  8 ++++----
>  drivers/usb/host/ehci.h       |  1 +
>  4 files changed, 46 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index 75f780ec3ba0..1e813ac5f0cb 100644
> --- a/drivers/usb/host/ehci-hcd.c
> +++ b/drivers/usb/host/ehci-hcd.c
> @@ -26,6 +26,7 @@
>  #include <linux/moduleparam.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/debugfs.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> @@ -679,6 +680,33 @@ static int ehci_run (struct usb_hcd *hcd)
>  	return 0;
>  }
>  
> +static bool ehci_has_companion(struct ehci_hcd *ehci)
> +{
> +	struct device *dev = ehci_to_hcd(ehci)->self.controller;
> +
> +	if (HCS_N_CC(ehci->hcs_params) == 0)
> +		return false;
> +
> +	if (!IS_ENABLED(CONFIG_USB_OHCI_HCD) &&
> +	    !IS_ENABLED(CONFIG_USB_UHCI_HCD))
> +		return false;
> +
> +	if (dev && dev->of_node) {
> +		struct device_node *node;
> +
> +		node = of_parse_phandle(dev->of_node, "companion", 0);
> +		if (node) {
> +			bool avail = of_device_is_available(node);
> +
> +			of_node_put(node);
> +			if (!avail)
> +				return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  int ehci_setup(struct usb_hcd *hcd)
>  {
>  	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
> @@ -691,6 +719,9 @@ int ehci_setup(struct usb_hcd *hcd)
>  
>  	/* cache this readonly data; minimize chip reads */
>  	ehci->hcs_params = ehci_readl(ehci, &ehci->caps->hcs_params);
> +	ehci->no_companion = !ehci_has_companion(ehci);
> +	if (ehci->no_companion)
> +		ehci_dbg(ehci, "no companion controller, disabling port handoff\n");
>  
>  	ehci->sbrn = HCD_USB2;
>  
> diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
> index e676c98b6baa..1f69d9fc93c7 100644
> --- a/drivers/usb/host/ehci-hub.c
> +++ b/drivers/usb/host/ehci-hub.c
> @@ -618,18 +618,17 @@ static int check_reset_complete (
>  	/* if reset finished and it's still not enabled -- handoff */
>  	if (!(port_status & PORT_PE)) {
>  
> -		/* with integrated TT, there's nobody to hand it to! */
> -		if (ehci_is_TDI(ehci)) {
> -			ehci_dbg (ehci,
> -				"Failed to enable port %d on root hub TT\n",
> -				index+1);
> +		/* with integrated TT or no companion, there's nobody to hand it to! */
> +		if (ehci_is_TDI(ehci) || ehci->no_companion) {
> +			ehci_dbg(ehci, "Failed to enable port %d%s\n",
> +				 index + 1,
> +				 ehci_is_TDI(ehci) ? " on root hub TT" : "");
>  			return port_status;
>  		}
>  
>  		ehci_dbg (ehci, "port %d full speed --> companion\n",
>  			index + 1);
>  
> -		// what happens if HCS_N_CC(params) == 0 ?
>  		port_status |= PORT_OWNER;
>  		port_status &= ~PORT_RWC_BITS;
>  		ehci_writel(ehci, port_status, status_reg);
> @@ -1145,9 +1144,9 @@ int ehci_hub_control(
>  			 * which can be fine if this root hub has a
>  			 * transaction translator built in.
>  			 */
> -			if ((temp & (PORT_PE|PORT_CONNECT)) == PORT_CONNECT
> -					&& !ehci_is_TDI(ehci)
> -					&& PORT_USB11 (temp)) {
> +			if ((temp & (PORT_PE | PORT_CONNECT)) == PORT_CONNECT &&
> +			    !ehci_is_TDI(ehci) && !ehci->no_companion &&
> +			    PORT_USB11(temp)) {
>  				ehci_dbg (ehci,
>  					"port %d low speed --> companion\n",
>  					wIndex + 1);
> @@ -1244,7 +1243,7 @@ static void ehci_relinquish_port(struct usb_hcd *hcd, int portnum)
>  {
>  	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
>  
> -	if (ehci_is_TDI(ehci))
> +	if (ehci_is_TDI(ehci) || ehci->no_companion)
>  		return;
>  	set_owner(ehci, --portnum, PORT_OWNER);
>  }
> @@ -1254,7 +1253,7 @@ static int ehci_port_handed_over(struct usb_hcd *hcd, int portnum)
>  	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
>  	u32 __iomem		*reg;
>  
> -	if (ehci_is_TDI(ehci))
> +	if (ehci_is_TDI(ehci) || ehci->no_companion)
>  		return 0;
>  	reg = ehci_portsc(ehci, portnum - 1);
>  	return ehci_readl(ehci, reg) & PORT_OWNER;
> diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
> index 5e6b545c30e6..1dcca19b544b 100644
> --- a/drivers/usb/host/ehci-sysfs.c
> +++ b/drivers/usb/host/ehci-sysfs.c
> @@ -145,8 +145,8 @@ static inline int create_sysfs_files(struct ehci_hcd *ehci)
>  	struct device	*controller = ehci_to_hcd(ehci)->self.controller;
>  	int	i = 0;
>  
> -	/* with integrated TT there is no companion! */
> -	if (!ehci_is_TDI(ehci))
> +	/* with integrated TT or no_companion there is no companion! */
> +	if (!ehci_is_TDI(ehci) && !ehci->no_companion)
>  		i = device_create_file(controller, &dev_attr_companion);
>  	if (i)
>  		goto out;
> @@ -160,8 +160,8 @@ static inline void remove_sysfs_files(struct ehci_hcd *ehci)
>  {
>  	struct device	*controller = ehci_to_hcd(ehci)->self.controller;
>  
> -	/* with integrated TT there is no companion! */
> -	if (!ehci_is_TDI(ehci))
> +	/* with integrated TT or no_companion there is no companion! */
> +	if (!ehci_is_TDI(ehci) && !ehci->no_companion)
>  		device_remove_file(controller, &dev_attr_companion);
>  
>  	device_remove_file(controller, &dev_attr_uframe_periodic_max);
> diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
> index 855a9d08b019..8ab5c696717a 100644
> --- a/drivers/usb/host/ehci.h
> +++ b/drivers/usb/host/ehci.h
> @@ -238,6 +238,7 @@ struct ehci_hcd {			/* one per controller */
>  	unsigned		no_configured_flag:1;
>  	unsigned		no_tdi_mode:1;
>  	unsigned		no_fsls_isoc:1;
> +	unsigned		no_companion:1;
>  
>  	/* required for usb32 quirk */
>  	#define OHCI_CTRL_HCFS          (3 << 6)
> -- 
> 2.56.0.611.g1030f0b940-goog
> 
