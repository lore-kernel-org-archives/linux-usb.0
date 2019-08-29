Return-Path: <SRS0=v76c=WZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D50AC3A59F
	for <linux-usb@archiver.kernel.org>; Thu, 29 Aug 2019 04:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C41523404
	for <linux-usb@archiver.kernel.org>; Thu, 29 Aug 2019 04:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567052927;
	bh=54i/F6z3E54S+pHqyqNU/RAtTSjzea7XJi+5PG01FK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=J929kjTjtflh4uIfp3aiXD3uPg76Fphr4wjwWQQkCh1zc3uzGuKmnPXVFWABwU/jr
	 BBlIcXzG1ACeM8cwx+iyE69UoJg8ZRwnHCbJMypW4jz6btXZL5dXOdH9O1z4/r88WL
	 qQegCA2/EbmHnFDe0Pt7hE12TNKeABkMwfsVag+c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfH2E2q (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 29 Aug 2019 00:28:46 -0400
Received: from mga05.intel.com ([192.55.52.43]:28994 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfH2E2q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 00:28:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 21:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; 
   d="scan'208";a="180758424"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2019 21:28:44 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Workaround Mirosoft's BESL check
In-Reply-To: <02f8890eb7c60fa229ba599bf914936fe1491693.1567047731.git.thinhn@synopsys.com>
References: <02f8890eb7c60fa229ba599bf914936fe1491693.1567047731.git.thinhn@synopsys.com>
Date:   Thu, 29 Aug 2019 07:28:38 +0300
Message-ID: <871rx43895.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> While testing our host system using Microsoft's usb stack against our
> gadget for various BESL values, we found an issue with their usb stack
> when the recommended baseline BESL value is 0 (125us) or when the deep
> BESL is 1 or less. The Windows host will issue a usb reset immediately
> after it receives the extended BOS descriptor and the enumeration will
> fail after a few attempts.
>
> To keep compatibility with Microsoft's host usb stack, let's workaround
> this issue by using the recommended baseline BESL of 1 (or 150us)
> and clamp the deep BESL value within 2 to 15.
>
> This was tested against Windows 10 build 18956.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  drivers/usb/dwc3/gadget.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 7b58e0e1e438..9ef2259829ba 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2083,9 +2083,10 @@ static void dwc3_gadget_config_params(struct usb_gadget *g,
>  
>  	/* Recommended BESL */
>  	if (!dwc->dis_enblslpm_quirk) {

let's add a comment here similar to what's in commit log so folks won't
go about changing this willy-nilly.

> -		params->besl_baseline = 0;
> +		params->besl_baseline = 1;
>  		if (dwc->is_utmi_l1_suspend)
> -			params->besl_deep = min_t(u8, dwc->hird_threshold, 15);
> +			params->besl_deep =
> +				clamp_t(u8, dwc->hird_threshold, 2, 15);
>  	}
>  
>  	/* U1 Device exit Latency */
> -- 
> 2.11.0
>

-- 
balbi
