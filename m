Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B9340E8FA
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221106; cv=none; b=kgI4a2KYp+bZwfjpREpa7Ga3WbPAeeUzrfgT0lcG7Fuso+oNwxrgSvfFtKvKoxlWHO+177sP9/fpudn/b+5nKs4AcsWPIsTD+3pOESz/7ZvSCs/l/gjhZaYKUvRjHiNLikB9awRM6Bjk7QWsnbdDwm4+vR5IoBTU/t9PLJrzUA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221106; c=relaxed/simple;
	bh=8MasO+dXRse9oNs8G6DKM2d+FNiyDBA15XhW4S0ONo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOYV4p8leolrTDqpEAW0w/oDmE07TwB74azf4Y6sPmREltt5nFoqwYk1FlGd1z9OWp2KLxFxxY/dtnx9MNc1/vwo9Dn8VXfvMGw7PrmOppTL32FWYA9JzGm6HhgQvUPuGcV0h46iKZiJSG7MIeJfvYuToWzqpSKT95oxVsk5sQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWZSoTg2; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWZSoTg2"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2228477a91.3
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 03:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787221100; x=1787825900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MasO+dXRse9oNs8G6DKM2d+FNiyDBA15XhW4S0ONo8=;
        b=sWZSoTg2s+VBTR52EKuq8Tbyybd+SK8273NDcb7IGm0bbNbS9qoCd9HjgmauqeEBYC
         Uclvcx9GylpMI4Hq2oh9nphRNdc4In646qItfdS2gHAKQxd77/TVTTW0mp7ecazD0bfX
         wn0GpMIbJmcL+JZ+9+CdjQXslKrcOaVVwOQMGRtnpFqPcy6Uc5VrCw8MpmUpJJ+WyUlj
         +UKZr/BVfo+9IOpRUOIvbYB8VB7FyThdPtMAE807JRt6oTI1WWkI3WYiRYjnqs7OWibg
         01Qo5RIVIJawtotBqPc5lPo8xDT/sJnUWDlvJqO5H1Fl5xxMru1TiG1ZFCr9SQDdqFl/
         YsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221100; x=1787825900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MasO+dXRse9oNs8G6DKM2d+FNiyDBA15XhW4S0ONo8=;
        b=Fbhgv6i8BxsWBaRiEmq1KZP3aY/sMlzC/cZolKzoY6D0bmBAde0/kmyO7fgGPHK7bY
         oE1WLmzZO5wNLrEY71tOZ5CefGfCDKIoYihaCmcXE6yJCl22m88PR0n/zLNuW2TKsF6e
         HSnqDwwjuIsM138c04DZ3gjSUjuSc5RdItg0X4dHEewNOtOyGqop5VuYWnhyy8wsAvr4
         RAM4YhCvyohs+n7bJTi9M5bPoVukPDQ+LRK3Eke4BTKBLojc5Ycr5c/i26clWI1Kq0/g
         V5pHo9b5w72N2FDG60ykDuCEXtnSogc5REYXcG/9KAeNYxukP+dc9Rya+oh26zqit1kE
         jwxA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3CMVVcdXhtZpGpEthGGrfw3pXRfuKi4UPdPPPYNvyNK9Pa9wGpmOnUhFSkMNL3HYOBNdFJuLLS90=@vger.kernel.org
X-Gm-Message-State: AFuF++mz5i6GEniPCTzL195hut8Er0Ez/9jjR96sudpV+5TOmCm7XMoc
	vYJImxvxE9NkTngVWjBHynVfxMGedEoaqhdMGIFXVtLu9vvZeCGg7YDZ
X-Gm-Gg: AR+sD101msdaaP8IMJCAB7o7aLchM9YwhcQTa/c5zom6ThsVnaqWUka0XrryQb2RUhg
	ho7olAmk/ZxZMLztr3zfczH57E9PLIcbFlJiRpmszEuauIHrPhW8AYkoPJ5Cp9N5TjjZ2a4yFrT
	0N4bG4/YV1RpWxGTtu5hNCDqs9heX5bpzTdTybgjoju5INRXr30MmPjAUVg01zYQ56F5oz29n9W
	iDNJf9fRpvddulVVyf8CE5qT/7iMa8K6rsNE5h2QdebMpsGQk5fnJrAA199ikZqdI+WsmTFGE3f
	78QZMX3ZsEjGclDe21n7dvabmYeG6lKR+SPgo34ZEOjo4q6oo9SseJQF1EsGJQ8i4uqO3FyU5be
	CW6TPfGTvN6lDnDgcgAlCWLL8SwJkaE9XsVhCa8CzeqPpjmnaAiDMvzGSQ5UYUG7bzWfw8iFZJD
	vKagxHAZUqOcMuhvoljzdBrxHEel9qwS7boBVfUO7OuDHD+ZWqzZ5nJQou+BDyIsRrwA7Y5/k=
X-Received: by 2002:a17:90b:4a4b:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3958054b82bmr19417140a91.0.1787221100254;
        Thu, 20 Aug 2026 03:18:20 -0700 (PDT)
Received: from Default ([2409:40f4:1024:6824:6cd5:fefe:4ae2:d94b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c3fc6675sm22408447eec.13.2026.08.20.03.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:18:19 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: jeffinphilip14@gmail.com
Cc: gregkh@linuxfoundation.org,
	i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	valentina.manea.m@gmail.com
Subject: [PATCH v3 0/2] usbip: usbip_host: remove legacy rebind_store in favor of drivers_probe
Date: Thu, 20 Aug 2026 15:48:00 +0530
Message-ID: <20260820101800.14650-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811160541.29461-1-jeffinphilip14@gmail.com>
References: <20260811160541.29461-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 11 Aug 2026 21:35:39 +0530, Jeffin Philip wrote:
>do_rebind, which sleeps normally gets a mutex lock. However, it does not
>or should I say, cannot check for null udev between spin lock dropped in
>rebind_store and entering do_rebind. This is a potential race window
>already. So, even if we check for null udev under spinlock, we cannot do
>it outside. Regarding do_rebind, it is called during stub_device_rebind,
>but that function is called during module exit when all files are removed.
>So, do_rebind is not designed to work in a concurrent environment in the
>first place.
>
>We have a safer function that can already do what do_rebind does,
>drivers_probe. So, we use drivers_probe to rebind the device rather than
>use rebind_store.
>
>usbip tool references this function immediately after the device is unbound,
>which is safe for the tool itself but since we opted for drivers_probe, fix
>it by using drivers_probe rather than rebind_store after unbinding device
>which is more safer.
>
>Tested and working in both userspace via the tool and manually echoing
>the busid in the related nodes. rebind node is still left active with a
>warning to use drivers_probe upon encountering rebind_store.

Friendly ping. Let me know if you want me to change anything.

Thanks,
Jeffin.
