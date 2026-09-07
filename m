Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B110340401
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769065; cv=none; b=IqQbQpCYtrxsEJkwVx+5Vs4Zd8Tuf46iogZLZ3pomJeAjUN07l57qcdUOf4+wuKWPi9tEG78e5R5OczE4gkmm3+Prj6As4+fePmk506Q5ReU8DgeLb90VOHQ7lLD6nb8hMGgZWo1eu0hBw/MN+Wcu3zWk1PcGfVpQazQAB43Kck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769065; c=relaxed/simple;
	bh=jFAWYKmVqe0Mh/SD/Y7hlGGG4XNWYE1a0HpQTiZyN3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5mGVa1fQvsbSJnUiNaHHrvIPPs89ODN5zWmlKLPzD3V5hl7GK3Ersq7FrMqA2kD+p0Pn8cBRpqfS+lJ033NKMviORQ+3L34FTLxllriaNmB3WlCxIyy4dwULy8Qec2BXB7BfNk7eeHbkR4mJ3a8aurwOhvYcLE/7jewkyoSPEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DgxSzYmq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DgxSzYmq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso10850255e9.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788769062; x=1789373862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpoPZ0fcd3JuJClRUUCxQoIFsxpcrKHbj5/qQhfrnoA=;
        b=DgxSzYmq0osm/iHYnNMP1f9/uMVLPaPVWPb20EKfEk/mgFlLBpygD2bf9fTrQOHMkF
         cwXgQWNX0YO47UbEBKy/xvUvPnM3ZUbi3aiD8pAl5xqRaz1wzoKEUminXhP++VTIfiW1
         Ybe+QP0vn/NsvIKYUW1rpw+Y3pFw8OLrh7XWMzKx6+rb2TqR4MWttKTtehZ2P+ftE4cz
         Pd+EAnATvNyd1tTo/GHpwPF1MlodOSYMMxz6X94oZfNwbOvQljXjv/Syfm3lVU/6RgdA
         xXuKD6RgSPnrzypU20PzPQpMh2ZzAh/ETB9ocPeNtiaXvppGgzSzLhdVebhyIiouDcLT
         8VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769062; x=1789373862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpoPZ0fcd3JuJClRUUCxQoIFsxpcrKHbj5/qQhfrnoA=;
        b=bSplJtxC3OfdVmVgS3zIuEfc0PxJFM1ZS40yBLq9sgzJb+n8Hy55NzEq+qVIm4luhL
         hzUckGOjsFCaubvTiXyFxCXDYcUzCG9WETbmqz+YEVShst9pSg/BKLu0GnXxgV2ETMsO
         laTNQAxpv/gHZrnnKJMVeziMpHbsQP947rGZE1uAcaohg1dQxBogoLL4UnUvyQkkh361
         FfN8ksYlQu9QMUPzct20IUIRQ1IlwKhFgacZwVbrpZDxvs+4ytfsl1DCsdtDdJlWIt8u
         Mfl54UbhElMMs/dkhLQ68mE4S2o/Uml9uE5VEpxzjlgF31EUTMR0yop3S7JHOth+2gjL
         sCfQ==
X-Gm-Message-State: AFuF++lMomdIqIxa9W1hOpOyMeJkcE4cozfcYSHN0dtApXjp7oFiwKrj
	hbjEDhjknczj/ykBumKVIQyDT3HoDY8m2yHM5kikyjaU+tqNZUFuHWFPA9RVMqGxunM=
X-Gm-Gg: AYBFou3fopd6AkTr2MJGCVf8Hm0rKPoaMW3mGXxULYqfu3zd4k43wPxeZ93ZIyuPED9
	OA8dswNw9SyBgGFuvdxAYgG2WcmqRI+vm+nTE2dxV9TR3aAy4xl1hmFHimKNyS/keiTNzVpniOd
	UM2SFoFD79ZPmtt1weitCVmJzFAppTNNZGSPgGAxMXO1C6FEI3Lo2P4FzkqMrnmZFyhk6ptfg/X
	RpVQjiUaTFoEp/Vsw1dW7Fmgkgec40g0ZmeA2370FPbTQuvW3OBuiGXG3Eomin2QnIwguYsMIAI
	CaSWYbNJ2cAKL9gWntaSX2r2Qhm0fxzFGj6w9K8gmcaM+B13P7lIVLi/PD6TahBMA+YhsQJjwKa
	pwcZjzbDkmddtl3E3rvzwtuLM62/Gv/eoJKRLTObBXhVWE00LLYL2V9C3HrwDF21NQ79sjkuO6K
	kQ5cxD3dQ3Fo8s6ANS2KiEQQfWkIjWkI5+3ZD2e5NKlQH/8pyAwgxyOPL7I0ptID1JKwHKZ/WMj
	SkPftTJmCEyoa9KyotX0kJRoyCsIT6W
X-Received: by 2002:a05:600c:34c2:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49d10d6fdeemr36875255e9.1.1788769062392;
        Mon, 07 Sep 2026 01:17:42 -0700 (PDT)
Received: from ?IPV6:2a02:3033:28e:551d:9975:219f:1622:8b8d? ([2a02:3033:28e:551d:9975:219f:1622:8b8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm802674335e9.0.2026.09.07.01.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:17:42 -0700 (PDT)
Message-ID: <e231a7e9-7aa9-40ea-8ac6-57855b4ac811@suse.com>
Date: Mon, 7 Sep 2026 10:17:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: fix racy TIOCMIWAIT implementation
To: Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260907065501.101013-1-johan@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260907065501.101013-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.09.26 08:55, Johan Hovold wrote:
> The wakeup condition needs to be checked after adding the task to the
> waitqueue and updating the task state to avoid missing a racing modem
> status update or disconnect.

I am sorry, but in this case I have to ask:
Isn't TIOCMIWAIT inherently racy against the hardware?

	Regards
		Oliver

