Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF654389E07
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994070; cv=none; b=Gnyig77vMTKq5EPiYFsAo+w8nlsjzgmIUfSAnYEeXrAMGiI8JwKesaXEEGZ3hCvIKB6QLYJ5eMZLNh6AOE273PD64n2jrF/XSjhHVxlgrT6M5TVk75X+WFAo+KzklmB5GL13Q12HS4XgSyzcW9C2ZfikxNqwf7ziWXyzx6ELsRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994070; c=relaxed/simple;
	bh=6rrtB8pGPVT07ytC+YYV19x77TRlUWmpfOJEFWshEOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwS0oRdFj9U4ZR5iwp9KJqCUtKQTRFoML5Ed9PBo6hklKvnLPSePN5fo3sEx+6lFnvIbEiuLHPH9beHPCE72gdvfSVPALDvVve2wNG2U5TTw9y5ypuJJAyLBMIIgYz/oFP2EqqlO25yRFYdCu01a3YT6IdpzcRuqLEPIdNeS8qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0FBuWhm; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0FBuWhm"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacf197759so27090005ad.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 22:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785994066; x=1786598866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rrtB8pGPVT07ytC+YYV19x77TRlUWmpfOJEFWshEOI=;
        b=S0FBuWhm8cbpvJZx0BkGXIbZKySpGkn80EipTvNJ+4p2pSLHkq8kVpseisVfY69M3y
         lhsyMlc7FmqbdKccGqP1pV8LHtCpVdMxikCi9Nj5/SdtvboSsnAQ+DalbLhSjAF5WJ9F
         q5qxROlq0jeXOohQL49Cjy9IoZwtgf1U6aknQSvi+aX5Gm7aFLap2pVaQrYrBeBUd8WW
         K7l1fxwsjPkXFbO0cVbUHIgXFKvvr4PtqMau9vys0q59qrBaznDaSGv31LTqkd4YgjRo
         IurRLozk17SWiF9tDjL9EBNjHtRHqdFoA5iGjyHTWEfLH9F0V6VAvrNeo3SbpEhcOmQr
         RfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994066; x=1786598866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rrtB8pGPVT07ytC+YYV19x77TRlUWmpfOJEFWshEOI=;
        b=lFEWhwIrG3wxkR8P57QqVX0uCsvEM3cWqlrMOE/WZe4LDAMqHlfPEefrAXqsloLBWx
         mUEI4b0ymqbFacmosC/BalNSpKzt3j2yZnVsVmtKId3RIDvmoksf5oXfv7FadSvXx60q
         HXmIGr/sZawgRZSMkO0kxT+VxbqS677C7ozGmtT8YS9/yy3itNkqHgUh69D3KPL44PGs
         MQm4kfx1ztWz/tcX0p1q4U27vLQVKvk3k6UAsi2dwod0tLN26AzfOeWiXQl/yv9WlAa8
         jdyBAEHppdNspvNdn/M57gs7r5abQzmLCmVD3FXHWe1rnqEBWlO0vAI7ZFuGbByDSpch
         oCcA==
X-Forwarded-Encrypted: i=1; AHgh+RpNTSRF+CEKp5rEQ4iR/0PGC2rPfVqXtzVISFSVnR42LV6S2xhcsflPHHeZwMY0N5aHJAiyNIaPNiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4EiUdv/vPizvDBYal8w+aSBPInEvM6DFBWbRxS3tYecCBkpry
	2eraXIslBwhvAAIDh7wj2uJOnjy0FdfQQiosv/lWKOmhDSJu4O1uCcUtc+iRrA==
X-Gm-Gg: AR+sD11FShUKLMiBpfqyYpGlxQaWwoicwvLGqc2TZ1sLMIa4F33AaYW1DFsNIr53NCu
	xHlZrpGWMEs9IRFKySt5reLcciso53Nlt286m3N6x/knfvSAUH1QSVDmxyzDcI8dCtUIIkFKgY8
	0jV//dL7jby5p46UR4DyPsvLPGPgml5sIww9ZN7Wx5033SlumCLjkjXFLg/Lep5vjcb86xDSKvV
	QB0BBD4Bn5P5MNPadhHb/GAshvzCC1t4T1nL5pSu4zAjFlH1zyEEU/mcf0nk0y+vwQfiXOOfOVm
	c/YsPLHWgzdqohy4QIwSjtTX0ZwvFAylCmt4J1YqXU9kUrbTFvKGg8Rth04YzV9k4fPTU+dEyli
	uJriW+uFYhmm7RzfDKgM0nB98rB3MUfDvW+3gSGtZCJ93fYmJRMNb0Vr5XLfOen2BrKM6JuyXIF
	ixS4hIkqBfsyD8N6IakhZeMnXdK38ZoSRItad23FrE3WEWbtXjofyNMOH7UDOsRKxM
X-Received: by 2002:a17:902:d486:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2d0ca984bffmr122923235ad.19.1785994066275;
        Wed, 05 Aug 2026 22:27:46 -0700 (PDT)
Received: from Default ([2409:40f4:1038:e01b:68d4:26a8:ff11:f316])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d4929sm23908027eec.30.2026.08.05.22.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:27:45 -0700 (PDT)
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
Subject: Re: [PATCH] usbip: usbip_host: Fix null pointer dereference in rebind_store
Date: Thu,  6 Aug 2026 10:57:26 +0530
Message-ID: <20260806052726.24793-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806051726.24343-1-jeffinphilip14@gmail.com>
References: <20260806051726.24343-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 06 Aug 2026, 05:17 UTC, Jeffin Philip wrote:

>rebind_store calls do_rebind which dereferences udev without
>checking if it is NULL. If busid is registered using match_busid
>but the device is not present in the first place, it triggers a
>null pointer dereference when we attempt to rebind the device.
>Fix this by checking explicitly for udev first and returning
>-ENODEV if udev is NULL.

Reproduce the issue using:
echo "add 1-1" > /sys/bus/usb/drivers/usbip-host/match_busid
echo "1-1" > /sys/bus/usb/drivers/usbip-host/rebind

Thanks,
Jeffin
