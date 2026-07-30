Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6C0445AD7
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425575; cv=none; b=rR9Io4gstZXaNUoHnEB6mlVQZll3eNrkeHaRlNILOV6SkGsR1r+K8FlovdweemczdF2jR+g83NvXKzqJd/XyuHfLMw/xk4bZDtJ+CUJvtRn57Gf/C1oNObiBTIyFBl4Ipp85wnrhMX3L7V18HG6/SurZx3KVfhk1KN2NlbbIw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425575; c=relaxed/simple;
	bh=kcxnimzE+NwrpZXTyFkDpktSPBy6/V8uveOxUQRDcak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H96LMgjOs2FbRjEoxK/6PGU4Foir3rs8jBITv3ub8drM07LZIExM9yHx3ub8i1YNL04/gQD8xcLyI379HEm3TjAv6C3e1L71BYeHB4Ax6aTCizAotzDoe06PXA1ezJDOtcn7uzQNGdTXCg15etyHDN29YBWjq5mXJ2/fPJOdA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXF+ANMw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXF+ANMw"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1548870f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785425572; x=1786030372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcxnimzE+NwrpZXTyFkDpktSPBy6/V8uveOxUQRDcak=;
        b=MXF+ANMwZ8VmyC4VoegeGRmnepuPsf/pe2pK5/9RrsiXS2659ccvnhFk6+fAP3Zdbu
         gITuX1PU0vKBtnCLvzSS9cebOg2kusXM26RR20KlU4+mRzUWlOx3Pnh40k5Xu5a/Puk+
         Y+9hoxD8z+ETkXyL9M7fJG++Iw6RG6d5KzVYW+/ozUYTO+blerHnBLqLWCI6dlVvpxMp
         kj19p6+GBqcMFRQWOEeWF1JEoL8jCmuOh5yx7KmhR2YJm4lTLQHnJZc3uwDKDwnRnP3n
         tvfxGA+OdNYpzTNZHnpMND26oEa6kQdt/gcenhrUw8rZg6OAcLvPRjJA2q9EsYHf4rkG
         /JGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425572; x=1786030372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcxnimzE+NwrpZXTyFkDpktSPBy6/V8uveOxUQRDcak=;
        b=PpmLFDWB3CMBB4mAXU3QS8kM0ajwJ16abgVKcChwypN8kiPdU3fqQzam6XrxFuGGOt
         TbkqkFW9kZ3hk3HvGD39Tbb0XSDF9lkzuLUfl7wpWwr/8aAL1ymBiLsnASG3hfKPriMr
         T1ooV7TswWf4m44mdbJOph6g0mBaqCH+/ruRPFdKCybPN06od7WpHeWZcmmf/rNCnrV9
         PFWv5BWVdOcEODEr9ycWyvcHRFrf8Z+uZjnKnBJDGHPM3ho84V01e0lbfhYKcB1RxlUC
         XR9L9Fu8RgEWVbb7kKghNhYs5M7d0OqpD4TPotSLCo1XFIdGX91VQ65wAX9mT1Z0QtYw
         K3aw==
X-Forwarded-Encrypted: i=1; AHgh+RqhiPkCkfe9VvqPwkl+XnFgM1tYpUwJRHPVA9915Y9MN3Y/bvYoZrh6R0FKIdju+HA2rnETwv7217Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBKPlfty1t8e29atwLkJOMkbMr0LcXqlR3TLvWMjDyfdNqmBEc
	jsRIu+nlA3co7qLX1SUpURGDp/kuCTFr/nHUAPzcZjiUJSK7LZoVZAH7
X-Gm-Gg: AR+sD13gtR9PQg+tSGJX0wBQ1tUVBRr5kRl0lSB1O4nxrqK1IMAllKDf2woM3T/9DL9
	M5zMHgo0cvHbVdyA/PxaWuwks+HdWpggSK4y4kwBbzIvNdxckFPWkq1cv1jiehKqdxYB0Lz/JLD
	GOjK5FkFzt5UzhVOPJGdClgT2coTJD4MxxQhSLV/qmHZfvKqDbNZ9ay60GtOdENQdJieRhbOMCc
	wrhxBnT3sXOyXnD8+u6rAvIZbHL+uELQ4tNmVYhfPzX5q+iuhT+KjTtpBoLlwcDE+VZHZVP8pdz
	Ff8LVltQRvogdYgC7914TCWiQUBOJn+snT4JVOwZqv1U9UwLxFzEwtad08eJIIm+X+ePN47dPOU
	pejag82jwDKHpTZffyC66zqwn4Z966q86ZkGMf6G5lmElAIK9B6XV0qu8s8kKLMbBREnq7BTePB
	WAfe2++Tbnhz1WG5xJ5m4Qq2EadDxZlRTIF2OHWSbqS2jxLnd2/bDSTycSqw==
X-Received: by 2002:a05:6000:4383:b0:47f:8e50:93de with SMTP id ffacd0b85a97d-47fc8558e5fmr5006031f8f.54.1785425571669;
        Thu, 30 Jul 2026 08:32:51 -0700 (PDT)
Received: from [10.10.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e64d5sm6485544f8f.15.2026.07.30.08.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:32:51 -0700 (PDT)
Message-ID: <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
Date: Thu, 30 Jul 2026 23:32:44 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-07-30 21:55:14, Rafael J. Wysocki (Intel) wrote:
> Does adding "intel_idle.max_cstate=1" to the kernel command line also
> help, by any chance?

Yes. "intel_idle.max_cstate=1" also helps (on kernel 7.1.5).
