Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417097;
	b=totGd+CcWEG3QkaYx/NuGZta00bfRlp03eC7qHoADAcK4nJlJ0eR3kCVj+ke15KoDuXh
	 kyrudHOGugyDXHWy47BcvISLHcHU6KkRGatwtJL9/nkqExLzj7dmkMJQObZnsflj9Cs8f
	 hFUxqdjpgQ9EkrzYQUdCDgNrjQUvtGA9y40TXTID7yjg5mxCAXfEYT7bTBNjQax1K1b9b
	 w0wsdiPvMSICGX4XAnbvROIRuMHZZO2m+aYJijC/ImTrdxFRgeXe6349Ibh80RZ/vO8TN
	 E8jfx2w6lyLEXwYYUu+KYkb5rwUv6ToI9C7dUy5CEcAhRgttfrOVqJKjXUPIuY1V2Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
	b=vcWPWZa5YSUOEv5i4VcAkF+7xechrFNn/S/yVV9ZPIoLmChYWJTStKJSvhounMr698ns
	 1ecxmwX1xiW0GToVZF9UAXhHt+Lh//Dm1N8d3koDHFT+q3yipKACa7M1nLBNBI7/stCA0
	 wD3YN6HhD9YoWpDY660VJ/gkDZ6zkTFr3r86py0wIStto2fszQXZHEWtM2PY9bEypnGov
	 HNfWqLxRSWQwxv3HE/MC5XNMx54He+tZaJ9XzkFPkZLWp7+sAxSEtPSbaQHjD/Z6Mt81z
	 ReDpTeg1XEyX9KkHfTfeZ2iW0Dphl6o9eCvtvviZHzMU+pSGprGCQHYLjtmvgwOGoCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aDgZ3UpT;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D52D606A320
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 03:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D52D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aDgZ3UpT
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so789183a91.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 20:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793417096; x=1794021896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
        b=aDgZ3UpToUzDOlnxjbE7VNaBZ7cdT+IEag6WoI9S/ekgWsEOfCHcDjkjKIS+JOhFTD
         /k3oUgD+3btUmUjvLioU1ab4F3dLBVtjW0AcoPwHZc7QLiB12xn/KNi+Msj3TLZX3+46
         XGbEG4pbl+KHZcoGpoKcgsg84bIybc2QqFpLTRnnQcutN8v6P6Z4aqQkHCzzYyvtlOvC
         aJak7nKtDXuOMX2GcPsjnZ2q3bMOuvq+Z3uDed9zW94UGkexgA+ZlxCfmvxmsHOu0uBR
         UZZxRRCaYekQ1gTEAg6a2hIot9TGmODssEuU//ODKx9v+/yeoeZQKFQfLRuQiXv6TRUC
         efBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417096; x=1794021896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
        b=d9K/L5Lj/gEQ4QD1ZJ8oEMJi7CoISQftDXdhMDTPTP73fmKj+Rn0Hmm4tgwLs86a2i
         rAp4cjgqXV+TGxP1OpWDgIJhhbawf0/t5xJgx99t55CmzcDwd6+i0tgwWKoPuCPJGeXb
         XVzsq82Ml0b5fhgVrtPTNGYdTBntHY9k7mEyef9ur8qsBqrbSUZrFfBluVSm2Tyzmpxv
         Tf7oN2rALDQwkqiySNzmHUR7BU4Yn0/JhRBW2dCYr0X+9TKcu99qtIOCsxgi1SrdQZB0
         naXCNdKsjJh8lGHyMOQVjxY5i6cERTtnT8fuSBNYfuBek/tAT+BrFBlJN9+nRT4voPkJ
         CvpA==
X-Forwarded-Encrypted: i=1; AKwUvBwBo/j5pVYCapHBEFs7GZAXAUQrmXXx6b0myf9N1ESJttsxQ/JwttcQL584E3iUorMs0J/pyxyMXuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXpFvpN2s4bmRVeRVzU4/CS3fvM4t1Esg12xFJ7NhiDHuhNlw1
	x6M5ro9XabzJAw1f+Ewz6tU8dpaPw7Nkr/GEftKBpQqnjp0aGxyN86QNwIOPXLThtw==
X-Gm-Gg: AYBFou03xf5Y3SUDApxXBJAz+8uFbr1a8/Gcloe/USYoH2rgpoAjlYhK/alVZthJ1qz
	rmz0QTGNRp2K8GnfeUx5IaPD7zOxPOugTCq+YY38ktt89kyfWcXOh319p3K8dLK1Xy/86OYmrBy
	WTHrPEzKxcnx2xMPzoezBSek9ZulNmSadt6fZ0aDy5QmfHWxblq1eTPLMOpeTRF1j3uJHnqzYU/
	ZxaKbX8YBIf6XaR9gT3ayVPRjHzfghTkx+7LGbv+euD8dHvd6TlEdcrL9j9n6PxeP5NiA/o7kgX
	/b8GlRXQ99GUPV1FIaocOW6iiiEE+6D+6Se5fWuK44HqMYa9Mk5dOlh0EXGzW+tUCb05VLAN/Ky
	mZqLxxDxmQ47a79Cjl5Lzd7ZpEHQJ8kNf7nKM02WPESiF45DPilksYJONc1Hx1glw1/ypuvw+T0
	NK/paXgsdIabHLLkoxR1Cj9V+t5MSUPbF399t6qXHoZLOLp8U74VeFmMAMlepjZD3yxs9enTtKc
	YFP82kmtGIcv4qnKACEW07LF3SM3hoOE+1UkGVG52F5saX4EqRcizXTw5wOGR64FTtvulmBwe2/
	s8NkAy7rTHmy02Weng9IB0EaBXm56PqAxjE5CX0Csldp+xv30txQj7gb+kXtB6WzGvYPqNv+STO
	w47buAftIoz/zwoZxFAgJXQTmA9pvuQR8wPQSWw==
X-Received: by 2002:a17:90a:ec8e:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3ae8980ede9mr2974708a91.37.1793417096261;
        Fri, 30 Oct 2026 20:24:56 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f99899sm2940976a91.2.2026.10.30.20.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:24:55 -0700 (PDT)
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
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Sat, 31 Oct 2026 10:24:49 +0700
Message-ID: <20261031032449.3536559-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-191184@kernel.org>
References: <20261030151919.3511106-1-jjc@jclark.com> <sashiko-outbox-191184@kernel.org>
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

On Fri, 30 Oct 2026 15:41:34 +0000, sashiko-bot@kernel.org wrote:
> However, err_pre_probe only invokes udriver->disconnect(udev) and does not
> undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
> usb_unbind_device() does:
[...]
> Similarly, on the -ENODEV fallback path where udev->use_generic_driver is set
> to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
> usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cause
> the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
> second time and emit a duplicate USB_DEVICE_ADD notification without an
> intervening USB_DEVICE_REMOVE?

Both of Sashiko's points are correct, but both are pre-existing and this
patch does not change them.

Before the patch, a probe() failure returned straight after
usb_generic_driver_probe() had run, with neither the configuration nor
the runtime PM reference undone. That has been so since commit
c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver").
The -ENODEV fallback has re-run the generic probe under
usb_generic_driver since commit 88b7381a939d ("USB: Select better
matching USB drivers when available").

The patch deliberately handles a pre_probe() error other than
-EPROBE_DEFER exactly as it handles the same error from probe(), so that
the fallback keeps working. This is stated in the kerneldoc. The only
new code on the error path is the disconnect() call, which undoes what
pre_probe() set up. A complete unwind in usb_probe_device() would be a
separate change.

James
