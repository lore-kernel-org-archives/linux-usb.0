Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3985130DD2F
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 21:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786137812; cv=none; b=Lg3rtobhVUR/jN56URbpxO4jS2c4HU2S/0DJf/E24onneejWEUcoKrv3f89yGuYoemwkHPPur0m1tbu5y3upYZwOgJ3P0AMy7P+XPHKpzfFVrneF2l8rbbrNz5PYicm9SHbZ7iN86CaUmFczuxJwA9F7UClLuYIRozY0B1/ertY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786137812; c=relaxed/simple;
	bh=AlrDEtgsIUuyRu2a0F1Fa3Vucwsc40JlNG7Y5p6sGA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJSh/u3Nn99WSx/momtmBNzzOyPZfBxL2VlrjCAjypeKhyERT2rnk+4REjsa26LVL61Q4sUmJGqVf7C0FSHu1NYV7rlTBOyEGAQloaW0IUTpEnvcanWr+N2gvbrGlqEvrC5OdT803QlvhLvme3v/N8mmbXHbv7snHFZwBoLVE00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ACtIvIC4; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ACtIvIC4"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5283e3eff60so65821cf.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 14:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786137810; x=1786742610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itgpAEmkfXDN57Lz1RjHW/1lvaNeXgkXKGmQGf+4iEo=;
        b=ACtIvIC4I9HbesA8Gh4m23GrbVmDSAA2wrlkMnQ8PcpUEWK6DwEAzW+v5nlQl38w4w
         fxyUSIpyRw27/9InGH5Zv5onLacIj7ekeLRqKkde0yqxE+yeghIHOyVbejrGU+uwQdkz
         8xHUrxZqvquHF63Zd27RMfZadqJew+GEle5i80np3+mUi6qWkz/XuIde2RC8TYfzHb5B
         b+845R9dgsctE5cE9i1+VhTGfxn3aCV9Fzpkk0EuNE5jqT2UGxEHpp+MMNVt/Q1d6nPG
         sVkYDwNHYlK9c9nmQEQZHL7YyN/I4SIRdrCO9nXy9gYgnr2r5TjbOAI97FM8lPodsz+8
         jpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786137810; x=1786742610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itgpAEmkfXDN57Lz1RjHW/1lvaNeXgkXKGmQGf+4iEo=;
        b=poRlWNiiaQKN0gRsdVjw5E5bw5vbyZ9y+38WTedtDomp2NUwTJ7Aqrl/Xwdpo2ktY/
         dxPlKmhH2hFBzypiGBxnoBRUxuVh1fUWd3x67vw5f4E2/sAteUqge+QxocvyKbfk2ygm
         cg8LsZSC5zyiwQFMMy2ifFtNqJZtGfd9UnFzPKQ0vnY5cHKD0Lm4edFnJs+/FPR9SQiO
         hNHTB+E8BiFEZM2ZtkQByXLZpXavzH/tlfOKSRZYHUwOEJ1pm1h1KqObVumQliUZaR3B
         ZX7r76XSoDS/eVVZAVgedVB6ukWQDRgtghWIC11A7KnSINhej0pQvxSBka/DXY4vJ/Kf
         raBg==
X-Forwarded-Encrypted: i=1; AHgh+RpC/Ij1vbNWJewXh4IrfpxNwqsn5rny79zt+c/6OJcOOj+1tl03jMPJsHxlkl9XKaQOdOlLQBevRUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+cXzPrmefwPbfp5uvOPllhYqHInR6gCA8/9FxGQEc9rgQr+Z0
	6KrluT12zQc785P28eeRMafCScGCaPWlqua5TnFC/mTJH0GjsuAciiIXu6Kgb2Jh8w==
X-Gm-Gg: AR+sD12Y4zH5pG4LQv0IXxIWvMg5uTH5LusGCk0Yd1gsuXvRwDIjHwz8ot01o93gQ96
	4um29/r+BOLLSnsVBxN9untCEYdxhnW1EwwpmPsCy3QPoyGzHwvIUfCqjSu8b6d9vcE5bfO/J81
	KBCrAK1r8QBa7volukkh5UmNEbG39+IC0gqP00hBDB/HYGskeqhQ6OYUaMx6qvOhAEuFzHcUkN5
	19bb5S7C7FWqZlU9f+O3ImS936zjBDeD28wud/fmlQPybcB+1PeRa3EThfPlzid/s7yQbxPIaVg
	3NHXKTwHckzvBhZj4pwxLBkyHTRkfpueQh+g6SrXeoJqfnRmqe+Cbk/ZBc6MNz2W6WxIkfJMTUc
	UTvqD4p7ZOCVeEAX8ho1vGEeZXPOhus0TKyNyXibj3iGJj6vtm6sMZdA4jOkArwJvwmJ6Z0sV3R
	4F6ftL9cvAHYLHsei5CPr4DDbmiC4bvjdxeJR/ckudLjn3K0zJfpVmR5kTcG6BfQ==
X-Received: by 2002:a05:622a:1792:b0:51c:1c2c:a8bf with SMTP id d75a77b69052e-52ce61f0f9amr266257531cf.43.1786137809949;
        Fri, 07 Aug 2026 14:23:29 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d165e9353sm20275231cf.23.2026.08.07.14.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 14:23:29 -0700 (PDT)
Date: Fri, 7 Aug 2026 17:23:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Tatyana Brokhman <tlinder@codeaurora.org>,
	Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Sebastian Urban <surban@surban.net>,
	Seungjin Bae <eeodqql09@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] usb: gadget: dummy_hcd: set no_sg_constraint on the
 host controller
Message-ID: <f4a1040f-c878-4934-b373-8a51ad1f8e3f@rowland.harvard.edu>
References: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
 <20260807075438.5566-5-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807075438.5566-5-igor.skalkin@oss.qualcomm.com>

On Fri, Aug 07, 2026 at 09:54:38AM +0200, Igor Skalkin wrote:
> dummy_hcd copies data in software and has no hardware DMA alignment
> requirement.  Set no_sg_constraint = 1 so the USB core does not reject
> SG URBs whose non-final segments are not a multiple of the endpoint
> maxpacket size.

It is true that dummy_hcd's software implementation has no inherent DMA 
alignment requirement.  But dummy_hcd is meant as a testing tool; it 
emulates real controllers some of which _do_ have alignment 
requirements.

> For SuperSpeed bulk endpoints maxpacket is 1024 bytes; usbtest generates
> SG lists with varying segment sizes (e.g. 512 bytes) that are valid
> transfers but not maxpacket-aligned, causing usb_submit_urb to return
> -EINVAL before the URB reaches the host controller.

This is the appropriate response when emulating, for example, an EHCI 
controller.

A better solution to the problem would be to set no_sg_constraint at 
runtime, according to whether the connection speed is SuperSpeed or 
faster.

Alan Stern

> Assisted-by: OpenCode:claude-sonnet-5
> Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 7597c9e9fa66..2cfb1d035b34 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -2550,6 +2550,7 @@ static int dummy_setup(struct usb_hcd *hcd)
>  
>  	dum = *((void **)dev_get_platdata(hcd->self.controller));
>  	hcd->self.sg_tablesize = ~0;
> +	hcd->self.no_sg_constraint = 1;
>  	if (usb_hcd_is_primary_hcd(hcd)) {
>  		dum->hs_hcd = hcd_to_dummy_hcd(hcd);
>  		dum->hs_hcd->dum = dum;
> -- 
> 2.49.0
> 
