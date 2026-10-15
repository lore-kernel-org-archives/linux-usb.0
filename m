Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EDD51CF5F
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069860; cv=none; b=jajQMWxw2je309+uQYIqxmRW1gz6RTaRJduoJnwsnN/eAydZBJbZ27wxStZlk+i6HRuUOhR5kJh3tJCM9QGpHWA/rKYFGAcILQLlJ0BElw+GWa2BS4beTEfAeOa+caU7DmAbBAktxQiNgv02APITSphL9O9p6iiesDG20gx7438=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069860; c=relaxed/simple;
	bh=vMOw2LnSptLx2inZHDauA7QAHN1ePZ6m86XtVnrNXWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQAiSlX0Vg3KpeERrUyqEJ0GXnhD7KSb+1hoSYW5K9l58XZa3dGzAflRYq5+zSSltyjt7DTsJsmaWBhdou4TCH4OJ4ghYGORVnecqWT/Dys7yPR7kGMTs65c8J9pyDAJ78wCZBuMWxc/pEFasIlgM8XdEKBvnEz1b/jC/kVYAqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EUWgwLAG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EUWgwLAG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so25714325e9.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 06:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792069857; x=1792674657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1H+C/SntNFC1iY1JZXwhhR2BGSETQJL2ytojY5GJ3U=;
        b=EUWgwLAGFmMJsZkYtydLu/CHXyvnmoKfUkRIEU5V1Udz45MVgy4jqXeixgbKcoWEjr
         jRnQuhYBi0OcFCauVI5CdndT26uTqZtuJs/dvWTFa9c2GULJX4JE0wNH3LCI1MwJjG3Z
         GT2QtGd+lTA2AYKQJ4JZLf3IisUvPgXEqr2vqIzNqcU4e1MEFwFtvm9l0a2sS9vr1lD/
         pbGsbs9ImfeUqCCdtQ5m2mTf0p0bMXRgAAo2ocL39fs9ev23HZSFRWbLSqM35SmXsa2Q
         spDiL9CcJTH8Xhs5r7qAgqSMraH1OQrVfeN1DDIW6NdublJS/hHLtxdsszqSAVKgFsgW
         bdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069857; x=1792674657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y1H+C/SntNFC1iY1JZXwhhR2BGSETQJL2ytojY5GJ3U=;
        b=PideeK0itJNqolanpwtSJHUo6tJxqSY6SOU7TOupoSp0fm3dLHmYLzmAsXuj3fBBTX
         0Oe53+HrhZXvygDI6sPRJ3eK3glYHEJgf2Yv/8DPGWBS27G2d5f9XjEgXi3iP1HfNMgt
         WP+RIeHi4sqUPatshjVdzvk/1Gze78u/i+GG+VPR3MEjl8Za8fpB3Y+C/jC4O9FDwNv+
         Sp9kLh0IYmVNgFIPxpUMXBI3MLvL0NOVhdGGOdi4Etx4s0/Ib+3A+uy8E62oNDWqeO+5
         WIBQGy6VUa/bjFCjkATAb4p//JtwgmCoHOLLkOlbYpuIMmCTcGAtgEPdWiT+ku64jmjn
         utqg==
X-Gm-Message-State: AFq9FYKwWYu52tNcoIaoVoTspmalilXBhPQ/wKZuwGZL/WVmFeG2UrGO
	7nOCelvaHo9Ysr4cqqIQw1VWnnr4ATHrcU+rF4vGpzclwHvKzimz/lf/fhnWQ7qD8q4=
X-Gm-Gg: AYBFou37tEDElpHy+Q1yRhZlLW1vDt1XDJfuj3OG18c7RFI2MGWcWHBzZ7Ge2Q4E2W4
	oE88/RxIv/vFs2d2DKcvFBeQTYH3OH64X1H2HsFTq5yyc4otnwl5FowTxGH6tvQyectgmYbYbVZ
	3CChZZgoEBucEtwmo8J282TxSIrwV7IO5Z5cASbgPorX7GYUGu+nZnUFOHERFzq6DQrnWQE1bzT
	gm6w01OjX2dcLWR/UPiWSaG/5H0lTfxQvk0SoIXj4cs1GWLkXVd3+A0JPnJUbbLzRcYp1SC954V
	ZRd64aPsCxm19UKpInYjBfzBsRUdChpKSG4B0UkH0dgu1CBWS/pHUBbVCFfBg1qsq+HRbb6ApCN
	ndEZUCtDMopO6gsc9bcI0Jl4jX3zYoWqalQrJmR0QK573Efdlz6tW/YDIBGQWVffb0wIsWHqJcp
	P7bgjeICLaeGC4edAP88HhjtUHDEyk81oCzpK+VGhG7lvadJTG0yphmkk67fZwGwEBMBGORrcMq
	tPMpekN2a84nG11tljrLJHrsjlhRmneHTqyHp7sPcA=
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr384803075e9.6.1792069857275;
        Thu, 15 Oct 2026 06:10:57 -0700 (PDT)
Received: from ?IPV6:2001:a61:130c:b201:1a24:6e5c:9182:4c01? ([2001:a61:130c:b201:1a24:6e5c:9182:4c01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6834dasm65234445e9.4.2026.10.15.06.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:10:56 -0700 (PDT)
Message-ID: <aed1c8c9-1603-4d35-9b2d-e164d559f497@suse.com>
Date: Thu, 15 Oct 2026 15:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: storage: bound timeout=0 URB waits to 30s
To: Hongyu Xie <xiehongyu1@kylinos.cn>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261014093856.415812-1-xiehongyu1@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261014093856.415812-1-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.10.26 11:38, Hongyu Xie wrote:

> A blanket bound for this helper was suggested before [1] but dropped over
> concern that legitimate SCSI commands (format, tape rewind) can exceed
> 60 seconds.  Those commands are issued to tape LUs whose SCSI timeouts
> are much longer than 30s; usb-storage-attached tapes holding back a CSW
> for more than 30 seconds remain the residual false-positive window of
> this change (modern tape bridges use UAS, which is unaffected).

And these concerns are entirely justified.
I am sorry, but there is no uniform timeout suitable for SCSI commands.
If anything hangs based on wrong timeouts, that is the bug to fix.

	Regards
		Oliver

