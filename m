Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334867;
	b=CuqDYSGx3tBdD2M69HG6cdQA6AFSoO62vHA4f5SDcF0+BbizT1FuQzuWWhazz/QzSTOb
	 YiQHL7Ccr+/EM9DDS1Essdo5RffU/Fw416C2Dfx4IX8fa6NVAr0U7wjkCT73FP1+GhmXU
	 R2Mrt5AhypmvIeMrG4LeVHvHkHX5QUDZNwHVYokGCCY6O9dFgOREC2QTS1BuU5N9Wwxez
	 wdmEcka9WKqlAQDy+f0vp2sJ+yVSbFvo7GxQ9tmHbCeWoEZzat3EMGhoW0qv/jh/nV9mP
	 1OKJLe1TyVzg0GGew1Q0uC217Yc4WKRmAmQnuYMz/6zMFv5vrdCS6TweMV8cAhcmJKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/mkvkDb3xo2wy8tT3sFzQBOkkMEtSGCgH+EfHq4vbWQ=;
	b=3JzAq1/xA3NOB7r99KTYwsE0DZq7jXhWuVIqJnb4/Cu+xdWyDgd6m6ihndwDuZmx2vEV
	 YuflcoTXxcKNQW5wbsZzwKgBrpb1N+ZAjwbbo6iruhkvCKAEcCMO+Fd8G4S1LaVC5gX9J
	 045KtCkYIvYBPhLg3eh2h1ZqOFDHNquGT/XvYbqQR7m2ynnRkeXsajvT6x5FmMZDkYpzc
	 N9QrKMUGgrfUt7cyYL34g43BVz8jJKQU+zXdTFt6zIrL7+Wu4Z9aqRZO+SuwR+6JCXgCL
	 wpgqwrp/flQRZmfqjCBk1/Jy9SM4Vijz8/six/9sdEPReWNPKBMqkR0KHHgqPUOQdNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qfcIlUD;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81E6606A32A
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 08:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81E6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qfcIlUD
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2205966f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 00:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334865; x=1795939665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mkvkDb3xo2wy8tT3sFzQBOkkMEtSGCgH+EfHq4vbWQ=;
        b=0qfcIlUDQGq5L2wppOOw9G3oPE5JToOHIqSTxQnbYpOuCMV/ptEYcKsRkYEhl7KROg
         FTANui5eP9C8vt2oM9pRJFG7CxLBHXfhCS/O/ZazP7STzb6Pqrh0A1gRDi50ygUbYXvP
         m25WpY/MQXkAaZRK4U4V8ywZ05m2qALh6zEw4zahm8wsdTnXoVBPzVdHPnVmC2zT+Le4
         ocxsmMz4Pk4Nty2xsN6vGlrAbuiba2vP1zTOpj5+DuLqU8Zi20al5ZRaUPECkfhrxC/f
         71B6axce74PiqpX84RajUJzIIJzx0hDzCkJLi8AufQTddYxN2EGW+FU9E7g385gqmuJB
         ZZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334865; x=1795939665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/mkvkDb3xo2wy8tT3sFzQBOkkMEtSGCgH+EfHq4vbWQ=;
        b=yNOmO7Mw8GR83c3EF8Lui9QCjuvUy8MATm7AjzB84UYj3ejVnttxXsScU5yctIJly0
         GdZ/puICvAizVoZPCllry+UoaPrABG+4o1SD8pQKd73QgXid4KVnMcMBaEu8xS2Qknc4
         dorRmIvjrfRXGw/ynJCY432blOp1UEk0485DYaX0qihrPbmCFGo0hu4i0pvaQynvZGnt
         W40R6pO+VYwQsuOXwOJIUCyH0FcksO5dlEvg8GR9BPB5pyadxnHUVWsNYWpoXLW3Ta3+
         0o4HPd6F15wIANguXYHS4H02pHXfw/ryRl8BmAoM5xYYM/xfp3PbKAiIJTCiQSb6zapr
         UkHw==
X-Forwarded-Encrypted: i=1; AL+hErEV0Xh3uIOjXq5ImlfcSBa/g9avPeL27GdpexHSHnU/HlkQniwrdzwiUCv7gRyqLth7wB5HzzulF6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EEnv+4aItAKmJxG8tKRMUbxMvSwNxYO2QG1mTaPU6EJsXSFOK
	ceAJ/KvPPSBNVqJC7IDA6CRYOO2UAQGnV/M/2o9yfEYhbecsXEIgAoZr
X-Gm-Gg: AZFdTZfrrYaOw/5UUrb90vcO3rIGpqRXzBvS4VL2Zxwsq42/nGOicDZjKEwPpvIlpz9
	n51xqT723LT4e3Ax8ZkMdjRf5DWli8P9M4hHQD4VrmanUzuWfT8lv92C2fLXOeLUBDWluLq0sTe
	Tn397+uX5Iu6dcsU1TfgRAN/tG6k/srtxyA8Cm+pcMLuGWC/L3TF6qhaevmqXYcO2vBvWr5al2T
	6Am71vFP7p1TGEaDbfa2yvmDTEbpEqo+kFZ4hoyAkkxAnuML1PNABGxGf9YxmBITnplepucYQLi
	gdhYocxQrpoTtuIybPl11GPvTQQXb0tyNoKblItH/MmZup5TIi1lV4GksZ1yao2o0qbQJcpGs1v
	zc14G9Kz3BueojbOvmCyOvJ1XYt2nBq9wQMBxC855JIlL5HV1cYVJ2Q+ubfwjP2X1TwWbjM4CiM
	kFPFyDsVgmUEMXXSwinfpvvIVUx+cE0N8dAfOxOl1wAiyU56C2x1y3eemwBa4eujt2NqsSMlvYN
	RwZvwDT76zGII+K9X5e2D1P6vRf2fzB6F8YI5LlF0lgqVkZNMrIVPJCpt7thGKgKvFRxP8hmCow
	H39T7W0GME7Qd389VXUZwrUE1Dgpr7ixZ/W1mnkrm53bKAgQUyzSK/h6d+qvMGqMkg0SWoks9Pq
	6YA==
X-Received: by 2002:a5d:498e:0:b0:492:3982:a80c with SMTP id ffacd0b85a97d-4abb70d7094mr12139269f8f.29.1795334865036;
        Sun, 22 Nov 2026 00:07:45 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm11929664f8f.17.2026.11.22.00.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:07:44 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shichao Lai <shichaorai@gmail.com>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: Re: [PATCH] usb-storage: alauda: track media_initialized per port
Date: Sun, 22 Nov 2026 13:05:51 +0500
Message-ID: <20261122080550.2181-2-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <5d2e1310-88db-427e-ace0-c2a0590560b1@rowland.harvard.edu>
References: <5d2e1310-88db-427e-ace0-c2a0590560b1@rowland.harvard.edu>
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

On Sat, Nov 21, 2026 at 03:54:57PM -0500, Alan Stern wrote:
> Has this patch been tested?

Yes, tested in QEMU (x86_64, v7.4-rc3 with KASAN, UBSAN, dummy_hcd,
raw_gadget, and usb-storage alauda enabled). I do not have physical
Alauda hardware, so testing was done via dummy_hcd + raw_gadget:

- Before the patch: running the syzbot C reproducer reproduced the
  UBSAN division-overflow / divide error in alauda_read_data()
  (drivers/usb/storage/alauda.c:986) on LUN 1.

- After the patch: the syzbot reproducer passes with no UBSAN, KASAN,
  or divide errors. I also verified additional raw_gadget scenarios:
  * READ_CAPACITY and READ_10 on both LUN 0 and LUN 1
  * Media removal (status 0x80) followed by re-insertion without the
    0x08 media-change bit and READ_10
  * Media change with a failing alauda_init_media() (unrecognized media
    signature) followed by READ_10 and WRITE_10
  * Recovery back to a valid media signature with TEST_UNIT_READY,
    READ_CAPACITY, and READ_10

Regards,
Arbab
