Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC862E7165
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615991; cv=none; b=PKkAl7PXVndqpEClxGTudQPa9EdKKx35ThgLxzc6TyYf1OxOcwlrqPCSbTGGB6WPWR4fhGczOVIF1NXl9EB4Rkxtgs4pqhOlsIYdXKJLNXx+ya+20TOgJpdPR0aUF8yAGsggeVfZbXVKnTR4ZI6mBf4ZnRWpilSCGWqUAiFYiAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615991; c=relaxed/simple;
	bh=fic2NJ+wRvlw35Uqu9N1aXCkEmWycwiRdnogymaXXEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7XgUjcIgtwXL+8vLOs2QPWxi6okSpaLB6qughh2ZffLcRcnf69W+wEWMtEdnZAuR2GVmrwK/qyL9PmmH79au1f8Dyq+fWNhBk+wkzrx7RJeliQcUszMcCyKzl7W5Iu9ckx8cNkdrcymgoJaDBwYuIfDO2MP8qj5chqFfTX/KO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8D7LmKW; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8D7LmKW"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-853c947bfefso1623567b3a.0
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 06:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788615983; x=1789220783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLJoWhKLSKX1K97rgnMY+/rZOmcVpOz2KWVn6TTt3QQ=;
        b=i8D7LmKWdC4GdJ8eYIqLYvj3RxB+y6CPNGOY0Por1Z/iB0QUALTowhlu+r8qvwUeNp
         kgLrcvDSN+Qcwf6kkODBRHzUC2axX2wC4C1dWn38htS324/9ecDDfs0qa2Tcvl3swOgA
         /m+3WtMZKFQYNGQFNvGUe+5ccco+QZphyJGP3mHexEXTDcGTWifOjKO+by1Arzp34xOv
         bcqVn55nL3S5DD7kXWZdRsiMaAu5R+S4zybAKwwdNwEd5weOro+q/1artrGNXIs21htu
         G80Op9mUg2Z8GyDlBPDkxJDhdGlZkkxg2B5maLjIXIArPqQlRho6CkxmAOW6Kta4Nnla
         Ervw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788615983; x=1789220783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLJoWhKLSKX1K97rgnMY+/rZOmcVpOz2KWVn6TTt3QQ=;
        b=dp9x9RqDsV3zg0y6rRjqgsIZZrdfppxGYs9B/+tWp/9gWjG7fgY9ZEUoBIhJmgBgsc
         7ArdwFOr+TnSP93nFcpZclGvmzAsSHAjWddmBo3+F29mRBvTTuhXIjfUFD8b3f/SbKgU
         Bm04VnFv76MHzZBgynm/G94I6Df6Uiy6Pr3bwZMSd0lNGDyxJqjWjUyc0vqL1QryKxzn
         oaf3kPkJ57dWMZXGG81pp3OY4En14ItN75FartZ1hzpwNZZvlYcHVxBYPze+eJgy6224
         /RynWxsDAfwyCbU6JIcoXijgOSE1kXSRCIxvU4URzZhJbfmrUKHFO5AsndMjAqNFKioz
         gOGw==
X-Forwarded-Encrypted: i=1; AKwUvBwmBeDBY13LpNUXQUP0vWphY5SnJFPF6JOOr9y1nP2b0TPD0HBxkWtzB/hgAMS3zZnoBdWkSwcb+n8=@vger.kernel.org
X-Gm-Message-State: AFuF++lR87QWd69WXrqn5NhjoVMPjoefq3D5oRunZWrTWesMdG9dMNLd
	+Q+ofuXlC6TEvu5s3iRkwNMH56t2tdc6n1XjdzQt3DsZ0yB5+xwZZkHtDOfrBK3N
X-Gm-Gg: AYBFou2pcO1KBl76cs65UbUgVegfYED4p4jS2KVTlOxlTcG/x+Pav2Fsu20Jn5T/7sC
	hPDJL4mfJIXUmsSFKtM3Ad61JqZ04Lr1qTMjShZkh/HEM+BoFhIKOPv9kxhtOMdEBtvVny4Zf8d
	yDqQ4fr2gH6lCUUU2gdigBJYblLNrG2VfdiBTzae7mNCev5Lx4GGnSbdLTq8G7v+SIX2RbfnwBc
	ykLktqDNMA8yxbbwXaYpM0tvaTK1G2saQAhv8mDVMWg57kD2999PP7XAmKKa5mA0ddZmzVrkPW0
	2XSipExXTQOuQpywvTLzYRBzamKIMUaWwTmXkuIx8Elg+vT5xkWCieOpB0yxg3vPgO/SHS+R4EP
	y/eCIiBG0xE7/ufXKDSeGk2V5AY/tPyPhk7gD7vD3fvpOcOTAXuACVnf2aRMRJG71ReyGoWty7d
	bJLBTeF/czaKKo8izI9yJ9VNoG63X3V323JDPucOkr2iH/f+FpyDWVbEIppboSNRB6+ykPCXyVj
	v7/etXXXHAamagH4ZxbVDKobF91E5b4/4gVPkj6z4hm++5764Wcax8L3lUTSl2Y+2239X8EFROl
	Wu8/uRk8jtTa+DYCrYDwTJu+
X-Received: by 2002:a05:6a00:410d:b0:851:8bde:7861 with SMTP id d2e1a72fcca58-86199e9d400mr9036372b3a.1.1788615983466;
        Sat, 05 Sep 2026 06:46:23 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045f8bsm2424728b3a.15.2026.09.05.06.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:46:22 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Sat,  5 Sep 2026 22:45:55 +0900
Message-ID: <20260905134555.168362-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905101837.4b7849c5.michal.pecio@gmail.com>
References: <20260905101837.4b7849c5.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

I applied your patch and reproduced the failure with all three debug
functions enabled. Result:

Cluster 1 (ep 2, at the very start of the write, unrelated as you
said): same as before, 4 Stall/Hard-reset pairs, spread over about
323 ms, roughly 22 seconds before the real failure.

Cluster 2 (ep 3, the real failure), with full timestamps this time:

  17:38:44.749474 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.749743 Soft-reset ep 3
  17:38:44.758367 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.758454 Soft-reset ep 3
  17:38:44.768370 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.768577 Soft-reset ep 3
  17:38:44.775052 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.775217 Soft-reset ep 3
  17:38:44.785047 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.785313 Soft-reset ep 3
  17:38:44.790469 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.790732 Soft-reset ep 3
  17:38:44.799187 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.799346 Soft-reset ep 3
  17:38:44.808558 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.808720 Soft-reset ep 3
  17:38:44.819176 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.819317 Soft-reset ep 3
  17:38:44.832378 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.832552 Soft-reset ep 3
  17:38:44.850677 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.850815 Soft-reset ep 3
  17:38:44.861706 Transfer error, ep 3, at ffffd52c40703f40, resid 23552
  17:38:44.861938 Hard-reset ep 3
  17:38:44.981704 usb 6-1: reset SuperSpeed USB device number 2
  17:38:44.998378 Stopped on No-op or Link TRB, slot 1 ep 2
  17:38:46.645044 clear err_count at ffffd52c40707000

It survived 11 soft-resets this time instead of 4, then hit the raised
limit and hard-reset on the 12th. The gap between retries grows from
about 9 ms near the start to about 18 ms near the end.

All 12 Transfer error events, the 11 soft-reset ones and the final
hard-reset one, show the exact same TRB address (ffffd52c40703f40)
and the exact same resid (23552).

About 1.8 seconds after the port reset, a different TRB address
(ffffd52c40707000) cleared err_count. cdrecord had already aborted on
the -EPROTO from the first failing URB by that point.

This time the failure also happened much earlier in the write than
last time, at about 12.9 MB instead of 64 MB or 103 MB. Still no
fixed offset.

I still have the full log if you want to see it, and I can also try
capturing usbmon at the same time as this dynamic debug next, if that
would help correlate the two.

Thanks,
wakasio
