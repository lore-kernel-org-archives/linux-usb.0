Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4A5378824
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642130; cv=none; b=MntO+URsyWXvwlUxLHn9L4RLEPMGFp3TF8KOUuMvLehsag3AztcPsLiZOE2vxgnPMmOG94ljyKqMbpJo6pDc26Vt3AJ4S0E9z3BD3InF5jxClayguTeXpfnv/r4O+INvPDycfRZVFVakyeALmmNkIXI9Wexe+6oaFjsJc4KORYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642130; c=relaxed/simple;
	bh=v81aBt2o2xPhCiAmHllIBfNzG7LkO0LDXg8m7+xct+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jNm6jFoEq6Nn/4P7JNgdBfGAnlXQu4kAuSUE1852501cbG+wuZaXv4oj1ISNqBQFx2gRf6B4g/8IHF8Ji/8dZilr3thfZwxqvpEnZF9ZznOFF3EIoTJvlCX//hjHti1AXodAPmc2BjGidS1+XhrLJXYYM3+QA55NqDOxoxF0uSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OA6rSDEp; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OA6rSDEp"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-988c90ee9e8so134582241.1
        for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642128; x=1792246928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v81aBt2o2xPhCiAmHllIBfNzG7LkO0LDXg8m7+xct+w=;
        b=OA6rSDEpsHTKvpWvOnLPBT8gNeaiGeX96o8D2F2jJTDrYwhKwVVSF7drbkciaNFMaL
         xxyWFzw0H65FI6J+n+6om60WG3liFWqS6pheXukIeBEnD/ah3IszGpYYk6B7hxzUD+Qe
         h5VmU8U6+mc2LIBTN3RerqReCrMsba7NuT+KD5JO1r4bk7tWmOYznmUXBiKGPH/uiQi0
         0VaurzKPyfzd7V+dl85Z/RnT2ji3N7WXN5DVO9ZvDlQpKPq4UxrfY2VKRl7soDHq97qs
         ikZ9/1KyWJyUlInnWgpl19sl5N/TW7ugFYPhqZQboWaCuygMMxGKtkz6KW0kZ/QCz5WY
         uuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642128; x=1792246928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v81aBt2o2xPhCiAmHllIBfNzG7LkO0LDXg8m7+xct+w=;
        b=KWRyb8flNs+D+87pbmDP/pV/ZIWQZNbb0TzLWqdFRHLPgsq+Aa457WmDaF+1IGfaOn
         iJF11OnD2u3Nv1tOg9LOBcS8iDc/Elu2Ks/zyixXYAI8Pv8mQ4SxzL/gZmRluS9kdpLC
         UCkPI65Le5Tgqfjxcv/CApkViGYXNOBizX5QzL3nQ4DAewjuY/IKFP3JUYWu0YiDpw0n
         bFjHqyq/Y83ouaPeo0aPsxyOQi1rXvnyZs9AEx99GypS+jq0z3pLo08JQ9Lwt/tz7zUA
         NPywOCOW6+BwbkG7KdRg5cprIyTcrrTRrXX+XuUCgWW8XO9IJhnQTjGrpx/b0qTg4dJ9
         Oagw==
X-Forwarded-Encrypted: i=1; AKwUvBxIqOchSB1uW4o4jdlXgT0K75UjzCj1vEnDUW3HHyNufsTeeqfxKHnl2DpGa8QUZ6nKsGP+VqpHI1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj34HdXvhtedde4fFDdXrfKJU+b7YyGkMpt6bjssGV7bPQOyT1
	R/an8BwdlKWy4ZhlauP+7RLKKQuTw1W3wke0oiwaT9oWMIGso0eLycVu
X-Gm-Gg: AYBFou0jO4LfxSMq3Z9qRvRhkVwAUkNhu3nF2kbdBRMtcJrtUQI5dofhofvcw23l35P
	T6CQkapbIYUzzvzycYJjJGXM7mULRV19zns4enmf0T2/RlR7sgwatLORuJGfMLiZVgt97kvReBd
	KO5rWVVei570L6yHRZb0IiNMmSdqdnFzXu108s74MYXX6EKM+fUedTOonuHzqCenjV8l9tS+/tE
	D13GCncjnB4CnKAU5lILx5fuPnqlSRI5Da+EizBEZnL80xUVTC8cSWNU2KrJjIAay1AXxwTVk7f
	j/rZrkLo07uBuaVBJGQWcL4qvX7+WCQ5SuUH47+1ReFYX4fxxSFapyURvRAOoiIQMPH9PjgmrPH
	LAbY+oyaBsXBEpQ1B/JhUN346KU78VaYJaadxmSlqVINvyWYVA7Vw0AVxpaYIe1No14/qf7ZdqJ
	YmHLF4Ffkuy7qHgxV8LqOgWCWNFvDHBHpoKlnOCHodJPjC8CSYwxN08ePBhM080D8=
X-Received: by 2002:a05:6102:4b19:b0:7c3:a175:b3a4 with SMTP id ada2fe7eead31-7cb373eab9bmr1315060137.36.1791642128304;
        Sat, 10 Oct 2026 07:22:08 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f66f94sm3595530241.9.2026.10.10.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:22:08 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	gregkh@linuxfoundation.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	johan@kernel.org,
	make24@iscas.ac.cn,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] usb: gadget: lpc32xx_udc: cancel pullup work on remove
Date: Sat, 10 Oct 2026 11:21:54 -0300
Message-ID: <20261010142158.2644446-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928134158.117-1-getshell@seu.edu.cn>
References: <20260928134158.117-1-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2026 at 09:41:58PM +0800, Hongyan Xu wrote:
> Several device interrupts can queue pullup_job, whose callback accesses
> the UDC and its I2C transceiver. The IRQs are device-managed, so they
> remain registered throughout the driver remove callback, and no path
> drains work queued before the resources are released.

The use-after-free is real and the shape of the fix is right. The suspend
and resume interrupt paths both schedule_work(&udc->pullup_job), and the
device-managed IRQs stay live until after remove() returns, so disabling
the four IRQs before teardown and draining the work before
put_device(&udc->isp1301_i2c_client->dev) does close the window.

One side effect is worth reconsidering, though. remove() calls
pullup(udc, 0) right before the cancel. For a gadget that was enumerated
that reaches isp1301_pullup_enable(udc, 0, 0), which only defers the
actual transceiver write via schedule_work(); cancel_work_sync() then
discards that work before it runs, since the IRQs are already disabled and
nothing re-queues it. udc_disable() touches only the UDC core, not the
ISP1301, so the D+ pull-up is left asserted -- the explicit pullup(udc, 0)
ends up doing nothing on the common path and the device does not
electrically disconnect on removal.

Draining with flush_work() instead (or clearing the pull-up synchronously
before the cancel) would both close the use-after-free and keep the
disconnect: a job still queued runs with udc->pullup already 0, so it
performs the clear while the i2c client is still valid.

Thanks,
Aldo
