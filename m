Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684406;
	b=aJRdsLSYD2nyeXEjVf/5ga3Mn/YiSVmZ+z/6aTNZNmWwfvtFcrBSrqMhaC68zsSmWLy2
	 SYmWtP3/XpW+n68gDTbr1jcZhHI9n3sGclFGziUxfQPvfFL6+jsct0k+ZpeCPulKnJm+W
	 thct8OfYfvIg2CjmC6QReOe2ne8NBVAk0KHiuwqq7JIFhSWJQ6wkMfSs5/47xcMFJPiv3
	 6zyU3lOMMHzjhAoPoCNW8UjH1sFmtfTkpSzCqyliFIMrFn8+RZvC7x2QWx3IsB9RGR2YH
	 tG3eVHKuvYt3liD40egLmh5czsAGEWjKKEuRcbFZjLAcCekJj3MXi+RUiNkJuBZQ3zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
	b=1g+I6txWvN6yDtzYZNA4M2UJY3bvexxhPsx1u8KFCrIirN4d/JqNgd78VHHgxtd5z/hK
	 XpzLOIvM0QFwx2MdI8J282HnA6Ya33WR5GSN203Kq/07ZXLS54dlNaI3cHIhtPM3rOJCF
	 qZqQSiurOjhoVeajhhNV0XYvaAvg8GvT7qqF/PoJ1M4Vri+xACcOrddNpPNMOw4TKxCY4
	 NgusN3DYCcFrNuBpRJGl8D6MbtZn7nvOkiNQVK+0eWj7PWscFMKmskLDyWwV+whHkOhjg
	 rgkQpdssp7XpowRT0WGj71tID6bllYknzFQKk3zZ8uiyl/9WJGdrvw4FZv7Kb2jaF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XG7lEL+c;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5165606A32C
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 05:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5165606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XG7lEL+c
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9d7791b00so29819825ad.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 21:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793684400; x=1794289200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
        b=XG7lEL+ceAJMrb013ECErNIArebvo21jKlpmwlwCIk72+UgmBRv2fFMHRknWaEXY+W
         iV0+e3X/dEY596kCb8JdOOQYDsW/+cqZGOf/B7uediCRkGs/hwXE/NP2iHHdqFCNJCqy
         Wc/04viUI1tAfYqtI88RHCoj/ywm/gJvKLpUleWDv9FkBAx0SUV3TFanEYbDWt8BeoYC
         PLyzQlrE4z51j1NE2aE65wV4rcZbI8oxFoepRZPIMrTSjvy+Q+gzNCqIcTml2Vs6HJCC
         o0NBfiKkgkBNGM52WZ7Ze2Dg1NJ5/lmYmt3z1WsfSt50xk7xo0zGaTBw3j4NHKsfgDfm
         YfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793684400; x=1794289200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNfcSVIGEmINCcVw+uB8DPAiuuIIPUqBYgGuYhjglr0=;
        b=udumukoVev75/qZywsk7whNhVlJCZdQzQwbU72SSrLQEbNOLwvM26jHOPH9qDbqb+n
         x+Vz5aozB8tTSZvoV/AmIyeNR1vL62yOsGNRGlIo22ptEh37ePhyjuQsEygLlgMNTlpO
         9FnqLg6+yZce9wZZanumTRzbPOdWwBpW/Gi6sUzq22Q/3jVyctr8rk6Y0WvLpOKCpZT5
         4VF98vZKYCEXB/jN1PyRrXC5urCmoUYj1P3d+Fq3J4nn3QfI1e96i9qVsF5sKsa5O6+0
         ygpIN7tP/5K3WVN03UrCZwdVQtnNtON0va5RyO9Xjq8JW2FuCJuiPYYTPcIaNhe7TNhf
         ZPCg==
X-Forwarded-Encrypted: i=1; AKwUvBxCUn5QousCoMpWVbUqJ5XfW1ja2taMBm5Zdvr0WcW+bihou5iVzLH491YZbLnmrfyjTZM0vOrpoDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M/iSICxdsTA1ogZjKSvs/PLSzh/8Xn3Sct2bbBlpbZYdo9PMf
	O67S5MR9nvwGxHQUeKjFdRDMuqleXN4JLgmsjAn16sUf/5uRkpN9Ox8VQL70iRaizg==
X-Gm-Gg: AYBFou0fEMxfmSr4dNSaGIbu/PyuGgCxmnWh2v2fMIfVAlMqrNABoQaxihUw59l3Oqg
	K0niARDiEOUebxjMI8yaNbqzL69l7StOes+vVNbZRjEGH1hrB4PCSlj8HsbEiCdMX6DHiFfYGYp
	Z3dgxc/V8H66GTgLt7Mti905h8Jv8t0IwC8hpTrbLo7ZvUhLwzdT6v+pDNS+hcnkytxmYa1BV18
	+NSCIR5luh/h3hWmUbBeEwE3pN6JNF96Ujr/bGSkLLFmm6LsuUSdHK/ztotTbhk6pG6LppePnSt
	Xk0fRcX2b1E7FVoZOfdMmBATcUw2SnrrjqKaKRqMy8nhStw9oKLTEQyGzMEaFu8v8gnfVkY+qhy
	LN5AZexitQBAHyyHL3UTO6biRqjfWeCbVeT6tVpwT0EvS4eho2goxxx3dljifvAIf2mHFK7mQ7k
	iQ3u3cdN7/jnbgJLzLnPwmHcE13PYdtvA3z/QrWr+nxTF9jyAPAUr0yPeYYQn0Q9GIhbH0/kZqa
	5NuRRCZ1KV4DSD3HjbZDtq+ZtGSCafwoBpG66upvqlPwOjnntYsbEgkB15UOFM9Wa5sMe3Q+ADM
	JivMJH6BK7gvumHgyP27CZYHPqKtycashJ3srSplZDvVHmu1Md/JIewQr97+Wur2kUSPYR8hlzn
	SQscqofGAh7XCFZ0mCQ==
X-Received: by 2002:a17:902:ce05:b0:2dd:ad73:5b6f with SMTP id d9443c01a7336-2eb364b55camr111236385ad.31.1793684400160;
        Mon, 02 Nov 2026 21:40:00 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392494edsm35154505ad.31.2026.11.02.21.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 21:39:58 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: sashiko-reviews@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Tue,  3 Nov 2026 12:39:52 +0700
Message-ID: <20261103053952.1138398-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-194542@kernel.org>
References: <cover.1793669297.git.jjc@jclark.com> <e96b91c85945237ca455869bf4d5a1e177358b54.1793669297.git.jjc@jclark.com> <sashiko-outbox-194542@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 03 Nov 2026 03:51:41 +0000, sashiko-bot@kernel.org wrote:
> First, when udriver->pre_probe(udev) returns -ENODEV (for example from
> onboard_dev_usbdev_pre_probe() -> _find_onboard_dev()), usb_probe_device()
> still calls usb_autoresume_device(udev) and usb_generic_driver_probe(udev)
> to configure the device, bind all child interface drivers (triggering
> deferred probing), and emit USB_DEVICE_ADD, only to immediately tear them
> all down a few lines later in the error == -ENODEV block via
> usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev).

This is deliberate, and documented in the @pre_probe kerneldoc. An
error from pre_probe() other than -EPROBE_DEFER is handled as if
probe() had returned it, after the generic probe has run. This keeps
the -ENODEV fallback to the generic driver working as it does for
probe(). For onboard_usb_dev nothing changes: its -ENODEV used to come
from probe().

> Second, if udriver->pre_probe(udev) or udriver->probe(udev) fails with any
> other error (such as -EINVAL or -ENOMEM), usb_probe_device() jumps to
> err_pre_probe, which only calls udriver->disconnect(udev) and does not call
> usb_generic_driver_disconnect(udev) or usb_autosuspend_device(udev) to
> unwind the generic probe and runtime PM state. Because really_probe()
> clears udev->dev.driver to NULL when usb_probe_device() fails:
>
> - When udev is later unplugged, usb_disconnect() -> device_del() skips
>   usb_unbind_device() because udev->dev.driver is NULL, so
>   usb_notify_remove_device() (USB_DEVICE_REMOVE) is never sent. Subscribers
>   such as usbport_trig_notify() in drivers/usb/core/ledtrig-usbport.c never
>   remove the port entries added on USB_DEVICE_ADD, leaking struct
>   usbport_trig_port objects and sysfs attributes with a dangling port->hub
>   pointer to the freed struct usb_device, and usbdev_notify() in
>   drivers/usb/core/devio.c never runs usbdev_remove().

This was raised in Sashiko's review of v2. I missed that it can be fixed
when the device is unplugged. I will attempt to fix this in v4. I think
it can be fixed by recording in struct usb_device that USB_DEVICE_ADD
has been sent, and having usb_disconnect() send USB_DEVICE_REMOVE for a
device that has no driver.

> - For drivers with supports_autosuspend = 1 (such as
>   onboard_dev_usbdev_driver), usb_probe_device() does not take a runtime PM
>   reference, and hub_configure() enables autosuspend on hub devices; once
>   the device suspends, usb_resume_device() fails with -ENOTCONN because
>   udev->dev.driver is NULL.

This is a pre-existing bug that is new in this review.
usb_suspend_device() does a generic suspend for a device without a
driver, but usb_resume_device() refuses to resume one. I don't know
why resume is refused. If a generic resume is safe there, that would
fix it.

> Third, if udriver->pre_probe(udev) succeeds and udriver->probe(udev) then
> returns -ENODEV, the error == -ENODEV block runs
> usb_generic_driver_disconnect(udev) and usb_autosuspend_device(udev) before
> err_pre_probe calls udriver->disconnect(udev), reversing the teardown order
> used in usb_unbind_device():

I will fix this in v4.

James
