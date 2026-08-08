Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C344E32F757
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 19:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786216703; cv=none; b=dElMb3W9UYk7Uh/TcZFi8H73LRrxBBAd3nQeN/R/hAhsJTa10Yyf/aUK4xFYiBCXr59TKor89qBQu7DTItMN+rJAlQJYdbXoYXC6WqBzfUaloqv72lxbAJBA3lwto/SO4/Ue4QDQsVp5ORRF51fvzGer9cFTFCSly2OBUdh7n4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786216703; c=relaxed/simple;
	bh=kItp9Z1e8JBemDwqeOPjo5Xxl2mgPRr4PDK1h4h3tHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsE98Rh2Qt7ssO7rrPRtD7y7AI43zeu5tk2MoXRbqYFDmmIhv5pbJOy3zavgw8EuNLne/MjM+DWbeNb3cn+q1t1Ku9Yg700EbcFsi6XDxt68cTQXxwogzgMbJhIXLMBlz7SSIZAAiHYpBH18Kpou/NPdbPYKhXdSSO4VgUtxWV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=p9WD2jz9; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="p9WD2jz9"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c04bf4711so6313291cf.2
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 12:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786216701; x=1786821501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rLFxNt6cekVDYhRViYWogX3gp+Zn05f4HEhIaap8PSo=;
        b=p9WD2jz9Y8XSjF7q7b/0c5kuLXcOW9eHQhDt1iLfmuNZNHhtUYaeoA2SrzYShUAeCR
         GlnRUQGhWm+E/tICw3dGlo7Hd0A7SXU52JveFTAUk+sNppm0M/9bo9g6TFubOl5p0Dhl
         D+HSShuGr/kxUKMy6HwWabnZwbWhS6s0PgerapzzDfWPGQaNBQdNeIuus3iVUO4tNKo5
         rCZFC5uGXDqEQwvpbWRRaY69gk3zws1dpyUcjB4mMsIs1jWSonoszV3ysPjtOhTeLiz8
         Hft60D2o0YfcyFKvtBdRL7Be1Qb28OiDgp3HYKvZr6xeoeQmHitkUGfBGutwksNG7mDA
         acjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786216701; x=1786821501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLFxNt6cekVDYhRViYWogX3gp+Zn05f4HEhIaap8PSo=;
        b=q8yQtN5/wo5eoG+zRDzpx/IgEsLWoSUqpNs/xmlNb3ODxFwWzbHJZmNWP/Dx+P/+PM
         oi6AgfvQh7DxW69IQbAZ24x6uKe1g9BrD2Vnx5sTieNGznDrfPQIRd2KeahQEg0zM9Yh
         txd/+s/W9rvfsLHsqmDo8lSh2WrooSBs2qT+cckGO7Wgj93jkEezUVfmWKuGsbINB5hz
         sAC9rLukgHqqeO58gQFblfdLj8lX1ybFKuSfH/Nfk3VaWgJroR1qNnoUKovnq1zZJEeJ
         /+scM5BxTZ4MAGrovwW5DGwT7hazZOZb8LjrtvCQs+OFLfDqlnGqm5T1xwn4pM2ckx8F
         kVWg==
X-Forwarded-Encrypted: i=1; AHgh+RoWA1GZmG+jGIuYUSBuSDPxyCLLeCgl8T40rYsvVPVN2K4g2OyLadpLdGsBi/OXIEWjlv0RHe4QHF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ArNZqLlrPH0HzWNX9vFqxbWKRMLl5czIaM59u1y+NBulrJTO
	Q4285xbSdBBMQGcQmQ9ptS6OfVUxSiUZu4XGKsx1mb0gf3VtIZkU3mSE+pTpN4cl3baF8/stlcO
	RcMY8UQ==
X-Gm-Gg: AR+sD12m8oN/HVgQTtMF2zL5GAz6XRay7P4Qy3PuX15ZLX57KwA9CDPiJKsCIHWtVNp
	xOqIqTR6SzJehJsow3BlI+1PtRO8iT8+P7c6oB6lbheObS18JcwtLUzaF1/Z47YsgkO1BxTzPiv
	g6Wy0dsT8GUj4offMt5l50UrWlhnTukabRjX6AtRhik/FLozyjemriQs9ygu9+fXyjOqNYQHaOq
	hhmLAHoeISKOBKryzl6QreanuZG7knZCdaYRcQLQ4zSIOfIKmCb+fooRVrDcxnEB7/C3Jc+ZO3o
	4eg1W8Qm3g4sMsotJMDU3wiVeS0NhZt3upQdlp/8zgD6QWChB18rfKNwFiLAzYrL1z8zFqTFNOm
	DVeqxcULIqHeC4ouvf5vjqDvVUjdg11FqwJygJfxfoG8T+bBTX7yAXCQF7IkGe8nUcIBvNOzP+4
	zwQrsin9FRTBrPBlSbqNYNnRVrYyAU7IzdbhzcKKVJHPp0RHFWTsgEjzy8t22nNA==
X-Received: by 2002:a05:622a:609:b0:51c:1a11:75cf with SMTP id d75a77b69052e-52ce5f7ed9emr323594671cf.7.1786216700651;
        Sat, 08 Aug 2026 12:18:20 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff8d1sm36588246d6.25.2026.08.08.12.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 12:18:19 -0700 (PDT)
Date: Sat, 8 Aug 2026 15:18:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jamie Stephens <jamie.stephens@gmail.com>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>, jikos@kernel.org,
	bentiss@kernel.org, regressions@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
Message-ID: <be3775ba-3e7f-4548-aa1b-4710711f8aed@rowland.harvard.edu>
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
 <anIhyHL4Kl-DX2G_@eggarch>
 <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
 <CABWMpWTn3H7UKqYzr7JP9tkQCEJHsXX-F103nyyey_srn7mvHA@mail.gmail.com>
 <CABWMpWSkJgmoZACA4LYEbmsbEGJMYLyixwv2V3tZbneeKBxpWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABWMpWSkJgmoZACA4LYEbmsbEGJMYLyixwv2V3tZbneeKBxpWg@mail.gmail.com>

On Sat, Aug 08, 2026 at 03:14:38PM -0400, Jamie Stephens wrote:
> I also completed the test with a separate PCIe USB controller based on
> the ASMedia ASM1042.
> 
> The UPS enumerates normally on the ASMedia controller and the kernel
> identifies it correctly as the CyberPower LE1000DG (0764:0501).
> However, on this controller the failure mode is different.
> 
> The device and HID descriptors are readable, but the 504-byte HID
> report descriptor is consistently unavailable. Ten consecutive runs
> of:
> 
>     lsusb -v -d 0764:0501
> 
> all showed:
> 
>     Report Descriptors:
>         ** UNAVAILABLE **
> 
> NUT behaves consistently with that result. usbhid-ups successfully
> opens the device and claims interface 0, but then fails while
> attempting to retrieve the HID report descriptor:
> 
>     Unable to get HID descriptor (Pipe error)
>     HID descriptor length 504
>     Unable to get Report descriptor: Resource temporarily unavailable
>     No matching HID UPS found
> 
> There are no USB disconnects or xHCI errors in dmesg. The device
> remains present and enumerated on the ASMedia controller.

What shows up in usbmon (or equivalently, Wireshark)?

Alan Stern
