Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF6348EC95
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533028; cv=none; b=AkUIk+nj6fopbsrH0sx23MXjofnDKETbxP1DU+DninZz7wgrN7EBT5iwJ/974cch1eAuX1wsc7H0thPyYBVYT0u+Z8nJ2MLProVnjTDiZRQzQxf3cRf/5RtFsksy221BG7EQE9ijlahfMNL382OZX6h7VBUtisI6D2Sv2qsfG28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533028; c=relaxed/simple;
	bh=CKsVH6FxVy4xe9Vh0w5FELINCftLWDP2FtvIcLaKg6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8E0epX5skFiYjo1pfgfZBCQ17v3zUXCtlSy+AbVSLzaEywH02vJeLNjkULQZ5H2zWopmvJIngQ2UUgtBPDIcbawB+vu5BUsdja5mTM17VwGsomq5UQT+Shdmx++y5mnzUEKYC6rEPrfnk6u3S58x8DWMi7otoCJv1nMRmQVsJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5WsIb0M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5WsIb0M"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso22372115e9.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 01:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791533024; x=1792137824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zr4i+WQHCtEiANwCBZ8Op31qDGK5B8rsjAoBDBx3JIM=;
        b=f5WsIb0MF4MBr3Yd6c5ur5W67EdRLNUtuEfFQJHmu2ESVNJYH+Qz+QEn/l9Q2LquAC
         Pw/rpNiGpKuig6hEP5Mz3Hhn6DrW4wLhBQ4oEILdggZQMwD78ITYipTjSLtFN2A831Ea
         6U9wnV0Jl2unHu6RxlqshyK4Uwgt95qsnroZysBYrxeVmOBEiIiEPDPFXfYfP2tC4W39
         9KCCF2Viu9J2sPZ24uB9OOGp3IKWka7LlmozgvRAmFPs/mZa7oAp9raQPcAQ1B2PyQrZ
         7M6bOXNWG6f3YjEhoZvELFnMa3x0IiTxs/XKD4PXNU/1LhNe5KpLWsvkYfSdZAHdDiSD
         ZcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533024; x=1792137824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zr4i+WQHCtEiANwCBZ8Op31qDGK5B8rsjAoBDBx3JIM=;
        b=z/ZWhBs3PN86mO+jpSLcxFEZpUo0K2hgZ/SzniNEcQPBNZ+XAcGiLaUsBv47OGgQNL
         4OhN+6Ia+5x3M+marTZl+1iYeZeQb10SFinnw0jcKU4tu1zkMVrViGs3AaJmrLyB8O/l
         yRjNoZL/ZyEVGVwDeJMeLRPfN1QIJGUanYTbCfXWksUlzgyi4rPH2aPAjgA2UyAWdzN7
         tOKolRiyfjlCQkuOVMKy0VcZ1X7eEB0aPblrnbfA/V0qotmT8EAcGSyhKbzrlalSeDPf
         6lAyNIXohZeXx38tmfVWxwyDNG9FB/o7P2sTKCDDSURGlMbV69V51236Jy7Q60WFpJty
         0IyA==
X-Gm-Message-State: AFuF++nPKS/V/BZkSW8h6Lza9gQ2s4Ni/+KCJ2tcup3kcthMGT0mjbv/
	5VNHGI5tS7Cf7pGCCbKmOzN7ync5kCaQAqCZPlBN4UlPi/9Jmj+LYEjS
X-Gm-Gg: AYBFou3IkLppAY4JStYUPGCQFDhM7zIbLcXoge9q0Wk6B0sPSUVBfJnYcF402ZhUyR/
	5HvP9K1rcXBLHDy5UYJhXhhO76tqaN2DSyBVC+uJtEmm68qy7H7nrbpOHjTf+DQQ2emllDjR+RJ
	oPXBELeBnA7+M62sji6Y4gZkEVNWg1yP7w7TsTpw8uZT33/fMOIgDpnYmGKcvY+EMDQaRjuugpx
	Q63u3cjstJsOw6CuwekZplDrbmozvbwAkrJWpI3hGS+HhZXWrTecZZfeU9o1RJZCQLnr6c9c2At
	kBFhjsJFUnm8Wdyv+XE+T/2vAojSFCkL1GoQR4NY3vPrGWyQpfd73/YcHi8B5aWL3MnJ34cFYsu
	3+rvfBxFSssi4oI5BzJbSLjqrGsow9s7jRv7+LxvzwnEHaJ/WR00/MR9yR58s7hmsPIguSHzQlm
	a9P3PWCdsqn+ll7hWmEJEPbzzv0z9TIfzb5qcsoZj5TVOpHb29TARrG4FYTAXEgA0o5LBusfUvx
	FhpXEdMaBzYQl64Gu79OwtgxUSVYK6lpIEAHaPQIhN7ebXk8/Gy3nMjDfw=
X-Received: by 2002:a05:600d:82c7:b0:4a0:1b14:e845 with SMTP id 5b1f17b1804b1-4a18e446875mr19023195e9.2.1791533023905;
        Fri, 09 Oct 2026 01:03:43 -0700 (PDT)
Received: from darkstar.tail74c586.ts.net (mob-31-158-7-150.net.vodafone.it. [31.158.7.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm53411465e9.2.2026.10.09.01.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:03:43 -0700 (PDT)
From: Luca Cecchi <luca.cecchi.info@gmail.com>
To: oneukum@suse.com
Cc: linux-usb@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	stern@rowland.harvard.edu,
	Luca Cecchi <luca.cecchi.info@gmail.com>
Subject: Re: [PATCH v2 1/2] usb: uas: implement .change_queue_depth to allow per-device queue depth override
Date: Fri,  9 Oct 2026 10:03:41 +0200
Message-ID: <20261009080341.295646-1-luca.cecchi.info@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008201920.40700-1-luca.cecchi.info@gmail.com>
References: <20261008112645.1820678-1-luca.cecchi.info@gmail.com> <20261008122604.1862534-1-luca.cecchi.info@gmail.com> <07d145c7-08a2-44ee-ac00-46535e0ca9e9@rowland.harvard.edu> <20261008201920.40700-1-luca.cecchi.info@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Oliver, Alan,

Follow-up to yesterday's note. Good news: the test drive wasn't dying after all -
turned out to be heat/stress from several hours of back-to-back testing the day
before. After letting it rest, it's back to behaving exactly like it did during
our original Oct 4 testing.

Re-validated v3 on bare metal today, same Lexar ES3, same exact load test as
Oct 4 (24 sync writers, randwrite, 64KiB, direct=1, 360s each run):

- Confirmed the quirk applies on its own at probe time (queue_depth=24) even
  with the udev rule disabled, so it's not just masking a udev race.
- Two repeat runs of the original test: 840-843 MB/s, zero
  uas_eh_abort_handler/uas_eh_host_reset_handler events (matches the original
  822-823 MB/s baseline).
- Same test run concurrently with a second USB flash drive under load on the
  same controller: no effect on the Lexar's throughput or stability.
- Unplugged/replugged the Lexar mid-load: in-flight commands were cleaned up
  correctly (uas_zap_pending, no hang), device re-enumerated as SuperSpeed,
  uas re-bound, and the quirk re-applied queue_depth=24 on the new probe
  without any help from udev.
- Mixed read/write load (70/30): 614 MB/s read + 263 MB/s write, zero events.

Will send v3 shortly.

Luca
