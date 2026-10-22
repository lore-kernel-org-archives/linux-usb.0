Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689561;
	b=E4AhwmdeUL9B6OfDwHN/bG1mU5zya4ERr7GRfaML3DZTVk/FwvU+X50tOZYWniG4KBDX
	 SHSXAdByPJLEFu6Mz06MWM6SB+TOrVCJNsgK6DaqNxFekTG7HcoYwAsRxWZqiq9NA3eTz
	 bLO8g/aLlZbEZ4eg4cbYrSkUMg4HRwQfrcVLOMvrZ9oYPMz9y9fFrQ6YOv1vIXlYH8vi/
	 qBnwS8ISBqKGg78yaBRmcA7w6zun/D7lD4loanHAfAoUKB5I4xoIMphPG5JWJSLiENNfo
	 aff+T0CyZw3oi2al+MyR3LfCA35zFivp9ylceW+Ps1LBBqjW6SA2k00aaHcp66kDyKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3bKtw6qQows0gC9AWiLOpi7gTzdWw1rlVgJYihuA+WI=;
	b=bR2pK3CDSYIgC+V7N9guNLlOVDI3cfPJNbDImN+qCr9Yf1A4rWZmxXeMAML3zjQydWjk
	 YJvynXgJ0CI6TsGOg2Fiw6pFO2XRZ38kp8nqJunW7OGpyNAO8rnkK0a7Nr15rx+a3beAd
	 THeFiTsDUkfXb23mFGljQY4lR2pPiNpBoR9Okcj59VxfOdLuzCTRgQDHxYMKYo1jc8LG2
	 V8jB/ZjpQN4w6J62NAf6KZ/BAKk0jUTMKrQIClEdZISR6jhNMJZdSmEqnG6NmutyPbDOn
	 c45ZmpOqqG2LvVLjwX/h1MIEZkCW8/oNpmXJaAEGI5U+ocYNjtVh2MicsttX9vaC3rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n7aCFcVH;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34222606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 17:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34222606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n7aCFcVH
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso753125e9.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792689559; x=1793294359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bKtw6qQows0gC9AWiLOpi7gTzdWw1rlVgJYihuA+WI=;
        b=n7aCFcVHIf23YD2ATN1+PCpQCnZBs2/F56exZPhnkZiPsC5VMKba+7OTyZpvruXwqI
         WVKjZ2znsZwvAbcXkSWTastisZkY8WhRgvf1Ev2LWX0R4KPLVDr2bK3nZdzx1DlUdciS
         6+kfF4W1odMzMGdWut7hpELHRSDCouivKghnpk1Lj2fJWLYTUAHcXgqVZ80fTYuwB37a
         s/eEimdQld2nvKHScW/NbxfGYCXKLStY/Q8tB38SZFGh/V4xhGh8GaL5CQL8OZQfJzK3
         2ZglVMVNbmh1JhFIhEf7cVqhDP31ySbUoVPn7UhYhAgCNsigYvVienBgptWGhYwwIcX+
         CCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689559; x=1793294359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bKtw6qQows0gC9AWiLOpi7gTzdWw1rlVgJYihuA+WI=;
        b=03HNOVg5n4uMJS87fhS33mgwuMzE4f+SgC8kabQiPUkLYzDA/nf55GgxioOfNA4tgB
         SdGuDAoqXWPGYVYf/YMt73G/W9ko9V1EL49NcJHZuGvg7PlpFlKp+Z/UVSaUSEH1XSxe
         620JQ29MGjnbKjwfhr2CWNYeR9peT/krQcs3tikcJLlC/0UIkv/CUczshEa3FMQm7Nwz
         BY1rPtf4fRR/xUKxIVqgSRGeDW8gGNYdad7IdH0xcV24MdbRd0qON7KZbRSwCIlwuHlH
         OQev0JGm9WjzQZ+h5WjFQDlbacuLb6eblmKLAJfGjFP0+U4C8tawT5jG4X1cfZJTztnW
         05KA==
X-Forwarded-Encrypted: i=1; AKwUvBxjuNMc9W3fTppEqsW7itPHVx0p7k7OrfQ+pwIxAnJnn/GbL/810muMg/wKo9jnUMw8cRHZbshmNFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsK7NSY/iMoV5pY2BbqcIKCKXx3DGQD31fyqeFDX4gywb+8jzS
	nR5VtfgDH4bxg04NySRd9bhv4ZJ83/JxlGp1mtx3LhLZj+lylJhf3npm
X-Gm-Gg: AYBFou3BGyr/rkru5akPTqf2qrIgr8emd7PEUxbxshotxqbqPuaxxIrA4JIl71NKHfx
	uSzdMjuoy5VHoNI+B76QLs+I6uglHZhzWy21TYY2w7A/CQ87e6z0tv12Zkc0Yzs1pmGPBqqa3eW
	wTuzBBv9kHDVqRRs9IxL+3YPYkDOC08ZwFOE7WY8Gt+xKzyJdp/og8ZkLYwLqFkaLWK/wOPwjd8
	Z75ZIluMRmJL6P3tmALjMwIXBTTty0+EkTfZFY86BpBf7y3OIkWO5gc3UO+nBxwN7Et5vdeSjVM
	f0D9TDenv+CIGHZuVCaEF9XeUwXnrTUDcjUCrcF1/T1siSaeUy1aIj9XtRl6N0g0lvvoCb63Vk7
	agJbw0bnAP2BIgTN7kTM+DnXepuYhbr4AMSv5qESMHvkRd997C5NU23h78NwACpzRGgSkZTG92g
	Dqv7w6XHyuLLrKuvbnsiIgOu4uDSKnRem2UiEoJO+9FO83b23BXO8USgvrG5FEAVXJoykTh72q+
	h0LYZlKz8vdEZf81vdMa0Qakk8s3blrZo9GJgnH52ZfA4SyPinO5UGrVvI6abkyo2OkJTFGG8Rp
	rAQd5Q==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr51922995e9.8.1792689559453;
        Thu, 22 Oct 2026 10:19:19 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21034d740sm11288215e9.4.2026.10.22.10.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:19:19 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Joonhoe Kim <26rote@gmail.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on freezable workqueue
Date: Thu, 22 Oct 2026 20:19:07 +0300
Message-ID: <20261022171907.2021-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261020132432.998-1-26rote@gmail.com>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org> <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea> <20261016125044.1085-1-26rote@gmail.com> <20261018150136.5896-1-tvlad744@gmail.com> <20261020132432.998-1-26rote@gmail.com>
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

Hi Joonhoe, Abel,

On Tue, 20 Oct 2026 22:24:30 +0900, Joonhoe Kim wrote:
> Abel, the RFC has not moved since February 2025 and two more boards
> now need it. Do you still plan to respin it? On Dmitry's question,
> 7d0767c5cd87 took the same approach for the altmode worker as a
> stop-gap until the PMIC GLINK rework, which may help here too.

I have sent an RFC for that rework:

  https://lore.kernel.org/all/20261022164151.592-1-tvlad744@gmail.com/

pmic_glink holds the notifications back from ->prepare() on, and
passes them on from system_freezable_wq after resume, for all its
clients. For a notification that arrives during system sleep, the
UCSI connector work then runs only after the devices it calls into
have resumed, so this patch would not be needed. A notification can
still wake up the system, if the client's device may wake up the
system.

On SM8750 the series avoids the reset on an unplug during
suspend-to-idle, also with wakeup disabled for both clients, on a
kernel without the dwc3-qcom fix.

Joonhoe, if you can test it on your board, that would show whether it
also covers the FSA4480 case. It is on top of next-20261021; if it
does not apply to your tree, I can send it rebased on v7.3-rc5.

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)
