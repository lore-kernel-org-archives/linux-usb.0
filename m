Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729962;
	b=kXNAFqoChn2iKXJZfp0qpXYd9ob31v6GJnsrNR4Uomhc/6/pNa0brE2/67FruJ7+WXmF
	 OntfMjdT1NCTj3tThYzR+dkV13p8x3Sm7zhN3bu8LZKd0vw3tVqG/2RBkfUkUYQebfXoo
	 ynbjxn3w6AfsZDQA6iD1nguzPqz8txUxGtwGgaxiYSPphCC82jx6vSfaoR3+GGth3Cpju
	 vt7iYAyBzCau/ESYCzdEzDwmIUgw/p5bRD4Cd/g+fNeYUY2q+S7+xo9bdUJUFn2TMxNvz
	 7Ig782PvFK3MSMzCJIxYDm/YXP3GgiCyfpvTR+fHmjW2LBfK4HIY+eHSlp9SR2OT1Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=VHl71I32Bx/e3xsZSclmhNLm1RyMWmdjUwSSd6FZTAI=;
	b=lP0fcoX6sQH39yvMD36nN/fyYRHUhu2q/TM/fFhtxFtEXEV7MMOzyHAC2LRlB0diJouM
	 9u3jBpL3r03Ac2M04T96KE8FtzAtuBen5d8SywO4i1jqlsMbif88dZDILKKo35Z++skHh
	 TDupEKsnpwa+Eh90Qo7UUI8nXw/AbjzEWpv70aNHZb5gekYKJ+rEZFdXgknXjG2yuXiJ5
	 5yrpY7qQDUm5cZMdttqIjliBSgPj3tIDFnSKxzvrKZR789x+N80RY8GXSVsokVUJ7ZVEr
	 Zv1854rJ8SX4RGKwSVpJCGMC4YmwdJfpt4c/eu3lUBJ1v9aWBrD0BH543nBCPxlu6Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHPhbDfo;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBADD606A31D
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 08:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBADD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHPhbDfo
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0b8b5d28cso340447a91.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 00:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729961; x=1795334761; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHl71I32Bx/e3xsZSclmhNLm1RyMWmdjUwSSd6FZTAI=;
        b=jHPhbDfodVTTLB5cXQrLwjt4wm+a9W9TWJJM5+3lF1pO+PhIXoY1YcYm0kgu41i568
         rUuAH8AruR40VSgN1BVucGgChAC/D4cBDOlMbEc7HSvo1+JVm+ZU0WgPQujJABGKxVQ8
         qYLcZ25UH3NusLAwOF5BDrimMUxXwf6LGAD4evHqUPA+VHsRGO1oRMkGQ3l1yt36vTok
         LT3GYxUGG2w9I+XijGOeDUnRZAwvyqeidAuasQ+O901dsm1N0wE5j8RyG9Vwa7AKRW7J
         kWdLPCpZJdw4Nmew025EIIGboLL4fjB2IJnd4wdcMmoaLqwlqnsKQeaK8RHvYM7d4z5n
         0YuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729961; x=1795334761;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHl71I32Bx/e3xsZSclmhNLm1RyMWmdjUwSSd6FZTAI=;
        b=wqBAR86CGdn+APxjE9m2vndz0O60LVCDAKrAJooUGxlC37R2lRQpbVdjAlFe22Ncyd
         y/onxFsVcVH1j9lfPRga5wUjtTrYUQt9qZlKx0QQ7SJ4g3CNPmBUNXQBia8y3tl3236T
         i9rEJpr5uXUSu22wPXGg20CvAUbbtuIkVZVkJFivdQmHu3XdyvioLCLvMOMW9RgIjgO3
         vFTeJKDE++F5esH/chqm8PDEHz/mqNbcEdQrnXQnnhQlLC3qvMdHcrQ8yB9+M2dH6FUT
         ehM18qPL7w+lQVEnG1DJ8yvurBxUYPgPNq7T9i1HzeOSCZFdwhnhAwCSr5FjG3WtjEaq
         UZLQ==
X-Forwarded-Encrypted: i=1; AL+hErHjseTG6YG/SPHVXHB2+w8/q8ZyRSPYGtm+6h1gqYlAM2e8/01/5EyXxoBgl3XIHTzRTKea4p8b25Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j9RhogtCyC+JPH7qhiUW0n46HOJBJHj2XpX+F2ZoPVtetqnnr
	HvY8hNAPD/bwUyBViTYtozD1UQNEBUl8WbfW6pNgEeYaDRZim9l4QKcXPJmVLO35Dr8=
X-Gm-Gg: AYBFou35phkh4w5cFSnOqe1vq0rqqpBhmoJ0U/lCgv2FLl9J4YkcznQfo46IxNlugUn
	0LDyxL9VmFEwEC69vl2571iCVyUnTgTjidvm0UpeKIYuEG0qifDRtMoPhwLaJrVHy+kqAlKmCPh
	1leg8Q3yeANwuapwHLUA/dC2K55Q5jTOFE0sjOZbkvCsaLI05RrhxA4Cmvefa3hb4ZhhA9HmaZU
	6QpFG3smapwIgVZ7eZguCTF4ODXWvG1mOHNcgghVxSIQWfO8OwX/B/av7Cyqa3n+CI550OUc7Y7
	kLrcyXbobluBosuyQ6l46CDDz5lt0CI0PUs2EEClY4LyWwuv+6uxHLrXyjPUybGKdrmOGdXn3Wt
	Ca3+mFyXqdoa2yS9d3jOxSA4EnMVU+u4jymCn+kt6sOz7dBtdfvSPszAnNIISqEQ8/Vre8PUBft
	7A9q8hK/A8beErew/zy9b8vm43oTp+ROtrr2kHIgqSzlzC6i2Q1neYvJNOqf5VRFdXc14irmjGR
	NpGatbl5o2KaH5CEG254qD99MDPXKKX0S7HuS852nvcMgIXnadI0FjbTuBIquvw5it+HxyUBv1r
	Dr2P3US2WgoL6G2UF2IqHytHrnvonkso2Qn6I1CHFZ+gYLh9Us1pJmq8Kb2whSwmlil8ml+M9df
	Sh7eCLtg=
X-Received: by 2002:a17:903:94b:b0:2e2:d09f:d772 with SMTP id d9443c01a7336-2ee0d366b72mr113814645ad.0.1794729961255;
        Sun, 15 Nov 2026 00:06:01 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868203sm24927565ad.49.2026.11.15.00.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:06:00 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
 mathias.nyman@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: tell xHCI that it lost its state when the
 core is powered off
In-Reply-To: <20261112141512.1840-1-26rote@gmail.com>
References: <20261112141512.1840-1-26rote@gmail.com>
Date: Sun, 15 Nov 2026 08:05:58 -0000
Message-ID: <179472995896.3849457.7552548813153786316@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Tested on an Orange Pi 5 (RK3588S, dwc3 not wakeup-capable), 7.3-based
kernel with KASAN and a local dwc3 s2idle change set to keep today's
power-off: 10/10 s2idle cycles reset the controller ("root hub lost
power") and brought a USB 3 disk back; a cycle with the core kept
powered kept its state. No xHC resume error or splat.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
