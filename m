Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868276;
	b=ijnaT2ix2uooK/ZjRdwHyuYXnT2bGCI1aiu4DenZ+8ppuadJVjvS9FPB2JgTvUcN93T6
	 8n61CKx/faiLWqbZ59THH2zatQV6XVQHXQbI6rPSjLmZN/0jr+rrUBOecp2tOrj8fS+UJ
	 N74LWCw7rxCTenSTCQaY8VXaUnX9tNnQyMVWQH8GrASQbF6T3ubZRq+TU/PYEn5locQX9
	 IsP1UlfKI8llCSMJvz7ILMKuK+uH3rpBUiVjQ97rDYltLNQhD5FnxUtw4hhjolM31I3T+
	 ypaXfWs6qhNlq3ytzUYzF/ZrO676Zp0P6VJKiEpW8n6nAjkJniL0Z5KHrdgDOEeXkXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mNluQcOZEwvamzq6OapN00hIF97IaL6Fx+04wA+naZ8=;
	b=OjZBmNwpo+3eYW3r2aJM8zN5x4Gdik4bxe4ob2BBJtSzUfmTsFMKGVYWmHVfl9IHOL1f
	 OnE61l8JDFYH+ukzPxLHYPPmzOX3bxU0d2AZottdi8aMqhT9bD0s/NS6IIP0d91XEh9HF
	 BFauXM9Ir/q7BYuqHSfm3afZXsJnOxsa96ZNSw4B9KibHC3hTFLAdMnPqoEG22QChPnBP
	 ev6p4yimvGecGv5s4LT+k4znMCusRA51VjlwTRSD8l4epI+OYqreGD2uWIXID8c3QhLVZ
	 COz3ax07Xxb6adiKUQWZ0rGU3VCt0xEXFnDSe/cZKfRTxjptQMpWdTOfJXl4YV4V3AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a4tOdIfv;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E50606A337
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 22:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E50606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a4tOdIfv
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2c307e62so59495595ad.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 14:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794868270; x=1795473070; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNluQcOZEwvamzq6OapN00hIF97IaL6Fx+04wA+naZ8=;
        b=a4tOdIfvaaYo8b1zG8RndIFejdbkwZQGX4fR5BI7vZNCkfglsYtOJddspsXUWzW1YP
         4HvQnYw1NzUHJzoTE8z9JfF/YxZIY6SEEiHViO3uiP0W6wjEhMOAbGMUO69oymnf4Q+J
         Vi5nSKMxY76bNZtaKCRwoS1Fd1DxAfr6gT58SIoV319jP/wjbNxXhwA/imeol9UxaMBK
         l+7Nvqc+svuKW0kOOXNQ10LePP77C6qhGpQVwaNruylh8IVAdut8XJWwlWBXFIGxi1AT
         YaMdsr7VylLsGfiaXZuwyM7m/84K9r/dOuHGu0SxZZLkhvWqmJ3qAdWflHo+vI8Eyr4t
         4WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868270; x=1795473070;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNluQcOZEwvamzq6OapN00hIF97IaL6Fx+04wA+naZ8=;
        b=HILa4684qmu7uv9OnTnTqN5i07Ll8vb50GnBP4f/oTiARHEG+5SF7NhOo4nUlt2qiN
         cDMIBBwJXWKgunPWkJceFh+hsH3v5cZSZZC2aq8gy4FOO1tXDeciIqac8crOPZ+YNnHr
         gRZfA0UQB/orVyxmNMpgeI6FvxXxQRjvqI0ia0+zzN9Qf2tNE2FX1fn9p/TAIkiz9Ql3
         5tw09XU8fmETiboD5560DhXQxHjTJMyK0HoW3n2t6Uga+ff9uKEFWl/hmYOV3kcdHBWO
         O7SoVZVQxxvTBpdqjxEeM55QDhwQhJwF9r4jfbzSONtAHdCmlIsQvpnNwJqmxdvC2Jsh
         cUlA==
X-Forwarded-Encrypted: i=1; AL+hErGYoMT2q3XcXpb6AD1s7ghLtxdpCa5bNk/FvWuGZFZQeMBSa3qWN7dditqJ7FddYO3hc9zA4yob3NQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+egN5nPWmHvo4tuAnBt2elBOr/O6Y4kxZPSc1oJTiLzw/30Q07
	rBykX9bl7/LclKwPiH5q90nWcywq4sz0neVID0//FlKF5ZjhueU8GkcTzAyOxQHIzv3GJuxkI+I
	kCH6Jw2XanA==
X-Received: from plrq21.prod.google.com ([2002:a17:902:b115:b0:2ef:bdf5:f0ce])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5c7:b0:2e8:4066:d247
 with SMTP id d9443c01a7336-2ee0dad1fc1mr120150445ad.33.1794868269495; Mon, 16
 Nov 2026 14:31:09 -0800 (PST)
Date: Mon, 16 Nov 2026 22:31:07 +0000
In-Reply-To: <20261026231026.721536-1-kaf@nwlink.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026231026.721536-1-kaf@nwlink.com>
X-Mailer: b4 0.17-dev
Message-ID: <179486826714.2938203.13849055947304962600.b4-review@b4>
Subject: Re: [PATCH] usb: gadget: u_audio: don't exceed maxpacket when adding
 a residue frame
From: Neill Kapron <nkapron@google.com>
To: Kyle Farrell <kaf@nwlink.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neill Kapron <nkapron@google.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

> u_audio_iso_complete() clamps the base packet size to ep->maxpacket
> and accumulates fractional-frame residue in p_residue_mil. Once a
> whole frame has accumulated, it is appended to the packet without
> checking whether it fits within ep->maxpacket.
> 
> Only append the extra frame if it fits. Consume the accumulated
> residue whether or not the frame is sent, preventing it from growing
> when the additional frame cannot fit. When the frame fits, behavior
> is unchanged. Otherwise, the stream cannot sustain the requested
> sample rate.
> 
> For example, with 27 channels of 32-bit samples at 19200 Hz on a
> high-speed link with p_hs_bint=3, the required packet size of 1080
> bytes is capped at 1024. The base packet is 972 bytes, but appending
> a residue frame increases it to 1080 bytes, exceeding the allocated
> request buffer by 56 bytes.
> 
> Fixes: 9bb87f168931 ("usb: gadget: f_uac2: send reasonably sized packets")

Thanks for the patch, though looks like you forgot to Cc:
stable@vger.kernel.org.

Reviewed-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>
