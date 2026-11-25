Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624292;
	b=k8D6fu26cu7PYzyvfiurQ7WYpBx8zNG8cXrCcs2LW3lWDNt6ycr6rddqlruVdbLxdD1v
	 6zSC95QWx+GWG8uFUvv2C5l2iC+xKVE2aLBn3K0Qg607NhL3XDFmO3R/gtEeoHve/yXyQ
	 P68f9omW2xL+ECevsbYIpBe5gL+Ntj9vcTC42dgcOw99wn5Bz4ReurO3YdwOkD+JvtOZi
	 OMxVQ8qhspGRwExsROOx+eqv3weyCMnmQP80vs62OqSHIBYQuApkCS6m9DmBjddUJjbVC
	 +uP6nWcWxZMPutW1CKp3FGEW6+DxKyYCHHzZ5nJ007VJy0LZErlbo7ZBJp9cHaYwzbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NjxkkFfQFqJqbORPS3WtzVfM2hxrb9c8ax/FBEgm1DY=;
	b=unAsOSg3V2nEDpkXhQC4oHFrVwW0gccmsPPvTiA2tCakUOjyzVeaT9DNfzooV8nImn4m
	 zDioXOzQ9YrX4AUmCIOTtnfqUH664iewA6hQBhgz9KSEDAnsw1sZdP4sVRjttS8OmtKY9
	 igVwL9eWsoWrPeguE3GYgI74TWIHv370ok78K5WbPz4ZpYR64AhNTPLEaZ8X8LlVhPs21
	 bMEc0vi9dF+DfyJ9Szwg1zGpJ7KSWRwKSzQVXpQUjHOzXlDJCL+9GGyz3GUB586L0o4MI
	 MZHzjRYVRrWt910X/81uH8iI6RXy8Sw+2Jy25mNZ6786aaUVHzcbpFOK48/x8HpTk1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p/Hhig7P";
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9F606A33C
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A9F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p/Hhig7P
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso3110201a12.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 08:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795624288; x=1796229088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjxkkFfQFqJqbORPS3WtzVfM2hxrb9c8ax/FBEgm1DY=;
        b=p/Hhig7PZFCT9Fv59nbo+wU4gcH3v0e9KqdiRfY/0ZMOqNzyBVyvyltuIttm8+a28/
         2bw4cuEpz6d0FQf9C0iW7hDPqbKk0YQMwaoisbXPgenGqtHQ6f9aPZwCT7RiRGPx3ZvK
         QQw2BdRAO0JYtCULKlbg8He5cOpXatIBWGxD9ArEaAarcaaQOdKXmW/r23PYzO/cfPnT
         00GQjzQlNwO0JjxasZ0wV7BGAdWyn95fTYhvOPGmQehS+v5YSIyxc/pYqQT/q2TnloeA
         Xck2E4BAnkkiGqXJV+ky4Cad7eegTuYenMxbjsWtebQWlXmKOr6uCNX7LrsHW6DrV/VG
         6FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624288; x=1796229088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjxkkFfQFqJqbORPS3WtzVfM2hxrb9c8ax/FBEgm1DY=;
        b=irEtEP5CqqrmU3gEvTJ4EsdiaAjltgqXtZNQM2F2Wxpuqlc8Kveu62bJi9z9rvR7a2
         zfRChefd6zWQNrAQpXDrOi9hSLn4gubjZ84ZtHcszwHLGzF0W8Nq1raBq1tweJmjemwB
         4cxzEbC1kN+1eo0Lhv5AqcX8rgU7uxyZbrtQddL8iSTkxnsciMUmvWsDHGJPJRU0Bxd3
         xKQYH6mWC/gjJBzibVXrpraw8kGOlO3+wqMzPpryD3BAOoAWcH9kTvMHfQ6VC2ORkNgX
         DOp/l0M6a1DfjyaFXSfuA2aZc0po+8onu1YHpiw/kt7f9CgV1IsF1HZfsdIuOXG421PU
         YazQ==
X-Forwarded-Encrypted: i=1; AL+hErFX56pZBCn6e2Eh4DltxIBQNjn64ppK8Fn6X/czqxX8V4Itico6WTIxjqKr9RY52UNCacyMSlcQ8dI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9btwRVOSs2f0aZGTAdqtsGM31nDjA3a1yWyRbkOYFwTlNLwAtO
	Hq5uyMw3EuFBtjtyevn0K5O+poTML+uGXclQL3y4i+U9NsvdsJidH4GQa1WlM+S6
X-Gm-Gg: AZFdTZe3WGBOF7azcJBUbyTbG6TQynAP4BrbAJIV0FnVsvgHqRY8aVIeez5GcTOOGiu
	uzU90xMfIj15ndtTwEC6kbaoVuzdL5wAjSYSVJJxEEEirtVMeakfsN6A+CHszECGfpcH9jWU6Lb
	p8uBf+u/9m8QR4BgQxZydK60FooS35pGIcdrfAcBM+isWlYJNl/OsgzLy2s8a3+WVgk3fk3XeEo
	6ZQfL6zaqw7KO4ElDCYER7rkf8j9zhB4EdZjvMDILV9NaX0wVUzzQR/eeP7/i3hlM5fyDnZ8PYC
	6XxZO6QfvNgYCidPEqX/ePkfvwZnjdBadLt7JwYmfGAbynAGohKj0fmV9E9OYHbelih8WetdVyk
	GO102QGoXGoni1JJNGgzadA0pxY/JOaNeqMUtbeBxPRzCu82HwB3lzpfec9AO5dPOb2nivUsgNg
	Idu1TTBVK3cBKNDD43FPfoI0X5Fx1DYbQ45IpGNGGqW/pvutk7ttorAEO7f2GXO1anN6nZmZN2a
	BqXvPemCYSAvgUqE+MRPvGvd7P26GzPrqH3uPkxWS/MM/jcTpdmL5wrvzYyYmlsulJ/rPdJVeJZ
	MYZ7ydGE6I8rhIrVw+YZKqt+iCE1nt9gQTH8PYbWD1eVIexUUeFFN9NrKw5fbs8/4m655nXDxeA
	MrVkqZR/Z5CSYzBzB2sd2TFfGFAuXaDo=
X-Received: by 2002:a17:90b:5543:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3b41c8dc6ccmr16588554a91.16.1795624287733;
        Wed, 25 Nov 2026 08:31:27 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net. [36.226.201.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm27421770a91.7.2026.11.25.08.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:31:27 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: William Chuang <founder@logarcheon.com>
Cc: Roy <rongh7426@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+c75a7db5ca6ae96ed2d4@syzkaller.appspotmail.com,
	syzbot+8c0a48f6c8357c9da819@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] configfs: give the root directory inode its own lockdep class
Date: Thu, 26 Nov 2026 00:31:21 +0800
Message-ID: <20261125163121.620898-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20261117065314.4309-1-founder@logarcheon.com>
References: <20261117065314.4309-1-founder@logarcheon.com>
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

On Tue, 17 Nov 2026 06:53:20 +0000, William Chuang wrote:
> Not tested: syzbot's own C reproducer.

I tested this on arm64 with a syzbot C reproducer.

syzbot has a second report of the same cycle, "possible deadlock in
uvc_func_allow_link":
https://syzkaller.appspot.com/bug?extid=8c0a48f6c8357c9da819

I ran its C reproducer (it creates functions/tcm.usb0, the
target/usb_gadget/naa.*/tpgt_1 group, then uvc.usb0 and the
strings/0x409/iad_desc symlink) in QEMU/KVM on a Raspberry Pi 5
(arm64, PROVE_LOCKING, KASAN), mainline 65e4fd942f72. After it I also
ran a teardown script: rmdir of tpgt_1, then mkdir/rmdir of tpgt_1
three times.

Without the patch: 2 lockdep "possible circular locking dependency"
reports in the reproducer run, and 2 more in a run with only the tcm
mkdir/rmdir steps (no UVC).
With the patch: 0 reports in 3 runs of each, and every step gave the
same result as before.

So this looks like it also fixes that report. If you send a v2, maybe add:

Reported-by: syzbot+8c0a48f6c8357c9da819@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8c0a48f6c8357c9da819

Tested-by: Roy <rongh7426@gmail.com>
