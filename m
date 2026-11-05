Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910628;
	b=gwUC4CH8UxYmqKndUxpCRJYuUq7Qaa3rUeabNVELT10LnmgHsRGmu335HRYzbzPnEJ/z
	 QFMM+paYO4zSAQzSpDuy7hrbhtD/QXPcslOnn26NNaidFfBasvoYMyv7+8CHztCfa/95G
	 FRo/X6S9UPrMWRk7thvukxeqFHnz7A0R5MTp+gCEHbhDfFEtXqrTw23jPsmhrtjdHJHmx
	 SjiNUSEkajgf8cTHcHKYK+6E6zKtsBwbDz1tQ1teO2WqHhYgZAveTzU/0Xr4PrrqMNuSr
	 U/8ZRa35wgYMyL/eAFSjrV507ohcO1SgVQkANqLxvidO482m4WbfRsBAIRfsVbM5PRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
	b=1GiyQ2MNUQOB8aAHtHDj4jASKIqYQhwqOGSBXJmpsph8SHeIG/PuWVbj67mIeNNVShAJ
	 azg4YqARvtiBwjNlNYLRdHgzB9CwVypcBOjDmRWwh+0VyW50mzIWyoYrKomYXPW3UvpKy
	 rOqp5V45jNM9RQPFMEunFhOwlEHd1GFe63vMDcLgccLFBfWBeXlZkoaP6UjHwi6saYiPO
	 V5YAG0iOOyGYspHbHcfzZDCcWK5nzEV0mxSNnwSfVoJTvcOuglclaOtUaMfSmI0FIGFak
	 8Jvz4c1NESBHJ/wPAc0opQtvFWYb8v+kYiuCRYu8Xzkd5xWWEhTW6FqjOIs+PN0Nlfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nnP5JxbZ;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE5606A329
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 20:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3AE5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nnP5JxbZ
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53bb57f1310so24624391cf.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 12:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793910627; x=1794515427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
        b=nnP5JxbZfeb8fykuTsu7lOgLI/QEFjRVc+fu1CYYF7N69sOiXDjrrCF6BHJfgpwcaL
         lEgvTmREkxcrtOZ4P8RIF3pTSLmhWQZb0J6DpuwAtLLTSNvKJnG0f4N7DpigRBO0w10/
         jnXWhSCUllEDxGd23xNXeJ90IIwwMXsh2ZZrTTMpleuZfIQ/2/YoYOnyLU+jdOktjhZK
         D6yZ3PFZBa09Jg2E2q2tFJ9dY64JNxtKAPkRezE/XXLt7YJQASLBnbdTsc6XqpZ8XqEo
         1p8iEvylpaNMSnujQyNYTblqNW60mVS0/K/5Nai7YLiJvG1GTl0xXFP/Skp78N2suhG4
         1OPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910627; x=1794515427;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
        b=b5T1KwYp8KNDwVT0mpCIiGzQ0oKWhYsvw5ebfatLaOjCRhm/VxucB2pX2ykv5GFvc3
         /FylX8Vnuir6y62PGJXNfaGW7vAy4po3bArW8I3cBafD805wZhKRbAcuYH6fDgHlIv5P
         ElGMFsQEg/Nv18NGC0zldSFVd79YyLlaXHbNLxMNzVJNVoXvx0wvs/bg+7mSNFlNFWfV
         kVOZ+8rvGbrF5tfdBbfeIW17dmCR1RgBf5fRgQdiArMxMO7hYgN1lGDCSd3RYXeNZFFl
         e5JYR8AdSPJf7PwDCmLPnmtj/0zeZ7AncVzqUaJOoWu3Hwgkvud99r5Eig4Ey8kdfC/c
         AQUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVumV2iFkXNLdRseXENliRj//FWTa9NpK9ivcfBK7NuF/4JFGaayv/S+6P++ItEuTmkljLWPGWY6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x2bbh/4pQBYYP6UolEfNKUFH4zGIDSrVYH5dfssQkJNR0REGH
	12WvIGxXtPy3XEx6gCcLK51bmWQEqjaAsrjtrJnOUvWh0XB37ipRqcHre8g3fAfbhg==
X-Gm-Gg: AYBFou19EKt9Gv9ZxRF6+6lO2QVv9MpeNtv5YFzMOVYmdirsyD4bkH0/Tg3U8lzpH5b
	QNhxviSr+qTWkLCI0IkVEndNpGysE79r/HXhUnwc1/kcptjt5iuZJer+BUKk85tkk494smKT0vl
	ZZqHJ1THw9gVqWdIQLoTSPlj71KfVz9SJ7yyfBGA+Z+LJM3GjQkAsM1wnVWxgsTgu4ap+Wh83ri
	nvMmoSDLJ7oUlEMhzW4k55Ie/NLswAP1DuL6ouEECfsrdB71BY8VrAzRWJjIji21XR4zzI6gQEs
	8um/OvA5mZmPfFducNp5Wd7Yyy+LxAVTlWj4nW456602cier/icF1iRwrxC8qAeoqSOW/iVMlMg
	8aO7TZKsK/cTGEyEZpl4885xMkqvR7pW8TcDP9+1nAJbA/NsmwGexaUm+0SJNG8J1fK/XYsZwJs
	w/xRccsrSvtpzxr0DBhacTZUy15irRathwoUtaFlM4gJP+CoPoaSKhYyyQeSVFGxBceAhCS0WhN
	APlu6RyFFXGQUvNWomtXjsyTfQ/Ih3KlwiIeplRpSc2/sqSeyGjKUJrssnseIAzYycRMIyM+szt
	9M8zfw1QsXaeTktJmdZX8L4KZHrK
X-Received: by 2002:a05:622a:2308:b0:532:cad2:539f with SMTP id d75a77b69052e-54e1576ccbamr6840201cf.53.1793910626495;
        Thu, 05 Nov 2026 12:30:26 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25d65a9csm2142601cf.11.2026.11.05.12.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:30:25 -0800 (PST)
Date: Thu, 5 Nov 2026 15:30:23 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 1/2] usb: core: clean up before handing a device to
 the generic driver
Message-ID: <9372664c-a8d4-4098-ade2-b73ec214960c@rowland.harvard.edu>
References: <cover.1793669297.git.jjc@jclark.com>
 <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>

On Tue, Nov 03, 2026 at 10:34:12AM +0700, James Clark wrote:
> When a USB device driver's probe returns -ENODEV, usb_probe_device()
> hands the device to the generic driver. It does not first undo what it
> did before calling the probe. This causes two problems.
> 
> First, if the driver sets generic_subclass, the generic probe has
> already run. It configured the device and sent a USB_DEVICE_ADD
> notification. The generic driver then does both again. Notifier users
> such as the usbport LED trigger see two USB_DEVICE_ADDs with no
> USB_DEVICE_REMOVE in between.
> 
> Second, if the driver does not set supports_autosuspend, a runtime PM
> reference was taken before the probe. Nothing drops it, so the device
> can never be runtime suspended.
> 
> Clean up before handing the device over, in the same way as
> usb_unbind_device() does when a driver is unbound: first, for a driver
> that sets generic_subclass, call usb_generic_driver_disconnect();
> second, for a driver that does not set supports_autosuspend, drop the
> runtime PM reference with usb_autosuspend_device().
> 
> This leaves one limitation. Until the generic driver binds, the device
> has no driver. If it is runtime suspended in that time, it can't be
> resumed. This is transient: the generic driver resumes the device when
> it binds.
> 
> This change does not alter what happens when the probe fails with any
> other error. The device stays configured, so its interfaces keep
> working. It keeps the runtime PM reference, because a device without a
> driver can't be resumed. Its USB_DEVICE_ADD stays unpaired, because
> sending USB_DEVICE_REMOVE would mean unconfiguring the device.
> 
> Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
> Signed-off-by: James Clark <jjc@jclark.com>
> ---
>  drivers/usb/core/driver.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index d3a61ebc6afb..9b8cd0e4219e 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -295,6 +295,10 @@ static int usb_probe_device(struct device *dev)
>  		error = -EINVAL;
>  	if (error == -ENODEV && udriver != &usb_generic_driver &&
>  	    (udriver->id_table || udriver->match)) {
> +		if (udriver->generic_subclass)
> +			usb_generic_driver_disconnect(udev);
> +		if (!udriver->supports_autosuspend)
> +			usb_autosuspend_device(udev);
>  		udev->use_generic_driver = 1;
>  		return -EPROBE_DEFER;
>  	}

I was talking about more than just this part.  What happens if 
usb_generic_driver_probe() (near the start of the function) returns an 
error?  (And shouldn't the lines that test the return value and do the 
early return be part of the same conditional block as the function 
call?)

Alan Stern
