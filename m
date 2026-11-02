Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621560;
	b=qK8aRyAarKllLFzyt+74tXqLLCknr+vrkExLg+NjTP1z2nAmDY32dVM+jRTO/iifo5Jt
	 3hIi7QFSk0NzbnWTlKvNB6ggBOeDR1LUjHWiitQO+0XUXusDhRSCl90mX+rtcrF8v+XjT
	 djQv3Ptuzo1hy0nTQauVC8Pvc3YdjNW3kzvsvO6YqdcYck1CiWvCsnOQA0XuB6zy86AQw
	 bVvj3nzgjR8P6p4WzRfhomzRio1k7pckA+yMosVrjS3yNjZs8HalYJihYJrp6Bo0Hv/Qu
	 GRj/1Ni5np13Dypx5Qz5m6020fIE86p4licKRj/vYD8DQzmen/3/KVsPsPP7IVNYFKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CzGjQfTKQ1sK49uKYb3bCMwMaQHcf4pDcDTHkCWJ82w=;
	b=bzs5DyJzznxO6Bio3HDvH9nVywUfurJl+bzCnpd9b6fzRPK4rLWY+EC9vzvMClnNoCgw
	 uUaulMLWwOZpDghLY67cAsSUCmIPxh46ek4slkwrZey8ICQ5GPe4yF54sHgFsyE2Icjw8
	 KO5dp/jUhN8hEKUTrBDg+YuT2DAfCRTZs8SoHlXcvuhaxMZvPqJ2YZuyWQ86sxdz0PQzT
	 wPszrni7QGCTHpqQemwnoRrSmhkNId5P8jS03/X49ui8rjbXFYbLiKQYNCtT8zrQESB9w
	 rgOIPcIMsl60mcFwRFOdNzqfOI05YedFqm8SQohVIoQ2W1dbUK2DmY0xL4GCB+DlKSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjRMDqW2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B667606A329
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 12:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B667606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjRMDqW2
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab3fc6e388so5724291fa.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 04:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793621559; cv=none;
        d=google.com; s=arc-20260327;
        b=WN/8BfsgMF8DqCJFofDIlKZI+Xjj/bKw3uHQsvVyBw3bOIuB54ND5wjuVv3PLZry2L
         E3Wa0cX+5N/riTSmWc0rb/bhEL5dpFa6keRXgrsIKeCEh5HbyW+i05MN0DNH7+97sKKd
         BUK0NAORxNrS0MojIaRwD6Cr14m+/TI4Vkc5VK43qEBmxFLQJC5ftR7gBtbdes1u+7NO
         BnVx5BFwUBOm3UCx8MsHDn70ZLFB3n/UOEsfAtt0SOwdDIf5oQKcKjF5Qnuwa9q6sGM+
         5fcreZOSyVLMQethy5EYzP7f2YmSC3JUqkEUedXTq4cMOLDTHatxR/grpAJjMipttz88
         ZltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CzGjQfTKQ1sK49uKYb3bCMwMaQHcf4pDcDTHkCWJ82w=;
        fh=NY4MQXbBQiL7RdGeEdS30+vOVYhYCvuwGw+ATIRTkOM=;
        b=ZBHOrYjsa1jTWK0ygu8VUthoNAXS8LmFjBayQfBxmRWHfFX5ZySVidM18lfPrg/UcB
         ObcYI4NfqVSN/vR1TTnSC2191CtBcNL8KABwLuZOMlEN9Z1ZMu2fWmHul52eW6lndWKt
         nYI1zf7nB6pD4ch8Gu0bkZgJHpqsffpbB6Hn3ps0brsnGvgbqZAu41UozX1FZlh87Dsv
         1PFxUcbduvDGrEyct/roh77nT/TrMFdbwWGG4FhI4OLST4d/L5uMn4qOAOkinVsH9kFT
         ghEu3E1tQ/H/4B6L1HWoeLwJHLQg2eKIU5Q1TsTXXRW4dMW+LP4UsuL65HRVQPmUF6+r
         uWUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793621559; x=1794226359; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzGjQfTKQ1sK49uKYb3bCMwMaQHcf4pDcDTHkCWJ82w=;
        b=MjRMDqW2MJZwqo+Q9hu8MFOhHnAhtpCLUkRxX9BUfwsWyjFtzKkUfDPePduPffVgD8
         cxt1N77flJnZ0prKh5GIO6oxrH7QZ4DSvxlMSTlarrLXDTab0G/v5xKuXW4KwkfmIebK
         yoXDKIcMlHzWAdpOvof0QCkdqi1sI6CIwECmR1BJyaIKUEpvtS5+DQ6injJyoYhrWjq+
         yZweb+Wfd2qyaNzJOwVjyV5ez+J89tfxCw2h9spngGjwX6joa1VUJkOUNwMTWq+W5ZM7
         0OimD6Jqi/so7uMQ6FuMljIaO19GUZq7tKKEroP0JjxsYiZjwEdbBZ1NgMSE0YXQ2RKS
         kUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621559; x=1794226359;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CzGjQfTKQ1sK49uKYb3bCMwMaQHcf4pDcDTHkCWJ82w=;
        b=JjTGPx3UalZrxjbaCiWHhi+v4AKpECsnJ0+lIWWiFGy10hQFyOPUiDxZqWlONUyE//
         aB4MPou019qJQOOD9ubUpzhOs5RArJEuioZzBBQBwkWnb0nXEQ66hbILrjhukbLctq0R
         VhAZ9TdtchmBZGYU9oCEj/XAQvISoCJ4EFMUohIwvLoghjWKiQ16GXQL7a3vxtYYNgH0
         mHU9Ap46ox5EvO7JCgYorV8eA7zX8Qh/Jr+cce1XuYk7K469ApEO99bLLsyTFC63QXcJ
         WYgAcIIZy7V78cDcHSITL34TSpjTqzzij6V1Aq2bRSMSh2k4u6OvvmXgVAJNw9vmLvGF
         m5uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaG84FNDRtEVF4IEvnvwOa1dRqBlJUN/qRvUk/YBezApkC03Ydjr5IjOB20jO/K7Jb5C/yDh82vfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5zde+ttEsCTIMkf0XQ7gQ+YbrXyZuDQMMG1t5oBsmMlVgYXvk
	JYmsplf4KEmgLg2BMr+JwWguOC0yPO7yqzHEUJFWGRVkkf5/jGL/OxtmROKNGZYcYHnb/tpcWdt
	6nr8gmpWpaVH1e+VJgIic0j7tPS475Y9x2rkwLfc=
X-Gm-Gg: AYBFou2bSUZ8Uqno+dvdKgoBlx04Etmu6bJG/m4eJorw/NAYMKmjb/uH7rWr5ZFsGcT
	hlnwTnSjVWIMUQScDOGPq9L8+ewykJtWwFXVQjgnQ4E17Q3iNdU3Ve6uTjBwux8RLTHyxaJ5rBe
	zG1nHASpg+Lh5OK7kuRHHcuoG1rnSxnhNH/6nh3ZEm+k9SCDMfUBMGL+H66h9qBcqcjmjoVlIqN
	YZ3qJybQhAWSZrErxlImk1623orfx/qXHvo54a8tIyYERnWdvn5sojAcEoXZarIhI+gXiTQL8kJ
	8VdUIb3/s3sYP9rAr6cJ8ftVLXkRXoyYaZkYsUZe4eJNk9m+EIRGX24D4zRZ/g4f+biJfGv2qG9
	NF+S7dOBp6S8j8srBJchQsOrPOSUcfL4Nhj0amq2wdjgGqOt7m16dkwYapKq129homHxbl3it57
	AoIFroQbK+AnPC47my0Sc=
X-Received: by 2002:a05:651c:4418:20b0:3a9:7b31:756d with SMTP id
 38308e7fff4ca-3acb788c991mr19856151fa.0.1793621558428; Mon, 02 Nov 2026
 04:12:38 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAH_=YdA5Rff14pbjoLp-Mg-n1yLqN0wQMUK5Xj2dB1OdR9-4RQ@mail.gmail.com>
In-Reply-To: <CAH_=YdA5Rff14pbjoLp-Mg-n1yLqN0wQMUK5Xj2dB1OdR9-4RQ@mail.gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 2 Nov 2026 20:12:26 +0800
X-Gm-Features: AclHuK9RDZReu1hdd-EOk08Dd1BxiF8vOWHu3_b8-DaNwt90GrVxOodBqGHYdPM
Message-ID: <CAKspUhKoYft5mG7ELbdTJUeJAW2DK7cs7bgupuJFERsDymAdjg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc2: Disable gadget descriptor DMA for Sophgo CV18XX/SG200X
To: Vadim Yuzifovich <vadim@yuzi.co>
Cc: hminas@synopsys.com, gregkh@linuxfoundation.org, inochiama@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vadim,

Thanks for the detailed write-up.

I run the same SoC (SG2002, Milk-V Duo 256M) as a peripheral with
g_ether, currently with DMA off as the platform parameters set it, and
get about 111 Mbit/s from the host to the board and 88 Mbit/s back.
I'd be interested in the series, and happy to test it on the Duo 256M
once it's posted.

Thanks,
Chen-Yu
