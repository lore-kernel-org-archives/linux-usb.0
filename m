Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ECD18DB1A;
	Wed, 26 Aug 2026 05:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787723449; cv=none; b=aIX8bQVOuX5P+hEwjWBHKvfaU73KxeZo8tAtX1EFd3n/ZNoELbXdhCfnJjiJYkR3t3yZ73KJNU8P+Gbj7la7nMlonZatOJPT/4paZP7YOYeTbQE+CgM8xkUOUw8q4lu3VwCu3DsOPqYAxcDCGeCnzTtuwtjaO0JojX5PUqzK2es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787723449; c=relaxed/simple;
	bh=mf1yZL42I/suEmG2skNzghVuItq3+mrJy/bYqRuHaGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVBECzN/Iz+m294gDy44nwFopywD+DiQjAU9iejQXL/wDFnFHtHT41kVOthzoYdcnnnFw1zTHBLmhtxjH06W4A1RX77JLlSdNCpKz99RqLbF2gJX1+xUFSMo7ZS/uV9uMW4+y9181VM2HYi2RoXCmRZdQcsJKErfo0kjmTxyBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HkiXPAdo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HkiXPAdo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631DD1F000E9;
	Wed, 26 Aug 2026 05:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787723447;
	bh=gUhEx0OJuE9FVb+TQYVzQ2D5zds9pOAONgsSl77Mcz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HkiXPAdo17QVX4dGx0muHpwGOHxRZ0yFYVshoJ7y04pyKAAwh04UpjvoGo/FHnUzI
	 I+5H0pT/xXxN0fJf4dyfkXUDvAcqAMoG8S+6j2JhFNqBgI8dfg720KyaYfUYqUCpkl
	 /mhO2h77Yd7lgmpK8O7VwNRv4VZgMG9+btvsAofg=
Date: Wed, 26 Aug 2026 07:49:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "NG, TZE YEE" <tze.yee.ng@altera.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
Subject: Re: [PATCH] usb: dwc2: handle OTG HNP SetFeature requests
Message-ID: <2026082616-prozac-skilled-f487@gregkh>
References: <e1f4718cadf28c4348bcf6ebb025f71732416538.1786950594.git.tze.yee.ng@altera.com>
 <e541e9d0-f6d8-43cc-a2bc-5f1c6a139486@altera.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e541e9d0-f6d8-43cc-a2bc-5f1c6a139486@altera.com>

On Wed, Aug 26, 2026 at 03:07:50AM +0000, NG, TZE YEE wrote:
> On 17/8/2026 4:00 pm, NG, TZE YEE wrote:
> > From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> > 
> > Without handling for b_hnp_enable, a_hnp_support, and a_alt_hnp_support,
> > HNP cannot be enabled when two OTG controllers are connected.
> > 
> > Handle SetFeature for these OTG selectors, gated on otg_caps.hnp_support.
> > The OTG specification only defines SetFeature for them, so reject
> > ClearFeature with -EINVAL instead of silently accepting it. Use dev_dbg
> > for status updates to avoid noisy logs.
> > 
> > Advertise the core's HNP/SRP capability during gadget init by restoring
> > GUSBCFG_HNPCAP/SRPCAP from otg_caps, mirroring dwc2_gusbcfg_init() on the
> > host side, instead of clearing them unconditionally.
> > 
> > Clear the HNP flags and GOTGCTL_DEVHNPEN on disconnect/reset so OTG state
> > does not leak across sessions.
> > 
> > Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> > Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> > ---
> >   drivers/usb/dwc2/gadget.c | 51 +++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 49 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> > index c8b02c27d27d..4d905989c09f 100644
> > --- a/drivers/usb/dwc2/gadget.c
> > +++ b/drivers/usb/dwc2/gadget.c
> > @@ -1780,6 +1780,7 @@ static int dwc2_hsotg_process_req_feature(struct dwc2_hsotg *hsotg,
> >   	struct dwc2_hsotg_ep *ep;
> >   	int ret;
> >   	bool halted;
> > +	u32 otgctl;
> >   	u32 recip;
> >   	u32 wValue;
> >   	u32 wIndex;
> > @@ -1809,6 +1810,36 @@ static int dwc2_hsotg_process_req_feature(struct dwc2_hsotg *hsotg,
> >   
> >   			hsotg->test_mode = wIndex >> 8;
> >   			break;
> > +		case USB_DEVICE_B_HNP_ENABLE:
> > +			if (!hsotg->params.otg_caps.hnp_support)
> > +				return -ENOENT;
> > +			if (!set)
> > +				return -EINVAL;
> > +
> > +			otgctl = dwc2_readl(hsotg, GOTGCTL);
> > +			otgctl |= GOTGCTL_DEVHNPEN;
> > +			dwc2_writel(hsotg, otgctl, GOTGCTL);
> > +			hsotg->gadget.b_hnp_enable = 1;
> > +			dev_dbg(hsotg->dev, "HNP enabled\n");
> > +			break;
> > +		case USB_DEVICE_A_HNP_SUPPORT:
> > +			if (!hsotg->params.otg_caps.hnp_support)
> > +				return -ENOENT;
> > +			if (!set)
> > +				return -EINVAL;
> > +
> > +			hsotg->gadget.a_hnp_support = 1;
> > +			dev_dbg(hsotg->dev, "a_hnp_support set\n");
> > +			break;
> > +		case USB_DEVICE_A_ALT_HNP_SUPPORT:
> > +			if (!hsotg->params.otg_caps.hnp_support)
> > +				return -ENOENT;
> > +			if (!set)
> > +				return -EINVAL;
> > +
> > +			hsotg->gadget.a_alt_hnp_support = 1;
> > +			dev_dbg(hsotg->dev, "a_alt_hnp_support set\n");
> > +			break;
> >   		default:
> >   			return -ENOENT;
> >   		}
> > @@ -3322,6 +3353,13 @@ void dwc2_hsotg_disconnect(struct dwc2_hsotg *hsotg)
> >   	hsotg->connected = 0;
> >   	hsotg->test_mode = 0;
> >   
> > +	if (hsotg->params.otg_caps.hnp_support) {
> > +		hsotg->gadget.b_hnp_enable = 0;
> > +		hsotg->gadget.a_hnp_support = 0;
> > +		hsotg->gadget.a_alt_hnp_support = 0;
> > +		dwc2_clear_bit(hsotg, GOTGCTL, GOTGCTL_DEVHNPEN);
> > +	}
> > +
> >   	/* all endpoints should be shutdown */
> >   	for (ep = 0; ep < hsotg->num_of_eps; ep++) {
> >   		if (hsotg->eps_in[ep])
> > @@ -3416,9 +3454,18 @@ void dwc2_hsotg_core_init_disconnected(struct dwc2_hsotg *hsotg,
> >   	usbcfg &= ~GUSBCFG_TOUTCAL_MASK;
> >   	usbcfg |= GUSBCFG_TOUTCAL(7);
> >   
> > -	/* remove the HNP/SRP and set the PHY */
> > +	/*
> > +	 * Configure HNP/SRP capability from params (same idea as
> > +	 * dwc2_gusbcfg_init() for host). Unconditionally clearing these
> > +	 * bits leaves an HNP-capable OTG gadget unable to negotiate.
> > +	 */
> >   	usbcfg &= ~(GUSBCFG_SRPCAP | GUSBCFG_HNPCAP);
> > -        dwc2_writel(hsotg, usbcfg, GUSBCFG);
> > +	if (hsotg->params.otg_caps.hnp_support &&
> > +	    hsotg->params.otg_caps.srp_support)
> > +		usbcfg |= GUSBCFG_HNPCAP;
> > +	if (hsotg->params.otg_caps.srp_support)
> > +		usbcfg |= GUSBCFG_SRPCAP;
> > +	dwc2_writel(hsotg, usbcfg, GUSBCFG);
> >   
> >   	dwc2_phy_init(hsotg, true);
> >
> 
> Hi,
> 
> Gentle ping on this patch. It has been over a week with no feedback.

It's the middle of the merge window, nothing can happen with new patches
until -rc1 is out.  If you wish to make the review process go faster,
please help review other pending patches on the list.

thanks,

greg k-h
