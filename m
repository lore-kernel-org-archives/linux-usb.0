Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB482777F3
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 05:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994632; cv=none; b=rfm9re2EouuAbCUEDIcXbBiyYEafJJAJhdh2oYBw2fPrL5HNPzd7s4yRajSk6ixaKJqt6MtIuPiZsQ0i3HgpbMHdBffU66yYNUT+Wyqu3drEP2PXn5rH73oDm9Udyb7L6teRqR/c6eA9pcgNjANIBv9J0j5Seh5YO2xQjekBpzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994632; c=relaxed/simple;
	bh=vnLj6gby/UCQ1lMlnu88o1rIuhA4GPrV7rvpcqemk3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcnfjdV8R/+Sb3xmGIXNTsnJelrDzQYysKtGxSdUvC49SoLOSTehZQnRwmSry0P0UuPEYQRCT7RHZ0tx7LF50BrX6DzwYkXz1dHNQHV2LycvrMXakwMJsgyU/na8JT7mqeqHqi2xCWzTTDaZA6bSUAEzKmDtIME+xihyk3eUszE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgQrPMaR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgQrPMaR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf452def93so4463195ad.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 22:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785994631; x=1786599431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnLj6gby/UCQ1lMlnu88o1rIuhA4GPrV7rvpcqemk3U=;
        b=SgQrPMaR063W3H8Jxr8iTBOJ0wEbdBFoZPLHzHyzj2EHXvlKvTZd7ySPw+mgLDhIYd
         ydVcg7XVnfjpD9EXjkFBZC0LvCCTxKKRIl9FObJSAXIrb9tOnpQB/GU/5BA+u2pF0Bl+
         HNkNR+Z+wAaHEEYzGnIV1/1S3NPB6ZS73ftdIKpcmttdO7v5aXITXuTKLkMjfETdF5PN
         1Llgu5F0g/zO6qc62fVIGhfY92zU5KQIxzdITD9+J6PS0OiPvxFWg6NaaQk35nFw0RKE
         hs54138Rdz6BdQ4AfxfgrHocytGQ/+hAxNE9pHXWkDJgacDDm/hCLwOz/HfvXoR8IwtD
         N9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994631; x=1786599431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnLj6gby/UCQ1lMlnu88o1rIuhA4GPrV7rvpcqemk3U=;
        b=lHBOFVXRDzariD4B45KT/6hMltS3EyACo5HHWcDjCmaq1UZiirCv3NobkE4VvXFrN4
         8U+t4YPs4CrMpXreiO0QnCrVUAEvHaTOOH2WfmFLtFfjNBSk5R/oPMGJnV5rM9cj3gx9
         vyWf0zUVmupkxQDzTNluUfojCYFg5435ReHH0As2vq0vDtXlr045rjlcY01PU7PdtaBL
         X64sh1Y5HsIqf5hRh6kS/OCFaFY5OlXVG3q9RIiN9+yIavZeO84HsH6EvRmCZamoLA78
         1DcUiSOWrhhAxfwtIrrZhZglXpvWMJfz1daHGmIUZoZPASknLb6/5VrXKMeOdzbG4hW0
         GvPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvH1V5iUuOflxz+P3+A3+BHyshlq1sfOHS7DTjlGJONW+lZL6GM6ImoVb2Z9Enxc84M48Fexk79Dk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd/4Qgo6I8tW61TeHF4V4M+syVOIeeH6befbVlE+gdd8oMPyl8
	3+2iBkzVVoIyykCAVXLED94Tu5K0023CdGkm8G38+huG84PVTfW8qOepuxMvrg==
X-Gm-Gg: AR+sD12Nf7lhF4zuiQJBBpwrjjAjk67+zebyiJiUxu4zo/7rd7WoGKNQHtOiq27KrB+
	DybDdwETVv8++iE2J8RCqUn8jh0Rob/oFw3s7PPhoe5uNJj47lVtp1GSkuCX63tcJSJg7ufUC6r
	d8mwXURHvtba6uHCiaHOWnlINRX4Kd2uuEwIKqX5ar/2a3yA5HsQfSkZO50QXjbGz2XPMVtCCcK
	dbCs+S2dflm3JQ+mH+WQEMLvPcEaQXlLtDQgRb7LeTnus3tE9Q/CO6i1SULDLqLEafdvvTVsgDm
	IdAd61Gw+lfPco9efQuqVGaJ5MgIB/UV6w+tt1LyDxusvlO4jMt7emJWYhBJuI/DrhQ+rpzygdG
	o4muCGIG+ZJ4ipofIXH1qWk8hUnomYeuMx09yH60UZsea3TJY0BYzZ0OTUTq+W5AxOi8AUPI3tl
	vORfnEheZYfrejUfvgVts5zjAK1fEFW9Qmk5gK6UwzRbjm+jsLa+lup4KVt2Gg8s/P
X-Received: by 2002:a05:6a21:9cc8:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3cb9c291f2bmr5478186637.18.1785994630586;
        Wed, 05 Aug 2026 22:37:10 -0700 (PDT)
Received: from Default ([2409:40f4:1038:e01b:68d4:26a8:ff11:f316])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586401507sm23018377eec.9.2026.08.05.22.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:37:09 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: i@zenithal.me,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	valentina.manea.m@gmail.com
Subject: Re: [PATCH] usbip: usbip_host: Fix null pointer dereference in rebind_store
Date: Thu,  6 Aug 2026 11:06:51 +0530
Message-ID: <20260806053651.25088-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026080602-estrogen-dry-f499@gregkh>
References: <2026080602-estrogen-dry-f499@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Aug 06 2026, Greg KH wrote:
>What prevents bid->udev from becoming NULL right after you checked this?
We could use usb_get_dev() and hold a reference to udev when the busid_lock
is being held and then release it after do_rebind, or would that be incorrect?

>How was this tested?
The method to reproduce it is in the same thread.

Thanks,
Jeffin.
