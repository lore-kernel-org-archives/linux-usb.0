Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587334;
	b=Mi7QlAgMYbxkWWCZmHAcpuR1TUXNH8RQ8kyCDYbh471xqKFJygeiIsPjYzZuiN6SungP
	 QtsjRR4R6iZBhTgdXBC2ooN1VvzpDMVijcZL3G/mrUMSchA1mRJNXes7iTxSU9dLKk/Z4
	 TX2ajxiXBblRnhgT3PXAwkzcrlqZa+I3iqrFlr6Wqc9QZ7AzZBbtpv9b2rcPA2woK9nbP
	 C2sQvmyLcUi5Nfksw2k+jX4cMfYpiqODDsWnNyGLy7L8V0deq4CuxCg0FXfVZBF7rLUdi
	 txs7Dp4WSdd35a1IJQbu9hlOqOiq1TWi+iwPEppc9MdQZeMdQ5P/4IxnSSjiYVgzrQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
	b=E6lnAH0aevNqLJrHqeNv6kYYehMhoYH3LVCh92XEb12GBFxU5BKTbijraxZpr07SOw8V
	 18120tOU4ClF31cRM+5gj9aH2Hqaa9T0DJr2k+JF0suCwn8FT5fGBIMeRmCX7kmEs081F
	 xlKE09m3i+WX4D9pvWO86cSchdUIsSZ5dE2sHahi9+iEJpVziLoSFG7VW6E3olgzXKY5y
	 M/qJn6PO1Zi5q3/Rns0m+Jd+xEwBuof45E3Ls/rimDI92zAaACfqOC31ODtLv5FzgDuGD
	 AJFJnCMZXGmDSYWTaYy0GfHVeUAQzFTRnQM4eowblrM+Vk7rqb4jdSSR69UdWfpRBJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=FzCmt13c;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA936606A327
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 02:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA936606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=FzCmt13c
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-930c0f9c1b1so266769385a.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 18:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793587333; x=1794192133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
        b=FzCmt13cG+aKsnwVBtMJ9Fmc970lVhhc0e6juVp8IQ97lKL5tpXK3/7CBqRRs2hyJN
         Tze0XcdilstpMTPfqXpq8JvpLywnDzkJFC1em60OFU2G6Cx/netBP4j7KLlFiynKpB5T
         4wjfPJjpyh1zg1x10htvP77jqd854dNdSDKFpzQt7uhTCr0aW3s37SZ2jl9yQ6SJruqC
         mO25pb1tsMdmfK4+VqtiIJUDekdVFkmmOAuCNqcPMROcLtJ/H0h64e7TLmr4QS42uCck
         7/OZebM2x4eqGwYljgydfAXealLtCmRC43f6V733FbDl+vvQHAKuxsetvrkovYH9HTDI
         nT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587333; x=1794192133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2TRRoSnT/Jv3a4iwHG1ldeVncOShjDWYYLdrAMUUEI=;
        b=YCF1SPkemH5G23Wun3lRfw4gEcIob1VWWQjxcpjKIf1nrkDYl0HXwz7cwSikhv0SJC
         YX0w4mhKfhWJ2RQ3O1MjSZWq+owSPpESLbIqhPZd8jIbWl4w6R2H+naRgbq2zgyt0RKD
         DgMSATyTbDKN74tJDL3In0W2gz3TsNNKw3VZx8vKEdC3c3wBOcQFQPWVaf4vtaPxnTSW
         f84PxARAeHR+jyLJOckTSGw3l4GQXWAiI6o4Er2NdrPmQzlj8snUS9E7VI7WtMO75tyE
         mBZi1if5PMfIQgFolLYzvEFImF9QSrpQOVQ1F7g2wvkmddScRCqI5u1kikt2jBvocj+e
         HQog==
X-Forwarded-Encrypted: i=1; AKwUvByan4THg6WJQNzF8GTXUTioqeZYd+mY8oR5fcS/wrrXt3vVrrPat59QKoOieu/XTnYE4RYT/vEnxsw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzVmRPV7F0aGMZsGE1ybkP0cDA+hrc0TJx3hJNSH/HGuKFeyrs
	45uxKMMx8iAVccC5yuaLexRJGCWVnXkassx+mYtzdltFXB1W+Vy0aOxGxPaJ4UGJ8Q==
X-Gm-Gg: AYBFou2Q5WwzhO3qmFu8mk4oauvUzhX2P4ML1SQdqb6bhHr1pZxOopePSsR/45mOZgY
	uggY7quQS2zgPvtSNDQoz+dVK0mSo4X9riZ3NthgGqlUIrTgUkL9ujeRp/QaKyadWIiIaJ2papk
	9uLKZ6M/mv+ke00dZIOrjEPkfVl+DSZPv7nIYqF11z7jf+JfYymW5bSPD/dMolp2Zzmz1wY1LN2
	+2NntFPRH0sbBs2CuX0fTlcXR+fEmY7pqx1Q6iMtGt3oxUrircO4npdIBnsPF1v/8MlfC1S1bqw
	jM0z0/Ro6tqdFfvesloMnzY0DhAD4MVLWJIUVC2BDARtUvmQmMJefw8CG6h5AeJTTtBD9K+FAGu
	guxbm7jToyzaWoBjwU/vWIFWdjOB40xIkmxhMjYV4FXrx/8Kh4hrMZm0/NTmlXKyAKfAvftYAgo
	Gyz0GMil75/0t9wYdBiyaYKaHXWE3LMoM3AoK6NZSv8Jz9eWYtZOBvWIBzMlcZZuPlZtnvdQ+QD
	m9+6l5kMpctL4LDYIc3taVm5eE0Oeh91qJKwkJsd38nhE4Dny9yocbuZtspkoEeaBFgE9eaSkUY
	Lk0bYPAtfHQOnbXEOCuQMfQ6VUNv
X-Received: by 2002:a05:620a:3916:b0:93f:47fa:b722 with SMTP id af79cd13be357-94421618771mr1465258685a.13.1793587332748;
        Sun, 01 Nov 2026 18:42:12 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425a7195esm724633685a.27.2026.11.01.18.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:42:12 -0800 (PST)
Date: Sun, 1 Nov 2026 21:42:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: sashiko-reviews@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device
 drivers that may defer
Message-ID: <b666dc31-1dde-41c3-be0c-3ae5091b9683@rowland.harvard.edu>
References: <20261030151919.3511106-1-jjc@jclark.com>
 <sashiko-outbox-191184@kernel.org>
 <20261031032449.3536559-1-jjc@jclark.com>
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
In-Reply-To: <20261031032449.3536559-1-jjc@jclark.com>

On Sat, Oct 31, 2026 at 10:24:49AM +0700, James Clark wrote:
> On Fri, 30 Oct 2026 15:41:34 +0000, sashiko-bot@kernel.org wrote:
> > However, err_pre_probe only invokes udriver->disconnect(udev) and does not
> > undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
> > usb_unbind_device() does:
> [...]
> > Similarly, on the -ENODEV fallback path where udev->use_generic_driver is set
> > to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
> > usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cause
> > the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
> > second time and emit a duplicate USB_DEVICE_ADD notification without an
> > intervening USB_DEVICE_REMOVE?
> 
> Both of Sashiko's points are correct, but both are pre-existing and this
> patch does not change them.
> 
> Before the patch, a probe() failure returned straight after
> usb_generic_driver_probe() had run, with neither the configuration nor
> the runtime PM reference undone. That has been so since commit
> c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver").
> The -ENODEV fallback has re-run the generic probe under
> usb_generic_driver since commit 88b7381a939d ("USB: Select better
> matching USB drivers when available").
> 
> The patch deliberately handles a pre_probe() error other than
> -EPROBE_DEFER exactly as it handles the same error from probe(), so that
> the fallback keeps working. This is stated in the kerneldoc. The only
> new code on the error path is the disconnect() call, which undoes what
> pre_probe() set up. A complete unwind in usb_probe_device() would be a
> separate change.

Since your new pre_probe() will interact with the bugs mentioned by 
Sashiko, perhaps you could submit a patch series which implements 
pre_probe() _and_ fixes those bugs?

Alan Stern
