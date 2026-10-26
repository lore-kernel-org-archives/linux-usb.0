Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013353;
	b=Da3BFVC9LUfHzI2ZI1qvfF/xEQ0AUsb/YPdWhpa5qWBi2aJ0m/Hm+rwQvKQ6Sa4r1Yww
	 uDFIOEStdAD82pg/DACf0Rmr97dzHAHLOuTP6z2MBG7+5qadVyjwKARJMoHw0fQn+4Kv9
	 HIdfse7rOzsLSnRQPK8eNoy52hq9ZjYF4AcGejy1kTcM7p9eZlXXCVZdszgAzHr5yFKqY
	 DaQZUf8sfkVOXKRlHUlSvuQ7kyEI8rLVdyAwD8GLzL/slfnp6nNrmocYsUiWtZoD9QHir
	 0wNuCKR9fvPpCNpxaWu9wdS2ukQKh+QL5QCHcT39gQ7Xjb5YvYYyWZv8eKiACPpfETQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6iTiJ4gJLJtfRbm9dDiou/YdJGjg4cibrIKm6WkJa40=;
	b=0uMVMxv8SxFq24q7FtuWyevAwJHTAQRRmvjRjK9HpdPp0zQjZ6rc33ElJm7LMZ+nwpZe
	 tphmnDQVtwjG6h/DNJ8GafcBebPOtB842DqpCcMmh7676wATpeSxNP0pk+HtnVOAa1rgV
	 TQphoyzah6FvmAEny2DdexKK8U+r9a+7BJ6xfoPa42bDwqtXzdrxB7hsgc195+nXumphV
	 suIekhy630+uGXncuXaxqrifhiKas8BnTHPKQOBCYsuCit7W/+nKyDqxrOWUel/DApIkY
	 XHVvL63rcU1S1VMW1O6MA7EOHhZ2eou8eYFWN0GJp9eAREm/JjxHgVWsRcA7/4sPQqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mt+DtVSq;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76985606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 11:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76985606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mt+DtVSq
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so18355355e9.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013352; x=1793618152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iTiJ4gJLJtfRbm9dDiou/YdJGjg4cibrIKm6WkJa40=;
        b=Mt+DtVSqMZ2/75wvAbHGOwxFAJL13z+1YstWQKiIXhaT7Pw2zCKj0Id8EOhyw8y8qY
         WZrzN6EUW4CvpZTYF3Phjs+99RRqCn3D9qrA6aDwRfwA2YVnRd4KPdN0EGG5b4JEsrie
         TuMKbeyUwn3vOq7iW6e92odAm/XBqloZvSNfh7G63bs28XCKlXA0pk2gb1vS8cZvEXGZ
         UgapRUu/xne6yo9+FWffa71Lk0gpxDu8qKXJBvmYyPkOMYjvzet+f8132tAC39P8mxNH
         wgE/D6DVEc6qC3Y89Zi28+HxH/5cr62uglj2iAPBt9faDuUP1NbiopUbdHG7wA/6vqUD
         5hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013352; x=1793618152;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iTiJ4gJLJtfRbm9dDiou/YdJGjg4cibrIKm6WkJa40=;
        b=NBSVVys2V+U4k63ykb/zDCpEGXqBx+Auy0RSzNMnlVvVlospFvOXpjIWffu34nCYxi
         AvCVne0O4ZzHFNTPkKI5TmKbUDUUlJqT2Q53pG/ldaMkLmU/ECd4G+87V+0HxFxHTWaR
         hSQadI4K7jNkYX3NNPtBd6sba2jhQ3W+0joNLMJwhZZtrmd8HGs0xj3rKXJWfhS5YqJa
         L5KMNFx0Bx7KutanqICJ+AAp9qoNDEAUMRGk5un8UzgE3e38c4OoF0oAq/A3Ocr/Cogp
         KQr/wbQRU4+/lVmgmMv0ajhJTqLxq0wlBlVDALU6OlORPdxcOyH+uHAs/JCnCP+17g1l
         7Tlg==
X-Forwarded-Encrypted: i=1; AKwUvBykD9qiX+Yqx4TAsDEl9/CqXLoVdwXRFsytVBtpys/Rynj5AeIouInszxv4X36FuNl0P4aoq84BkCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGKnC9CLjeZJLYWrxhtmaEEQC+vmz6VLDbtiAdQgTSIrmkbTe8
	CZsodAVHcxkYwslkcmg8SEcIA53Q3mOM7xc0B81fbX2xXwZ1xehWZ5OA
X-Gm-Gg: AYBFou3iWmi7Wecn5edX4obaCeFPfD9yXR9d5awKobifREYnjrEnoqCkJit1Rbkw5ht
	FOfPmuYGvppW+95y83mSkVZaHAfsbWIc9VlPFVjDHA/wTErIlgeOeLfidrFk6+kcxiUr0No2NzT
	upO3k9A3IO/rfc2eEtpjKttOvKxtbgR7Ni4vzhbWcbF3Rc7cSfrrVKhC7oxIMX47E+PGhrOmBdy
	zhUXdu/ou0+YyZrHNpLFogga5KCCldGH3z4EiAPY7QsIMmyXLTt3s4SkuOA5YD8E4KwA4nkdf+7
	Yl7+5FiSDY0i9oQvshfDyX6wolgNZWYLpCsDY+8y5ium/I/Rf6rcTiMf6J28fok8TDG1Dw+AHQZ
	8NLKZf3UgiMMApFm1uLPyYWe1yZAvqB/Gn+FCKt0TwA3p7N2r3OanV9FEiBGxcQpPUfqJrVLWuD
	Oiowm+HzYbZeByAJYPPwTGwqj0D+tZADntw+zsIrTrnh841v0N86oVXf4b20nCP2qCeVx+mZ2RW
	yu/+Pebdb/FFDNndGcI1+N2T1VVN2zzf6aVmD79s08+TqnZwNqz5M7JMWeRgZmV
X-Received: by 2002:a05:600c:a00c:b0:4a1:e04f:15c7 with SMTP id 5b1f17b1804b1-4a35ac881e6mr130266715e9.5.1793013351721;
        Mon, 26 Oct 2026 04:15:51 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm16306551f8f.12.2026.10.26.04.15.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 26 Oct 2026 04:15:51 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:15:44 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Dennis Wissel <dennis@dsine.de>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261026121544.41fbb71a.michal.pecio@gmail.com>
In-Reply-To: <ZxkLPfjZS8ibGyR_gfGYKg@dsine.de>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<ZxkLPfjZS8ibGyR_gfGYKg@dsine.de>
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

There was some problem and I haven't got this message until I found
it in the mailing list archive today.

On Sun, 25 Oct 2026 12:11:21 +0100, Dennis Wissel wrote:
> 7.2.11-1-cachyos booted with "xhci_hcd.dyndbg=+p usbcore.dyndbg=+p
> log_buf_len=16M", mouse plugged in at boot. Below are the lines for
> port 1-1 / slot 1. The full log is 270 KB, so I can send it off-list or
> post it somewhere if needed.
> 
> This time all four interfaces failed with -71, not only 2 and 3 as
> in my earlier 7.2.11 boots, and there was no "usb 1-1: reset", only
> the disconnect/re-enumeration. The device seems to drop off the bus
> right after Set Configuration, at the first control transfer of the
> usbhid probe:

OK, but you showed a different log where the device gets reset.
That's the interesting case which causes problems with 1f36cc9fa949
and would be useful to see with debugging enabled.

I wonder if it's possible that usbhid driver requests a reset to
recover from errors and usbcore performs it blindly without paying
attention to connect status? Maybe enable usbhid debug as well.

BTW, it's likely that the same will happen if the mouse is plugged
during operation, so there may be no need to reboot each time. And
log would be free of unrelated boot time noise.

Regards,
Michal
