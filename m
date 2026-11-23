Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427203;
	b=Mb8vD3rWmFtCXK+MdiXzjReINs3JZeABV684f52Tl2E0KEm/3wbiMd7oYVfjpxlI/GDQ
	 EOi16/XDSIT8roIQYM4NCM2gBMZ9hF/f2B+cUbr/txBGtfhwcp9D98fpwSuzG7cf3IDqh
	 MVQt/vIpwNai4ph8F084kN8gyeduIovEM2Z+hyqdlu3n9C6meQr7tvBPsMnbt1j3F7ZJ0
	 y9JUFXxC5+GTd1vqUQ0KOQl730H82LKadrVEA8CH3/UU6aTI52rodnAhU7itxr8RteLp4
	 GCpQue7877TCKgZbG+OoyS4JrtJKlAHs/GZ8Wm1KjIcX1p+is1EgVreQiA4OqlpktBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ow1Q+hWzDlODuPLusaf1++hR85dplAxGuhutVEfabRA=;
	b=vkcJEv6dbGCu9/GaCjXRoFD8EFo7FlkQjIzNxCAEuwpJ1VsCrHBEGXfUdxDkezjck2kK
	 cMnmUBw045GNmALNEkeJPqpKGpaBdx9IoqcAfRTbjz9eQ14bvEhk99Csi01OyCGrwq6Tn
	 n9U8ahayftz9a8mY7inZSpqdjmWr0EFDrUyAyrW9fu0ZlH2ww/W3YZruntBgBwqhIVI8B
	 QjBA9RxSZuq+PCwaXQDfLa09LABnxOQpRkaoYwnHVx4FQC9LwLhWCLje51xQcS63nZfhU
	 /ako3zgKXh/RGaF51e/L7rlIYdQGtg/xh+dWivFWCUSwK857LBRoG8HNBRnOGHLISoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XU+u+Y1b;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E2B606A321
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E2B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XU+u+Y1b
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso2118932b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795427202; x=1796032002; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ow1Q+hWzDlODuPLusaf1++hR85dplAxGuhutVEfabRA=;
        b=XU+u+Y1bVIkzE+Jn/7sv8BBlxJGNLKyIXYrYC+l4oPb5VV5mYga5Gw5+2XnC8apCGu
         J+E7f7u6opcU8EwEIQXrgM5XrfRdqHt7U9Gmr+PBhVW1/PIw76n8P7xecj52XtT9iq7P
         iX5v8uSxtp57pinHR3X/LSUEWITf6hLAu6PhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427202; x=1796032002;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ow1Q+hWzDlODuPLusaf1++hR85dplAxGuhutVEfabRA=;
        b=1mBL6oUfgMgr0147vQMEqBK9EUuPVVOO5f4kdpfAaYYvOWvetR48MThOMto5eAjsuk
         jCrwbaBXxifaVfa21G8K32MkSa7PkZFu/vgUx7c+GdKBQ6XUqma/PCScH2jz7gbybZMO
         2xuh9KQ6RaKo5v/I6kfgOdWI8l9MfpZBOaGIkENGFXnvFotesiVv0gkzwb6Rp/aF3mM1
         ha4pSsSvJhFzhg6QtxuI3MFaJvBG4uL3T7nP2BVpQ/7HTZVSEhcGgRmFLJOPG604T6fQ
         SXVRH5Jg9w1KUE+2FEn+7hq46rrFhcA8lonrFZSkgKcJeAslkPNGuj2MKTUtIlEfQg7q
         3GpA==
X-Forwarded-Encrypted: i=1; AL+hErEX9pVF0vlKXMkorGdVO1Yia/+7OMdgEd8BhVMRdt3+pZDaJQljftfoSC1Aw0KCqoB4f1M/qwdtJ9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/chyNo9U65Fu2ltjL9a0LUopVgRiO2zT+zj3zq73wYAMUWG2Ta
	fatmZXHNMBLijqvlDpBpWGujcilB7lVUshnrGNaOHdtpxzz6Y+lxMPkXlr4fw2AJgW/jaIB0xYj
	dNjg=
X-Gm-Gg: AZFdTZeAQYNeQhaq+4821YJkMTNMN4aSajrRaUgLzD6d6e/3EX5idPMchCokc/Wny2e
	TQt/FmT3kC0magY7nCoFDw5eIGBludRxoEy1h0oTIoJmCbi/rR+T4rllI4MtMSqjCa1LrDPxG8i
	aPQMDS1bR4HFnMBspp0uKbHYCsD9HlGMfaM+0QTyckMHrzkEo4Rvcw3zoLDew/WHeEZPzlxNgZf
	FRvRqP9ALcg0uaTuaG3SuEDxqHzj7opPLNAoFPrOBmd5u8eMP24cfm1q+PkHYcLEE88xw+6+Wlr
	aSEMMCsDLV+i7bvHPAYENTVfFGXG2lFiZlxwnfwoLSnrpLdrO7PZOSBvSFkW9MkgFzM2Ral7PhY
	nanfvNoNs48eIvs7ho9QwqJL1a7QkkM0fXrn2ngMcOv6MMFUze+XElMj2fwrOdM8lbsQSBdxdyX
	BGzsXputLSBwIa4Ndh1tBeBOuxdkHW0aWeF+hWdZiv/DmgNHSKYu8Vf11vfu+4AahgKThHbWUIO
	sFqVfzcfpw5zn707g0Zgfd3LkNSB526G6DVt3I5S2Ry+F1t/BQfQLfac97gLSH2nL1F2QZduRfY
	nH2zHzvKLR3JhZ0aLnUOe9DPYFHVaQj0DADMg+AnT7kyPs+Vao64+OEv9HlZ4rIx3r4o8g==
X-Received: by 2002:a05:6a00:188c:b0:89e:9d69:c0bc with SMTP id d2e1a72fcca58-8c87d51d396mr7314307b3a.27.1795427202203;
        Mon, 23 Nov 2026 01:46:42 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm5130356b3a.48.2026.11.23.01.46.41
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:46:42 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380c28f9e35so4166848eec.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:46:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH7H+kGT+k8/fR02L6xdPJKWLPJZa6Q1Z88T/61csKPhhfuz4IeH4uvdIrw4i03HYdr9780peceaCE=@vger.kernel.org
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id
 a92af1059eb24-1b5567e661emr11015754c88.1.1795427200278; Mon, 23 Nov 2026
 01:46:40 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122184500.7c9f2e1a@protonmail.com>
In-Reply-To: <20261122184500.7c9f2e1a@protonmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Nov 2026 10:46:26 +0100
X-Gmail-Original-Message-ID: <CANiDSCuBmdKTdCuGp6qxQZC0tXbZ+iEimnkw42wjw9G3ukOK5w@mail.gmail.com>
X-Gm-Features: Aa3M54oXNIs-f5o3vjrQJVELrHbbr79FTM5LygD5kvlkzrngvrhAxhUUIoxpkSQ
Message-ID: <CANiDSCuBmdKTdCuGp6qxQZC0tXbZ+iEimnkw42wjw9G3ukOK5w@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: add device entry for Logitech C920 (046d:08e5)
To: Bob Summerwill <bobsummerwill@protonmail.com>
Cc: fernandezfernandezpol@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bob

On Mon, 23 Nov 2026 at 00:59, Bob Summerwill
<bobsummerwill@protonmail.com> wrote:
>
> Hi,
>
> Field confirmation of this series' diagnosis from a stock, unpatched
> kernel, in case it is useful when considering the patches.
>
> Device: Logitech HD Pro Webcam C920, 046d:08e5, bcdDevice 0.21,
> directly connected on USB 2.0 (no hub).
>
> Kernel: 7.2.15 (Arch "linux-omarchy" build). The camera has no
> device-table entry here, so it rides the generic UVC catch-all and
> uvc_no_drop_param is at its default of 1 (deliver error frames).
>
> Behaviour matches the commit message exactly: intermittent gray
> bands over the picture in applications using strict JPEG decoding.
> Setting the module parameter nodrop=0 -- the global equivalent of
> this series' UVC_QUIRK_DROP_STREAM_ERR -- makes the artifacts
> disappear entirely. With it in place, 300-frame MJPEG captures at
> both 1280x720 and 1920x1080 sustain ~27 fps, with per-frame mean
> luminance stable to within 1/255 across the burst. The camera has
> been in daily use since, artifact-free.

Can you share what app you are using?

It likely needs to be fixed to check for V4L2_BUF_FLAG_ERROR and skip
those error frames.

Thanks!

>
> To be explicit: this is confirmation of the failure mode and of the
> workaround on the affected hardware, not a Tested-by for the series
> itself -- I have not built these patches. I am happy to do a real
> out-of-tree build against 7.2.15 and follow up with a proper
> Tested-by if that would help the series along.
>
> Bob Summerwill
>
>


-- 
Ricardo Ribalda
