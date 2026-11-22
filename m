Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388003;
	b=QzwCfvXJTLEio1Q9Rnh+RpbHf//6lFdgE1a+zCinBBUozgS/soeWOi9dYBu9ADL9pQ34
	 c5Le6pQS6KgBCZK1E7ge4L+gANM9XQ9EFQtsMt4PnOH4vCsRsXSxi+AC0oH8pVeQMfYu4
	 dgbhfjjgStiCNYY1GpZCeDq7A8QYgOV6EdthsGn4sCntiex2Yf03O88kQPYBK+1tf9uET
	 wh9H34ILQS6DquZPiq4rTsP37vRFnhkSzPJNsGPWnYtFc82GuoZXeVm6hiCFcA6vJF6qg
	 iIg+mdBbK6J6VJ6gSvhel61RdM6axWAfujvPoPv/YEzvvRPCJ0yo57yGheDWougNe8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=e1ECXh1hasiwdXcRUR5rhQfSSRL3Yk6j0MhKS+MF7ys=;
	b=sHSeCmkbubHKxpSmIcXFXmBeMGl61uSyBSJB/LiMOB3ybAoV6csN4000UfoABS9dysBs
	 OA1q9MvVLJBbpCg0lGoW2Pm60gFc+FYUywmq8HwstZXNyBsJng8TLr0LSwq1TPd6Mg5aq
	 9UC4UfiTd/04K8FbKWXnvQbUo7o53id+N7N7qPZob1lmiCFOv/UwsAmN5Vt1blnqoZFea
	 uyTzGFxVlLwmDV+YyOmIkIz7RsymS643aVFhRoqivjT2v8zcFzQ5UZLHzr8Iz0SB8ygD8
	 GNsRcMidvyqeWGp3CgGwHqGQp9LHmhFEcVv+6IUa6y5a34XFM63bXRJuBlt5JE6TL2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nI/6bUA/";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B39606A31D
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 22:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3B39606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nI/6bUA/
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso24581605e9.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 14:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795388001; x=1795992801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e1ECXh1hasiwdXcRUR5rhQfSSRL3Yk6j0MhKS+MF7ys=;
        b=nI/6bUA/mOzT3/axZ39pmChOGMGk7WsLcDl2A9jJjUyG63dl4A5lBvvNxY8IuWObBD
         kWRs+8PxXzuOhkJOQyT06w6q/VAte2AejNce8yUc2ZcK2gqU2pYuoLTIq3mHaFP8vS+B
         il49OaJXWlJ7TFxr3Y2JRIUmv61noy3jUKLkEw4WrxVl6VDCqjpY2OMXQy/xohnwtM/u
         2nqIz0f8ulM3E5oNU8TCMM36oXdPbfbaXNw0VJGMAMCCqq5/XkOgTPEvkjlH5DSNEo2C
         G6Z1/iMxLTccX0YMcTgplzzVZcSGh9J+eYiXLte13XdgeQl09QW/DjLiyx7Fi3RHPL39
         Zq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795388001; x=1795992801;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1ECXh1hasiwdXcRUR5rhQfSSRL3Yk6j0MhKS+MF7ys=;
        b=qlrMH44Fy4vF5hpX7U7uRrHfzBA+eoub4M5cU2fMFXajXOQXsaFPs1ImADs8e546TH
         CIcpFSLgxGDF0QUyV0JavNHbsLiMSRV5XQtRQZZ6XaIsntzRJ452XueHxnQbBajwlpgW
         RIfxz1DVnmarfVSlvGmg4yEAQE0lsKpTGEtP1exTvCzlNbaDmB446fDyACGJTsyUdeUz
         xXnkrOHKCRBckBX15U7a335eN0Det91ckHFmZNgT4YUEiW44vKwq/YBGLq4KnPBm+VIX
         xRGCz2Pcekyt9Ih2meYoNy0f4/jLEkeHE6qZxK5O7JQAv7o35saPsnLn8Oxixi20SRO5
         RMzA==
X-Forwarded-Encrypted: i=1; AL+hErEI/0UilJmQDomJIyhHyLx/7RIjUh1VAwWRiaRHnxPyWXtWwrLrApWzvIsSxPsi6RqV3TB0N8XqzsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w9ButQurvLahQZyiLthuLCikUG0wVsZuBHsXujbSa5vD40TsK
	5tZV7tkfZPn4yRMsvBjbPHPqVur24LITRFQmYKjQ2o9i8XTZjeI40uEg
X-Gm-Gg: AZFdTZeN38rp0fEUefolrNXoHOwXE4+kKK0ODUEzUVYnKFOLhyRW1lhbemDt8hNN0Va
	fC8KNIQhoaJHyl6hNVf4pCdBMVaXnHHvBmfK4akmN3l0XRmAYW0AQ68BLJLg13oUc63Wdm4yPnx
	/nwjPhbOFvdSSTZDAMOXx2RUc7D+flsSzFEyK0h+DJdTlfAOyU1ddGxoTmX35A8Smp8M0HdcyXL
	RCxnpS2Fix9IOv3iN9d11X5UmdXMpD6za0ifYFfgHMZqHKwsjZH9HPVw8EtG3Q5px2Ggm6OVOeq
	lllnal/yMRCx6aFmS6ILTX3eleyGMnTsuGwVr2+tQ1S50B1JdKs2dU6hdXZYFr6Psxiryu+zXTK
	LUVQ0/CVB03NjqzIT7JVOM7/KIpIoUq+/20/ZlM8ORYpmg0xtrbzxcmysxhDdRkFcG49+s2F6pD
	8GRDzq7o1dAaSgr0tL1tbdcY9bMWpH04XCrtNjpz8LROryVdrZQpct/eqam2eDxwDmJzZYySgtK
	y0tfFsA5Mwpaqe675y5HrLC/TvR1Da851TYsK6mjgWvIwe2nBCi9vVYhx+orzKQZhNdJxiL+rCO
	GcHLBUmXUUE6RWRFUMGfCW5CrBeSbcIe+6Uam/zYfQ==
X-Received: by 2002:a05:600c:a51:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb88828173mr190830185e9.33.1795388000825;
        Sun, 22 Nov 2026 14:53:20 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm147668355e9.0.2026.11.22.14.53.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 22 Nov 2026 14:53:19 -0800 (PST)
Date: Sun, 22 Nov 2026 23:53:25 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: hi@yasunobu.dev
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mathias
 Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Batch StreamCam unlinks on ASUS
 ASM2142
Message-ID: <20261122235325.3526f7bb.michal.pecio@gmail.com>
In-Reply-To: <179509825333.7.16183167217667709685.1785923683@yasunobu.dev>
References: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
	<CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>
	<20261119141956.2f320b1e.michal.pecio@gmail.com>
	<179509825333.7.16183167217667709685.1785923683@yasunobu.dev>
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

On Thu, 19 Nov 2026 14:24:04 +0000, hi@yasunobu.dev wrote:
> Thanks for the clarification.
> 
> > Does it work, including in high resolution uncompressed video
> > modes?  
> 
> On Linux 7.3.5, 720p30 MJPEG worked on my ASM2142 at SuperSpeed.
> 1080p30 timed out with zero frames in YUYV, NV12, and MJPEG.
> xHCI logged "status 13 not part of TD" for ep 2.

That's probably same thing I'm seeing on ASM3142, the HC fails to
generate completion events for some transfers. But the same HW works
in Windows. Running Windows 10 under QEMU I see two differences:
Event Data TRBs are used to generate events, and transfer buffers are
split into smaller chunks no more than 4KB in size.

I haven't tried implementing Event Data, but reducing the value of
TRB_MAX_BUFF_SHIFT in drivers/usb/host/xhci.h does seem to help. But
not all values work for all alt settings and I'm still not sure what
the HW bug mechanism is and how to optimally split the buffers.
Maybe it depends on burst size?

You could play with it on your HW if you are interested. Your camera
has some interesting alt setting with short bursts and high mult.

Regards,
Michal
