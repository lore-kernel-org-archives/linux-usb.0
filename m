Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555410;
	b=G+jG4Ksqavl1D4eJVe8tQJFStuxXb9k6XiIAEd5ojgP1I/e+6yjvYOdV8ROZ3cT4Nc8e
	 EpYOl0jiFCss2KcNpZ2wvGsRomT7kOYmGU1n5kr4viRHyNII0oxrBV5Y/TDs4/0SE6oXs
	 0fRaOdIrSzHJIkgViPLEZu/xPiqF2k4sYTav8J4tjZYEg7emHq2ipKJW3wbKQFTqQkhVD
	 hDeuVmppdIkeq/uIkH5rC4fMQTfPeQTAnfCPksi9n4uOtNcvwaMhT58r5kg6wSvZIdwB4
	 jB4a7z0D3iDnjL3KL2AEsBglC2H49ZiOUR0pL7XYEe4e4sI9A374mjV0zgC+oVAKhIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555410;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kvL7LISW/1hXrYXeyGM8qT4qenPvB8Dmix98oXakbm4=;
	b=2OAx5Z1rlebTanZrxbGHBf/HMLsviOgReC4qJ5JyS+KR1h/k3b5iTgePFHu8+lA6sVgJ
	 6dZJ2wCjaZrC8okVSRVQDPcCczVERTpcmg4wPAU58w8l1r9eqHtqPHtM4OqSCRdN95pcS
	 4ToYPLE4eSfB47z40igmdwRzQSXlQBnOC8hwc+qjuYNyahE4Kokgw5RSJDfJFTots6btX
	 Fpda2pbfiSKinQ+Q34rP5VbkCad4+a7g3sDwPeiE9GFF/kbC+IpbPMuUmiVRLsfPMAZcO
	 hA3xlEZGlld6z0xCuTZWQY37u9f/TKvG2c2RZ20ouPxPn42yuR+9DoSfiObYX7nmNAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EB3606A327
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 07:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6EB3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso275334a91.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 23:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555409; x=1795160209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvL7LISW/1hXrYXeyGM8qT4qenPvB8Dmix98oXakbm4=;
        b=ZXPhEGbUqhgK0f12KQKhFpKhMzhmW0Ourb83P/fQdE+lTEK+euYaCVxIp8oS3dbJNE
         DPwXHnEKhzflppyCOi/IpTs/3hdH3HgooPTHTNtzHpJqq0yAAHjGMWFeabyT3lqmbsv+
         Q4TIEWTYKcr4DS/eW3htgl1Ko4M3MGinekcN4vNUNX987kOddxyNCgxQgt1nqAbH6wD9
         wZvEGwYjZ83M8WZ9MiMPE0LBUTQAaFEcAb84jD7/DT+JqaNeksZGzF1n5V+XbH4dS9yD
         3anuZToUepZTS/tmo/mFJsPc95eF5DlYg39rYg0/EDLWRObtaiXNOcYU1ORTu3chy9y+
         Lddw==
X-Forwarded-Encrypted: i=1; AL+hErGHy0KdWPmWhafMhWQChxGtY1BzwAl78VblZe5FT2s+A7ijnML2eodg32M2z+ifujF6xEcp5Kam1t8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qsG5PNL6Rm1vvMc/YI3JRIAmeIFVQ3DoTdkZnPdFSXxVMoDK0
	udewno60bSg/0gQ44CBSKbqkAyjawbOBjrlaxoJ8P5itRAQvVSQ3piiSi9Gr6suC
X-Gm-Gg: AYBFou1wt9v/vAN6QUdvbcmQYFABMIKK0US2GNfO/lDxS0Dj66mjKslvc/eMpW1zLHT
	uPfzFEkhdn68MomppTJXhgxEV/1NnSM2+2ijuxhXij8gYIxocdIueozlcBaj8RDJfUwWkS5uvHA
	duZQE3DHgkWLVDELQ2cu/v676He7fO3ZiYQag5IO+IJhQfBWb/fTmUv/NXzLUwgv2Swg21byC3D
	0XLamy353Dupi9go1Ot0VgMzUgixaf4jH3uKTTA/pAdSl4UB9JjL4WcFfBhSJLXxgkOLNVxSUbP
	GXxMuB2OTJ3CFxIdSzcmJYE9riKKIlWSxG6yOcw/j8/ucSt5bTuQsSLakRPdYi4o/gColYOAR3C
	EpW9EtLNXizOHgR4qnOz901Hiq+40Y+xHbZiVU1S8urMAwpJbynbUFgBo/N/VBhqpD4Ug90LYXP
	o8mcdyzBfcBr1ZbPcGe1REXDS57EU4b/hpq0Hgp17v+ryvr6MxxSuu0sErKDOw1zUvYt9ybwUx5
	UBYVDIkwhFT/+ylhXURT0zxxF5PsfAXtp/f/q9YFp8m6+E5/rocfOm89fsD2bB07Lsc0FmWTDgh
	wUiahOS4fsaEZdVoRIaojNk2m8Lqliu5HaT6J37x4gpz5Q==
X-Received: by 2002:a17:90b:3f46:b0:3b1:8301:95c0 with SMTP id 98e67ed59e1d1-3b1b0b95db4mr1239712a91.61.1794555408847;
        Thu, 12 Nov 2026 23:36:48 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm3205009a91.4.2026.11.12.23.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:36:48 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	usb-storage@lists.one-eyed-alien.net,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com,
	Liu Qi <liuqi@longcheer.com>,
	stable@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH v5 0/2] usb-storage: bound the ene_ub6250 probe-time card-type query
Date: Fri, 13 Nov 2026 15:36:36 +0800
Message-Id: <20261113073638.1225998-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
References: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
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

This is v5 of the fix for the ene_ub6250 card-type probe hang.  Changes
since v4, following Alan's review:

 - Split the series: the transport helper comes first, the driver change
   second.
 - Drop the shared 10-second budget.  Each transfer now gets the full
   timeout; a timeout at any stage fails the query immediately and the
   query is bounded to about 50 seconds at most (five transfers),
   without the remaining-time bookkeeping.
 - Shorten the comment above ENE_PROBE_TIMEOUT, as the reasoning is in
   ene_ub6250_init().
 - Drop the unused initializer of the bulk pipe variable.

The transport helper is recorded as a stable prerequisite, so the
dependency is available when the fix is backported.

The forward declaration of ene_ub6250_init() is still needed: the
unusual-device table is generated by including unusual_ene_ub6250.h
before the function definition and takes its address, so removing the
declaration breaks the build ("'ene_ub6250_init' undeclared here").
realtek_cr.c uses the same declaration for init_realtek_cr().

Testing: with the syzbot C reproducer, the unpatched kernel blocks in
the probe for more than 143 seconds and the shutdown hangs; with the fix
the probe fails after about 10 seconds with -EIO, before the SCSI host
and the scan work exist, and the system shuts down cleanly.

Hongyu Xie (2):
  usb-storage: add usb_stor_bulk_transfer_buf_timeout()
  usb-storage: ene_ub6250: don't let the card-type probe hang forever

 drivers/usb/storage/ene_ub6250.c         | 110 +++++++++++++++--------
 drivers/usb/storage/transport.c          |  31 +++++--
 drivers/usb/storage/transport.h          |   5 ++
 drivers/usb/storage/unusual_ene_ub6250.h |   2 +-
 4 files changed, 102 insertions(+), 46 deletions(-)

-- 
2.25.1

