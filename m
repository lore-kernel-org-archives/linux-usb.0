Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515DE584965
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654693; cv=none; b=U96BxA9oWi5LGC+ouVPgF2KfOlkHEvuCOkDXWmhqRiSdyicWGpwg/uyRmLCCp1Rj2KZmU0OVyCc4l5OZ+mhtdSP2lMug9cPJw92DdiR8FHJbVikL/ef+GCNkJ/ARG2fcbt1PO5uTnjg80GN64mGOnSwsrM6fZ1x643/ULrGzJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654693; c=relaxed/simple;
	bh=vT6iO5GAA16IU0ES6e4GXQ/CrJlI13tvv1eNWx6Pz98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htEX+FjkhtKHVLlu1tK88EfwBtAFlI3b0wHWclZKj31VvftEx2DyBP4udJ/N4HFD/8bgj+ZKBKCLdo9jvR0jYXH2c16shiqFmKvC86g1YiW/5vk52yqp35Cd86KEQXpJRxwzplYcgJUSv8qxLdsEhUMauQ8kQgILZ+0WQzskfZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkV+O8sq; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkV+O8sq"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-38fd9408220so217696a91.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789654691; x=1790259491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMjmJWMOrXZ1VLGiTO8ovJb6PqZ1i6J43PUp8ODD07w=;
        b=IkV+O8sqlPbNJBsoN7+yy23IMdzwVNQVuw7Fel9TMa9jcDQiPaYu3M28Ackq8VlKvy
         CZd5yuaxcgvINusj8pSbnqq812pLqYhu53LuMBjxtKggofX6Y4kSEwkCvMtYtHxdf3nX
         Ral96Cz9DhQhZKPeV9J+4zLluf7bM0+OJl+5EEj5cijd4Uv3PR+RSrtv6xDMncdb0QXJ
         2KOLQFhL/1mHd/oKtxFU9mhH9PQXUHMZ40LkuQ8qLrjdoIpsRRJbpBtzBH7Bb4uWOOhp
         VjJRULEQYdwbYlZnREYDFab5+4GSp9L558+wbCMaeOvrTI6ldE0PLbdtX6JLsFjla7Nq
         40tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789654691; x=1790259491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sMjmJWMOrXZ1VLGiTO8ovJb6PqZ1i6J43PUp8ODD07w=;
        b=lwaG9BxyNJKwuKdI3StW37lX9pJHvmwhOevGAFGZy0dVju7S9dlmTnMjgGK2OJUFgk
         w5otoTd3tKF0DgAJ51rKOwP57MavcG39Zh1Q2RYhjnTVy89P5BV2Yj1pi/o4cZRYS0L9
         t8OlLATMMe0N+Gyw9a+A8v/jRqPo0aifAnGeHLA5Z5pV/FPBoszUfRACK68xvxbYMNBb
         gKxUuSwP/qZRKHY3hAC+mqTtfYuuoPH+E53Do2SzPEaMtAku4KHNINktx+i92by6AIX1
         LlaqayLEAdUUSkbHybepGZtiDk7adjolUMeSdwwMNcMMRpzXjVmnnuWsJiRNY0BZsPls
         tewg==
X-Forwarded-Encrypted: i=1; AKwUvBwD0U+UCyQ1/3rfmvx3kgA5kb5ZqhkxVfT+aEfpT/qLy3eYGxWuwAYsW5Y+R9Ip3tVH9MW5nujuqEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nCLs7lLGYjZnsGF+EkwN6o+qsmEKKyCc92QIPQ6pd/S07VZov1
	PTNl6xqQqpJCznslqRfmzP41kfPJt264m2yXPgT9u3kK67QyhsOCIY/d
X-Gm-Gg: AYBFou3slFpbQFfqkJC+9O0vO9kuc3bftvW+0PLU+XohrJXK18H4rIo2mI6LNXDRXMT
	D5UFBMLlhT+TH3EKGNfqjj8hN8DizWwP7tb+NGR8XTQDutvX7042zSFv+G7Z27SdzAG/i36/Kzj
	19HsI/MZQnrlRBZ5PJjMSgAxY/z1WcP61u4PyCP3GLSaAIl2qMbPzBR6CIXQjZqcLGsdBZbPAIL
	6u+n66hS+2Bm1kwHm9QwGgawTiC1+66stiVsCUE2LCd5C79AnLDXwl6qCH+ERLcUYKil78ikash
	s/VA7I4Wsp9hmBINNUwtNYWIHQk49IzD/mDQZVpenwYfZhgb4rZiq+dk+toidtn1AZSeoAEL0zR
	HCsHZuDEw7EFBCecRQfmzYtPOejGoJpb55ztmUyD4taRYGtNHk4BLO/vWHXcqjyrxkKIi6SjhXQ
	zadBFfwkte68QZLTTZiM3PLs3fhSmpD2fdoPqjmorSjNzMgvKAaOocO8mZPRKC1yU/ZjUnDuV8d
	2J+FXPmetm2I++ex/yR7TenijM78BFKCzgT5zSa
X-Received: by 2002:a17:90b:56c6:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-39e2e797eb7mr10642170a91.6.1789654690377;
        Thu, 17 Sep 2026 07:18:10 -0700 (PDT)
Received: from localhost (230.161.92.34.bc.googleusercontent.com. [34.92.161.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3610bb35sm6379312a91.17.2026.09.17.07.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:18:10 -0700 (PDT)
From: EricLin <ericlin050914@gmail.com>
To: michal.pecio@gmail.com
Cc: ericlin050914@gmail.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	mathias.nyman@linux.intel.com
Subject: Re: [BUG] Usb fingerprint sensor constantly resetting on MSI Prestige 16 Flip AI+ C3MTG
Date: Thu, 17 Sep 2026 22:18:06 +0800
Message-ID: <20260917141806.8785-1-ericlin050914@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917154931.6ac69cfb.michal.pecio@gmail.com>
References: <20260917154931.6ac69cfb.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The reset was requested by some "fprintd" process with PID 3544.

> At any rate, it's userspace doing this for whatever random reason.
> Your xhci-hcd dynamic dedug trace doesn't even hint at any USB layer
> problems like bad packets, device stalling endpoints, etc.

> If you want to konw why it happens, you need to dig in userspace.

Here are the outputs of tracing the fprintd daemon (Scanned twice)

# strace -eioctl /usr/lib/fprintd
ioctl(11, USBDEVFS_GET_CAPABILITIES, 0x599e9df8cbbc) = 0
ioctl(11, USBDEVFS_RESET, 0)            = 0
ioctl(11, USBDEVFS_CLAIMINTERFACE, 0x7ffcd0ddc2a4) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9dfa9db0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df99470) = 0
ioctl(11, USBDEVFS_GET_CAPABILITIES, 0x599e9df99b2c) = 0
ioctl(11, USBDEVFS_RESET, 0)            = 0
ioctl(11, USBDEVFS_CLAIMINTERFACE, 0x7ffcd0ddc334) = 0        # initialized
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df91c60) = 0        # First time
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df83560) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8002d20) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df8bfd0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df782c0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df91c60) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df83560) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8002d20) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df8bfd0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df782c0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df91c60) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df83560) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8002d20) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df8bfd0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df782c0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df835e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8004c60) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df843b0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8005bc0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b80054e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df843f0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df835e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8004c60) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df84670) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df846b0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df8ef10) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df835e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8005bc0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8004c60) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df84670) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df84cd0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df84d10) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8005bc0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df843f0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df835a0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df84670) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df84d50) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8005bc0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df84d10) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df843f0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df84d10) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df8f040) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df91c60) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df85700) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8005bc0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df782c0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df835e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9dfa9db0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8006680) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df8e330) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df85700) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df782c0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9dfa9db0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df835e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df818f0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df799c0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df8b710) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df782c0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7860b8006680) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df835e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9dfa9db0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df85700) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df782c0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df835e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df782c0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9dfa9db0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df85700) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x599e9df87850) = 0
ioctl(11, USBDEVFS_RELEASEINTERFACE, 0x7ffcd0ddc774) = 0
ioctl(11, USBDEVFS_GET_CAPABILITIES, 0x7944d80056ec) = 0        # Second time
ioctl(11, USBDEVFS_RESET, 0)            = 0
ioctl(11, USBDEVFS_CLAIMINTERFACE, 0x7ffd07cecc44) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d8005470) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d80069f0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf144b9350) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d8003240) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf1449c2e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d8005470) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d80069f0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf144b9350) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d8003240) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf1449c2e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d8005470) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d80069f0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf144b9350) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d8003240) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf1449c2e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d80069f0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d8005470) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf144b9950) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf144a1c10) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf144aabc0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf144a1a10) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d80069f0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf144b9950) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d8005470) = 0
ioctl(11, USBDEVFS_DISCARDURB, 0x7944d8005470) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d8002970) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x5fcf1449c2e0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944dc000f80) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d80069f0) = 0
ioctl(11, USBDEVFS_SUBMITURB, 0x7944d8005470) = 0
ioctl(11, USBDEVFS_RELEASEINTERFACE, 0x7ffd07ceccb4) = 0

So does it mean it's expected?

Best Regards,
Eric
