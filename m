Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174875;
	b=WxkrUHu/2hScVcMmQ1HHKsrcyFUVIVdv2ZO+6ar9KqtjGSOdYh6WKjc7Eyq3oOUCz+9E
	 jbN9a+/MpjEDyg0zB1WqwGEqWqzZCKGCJLTYc7YAXho+1/MNjfYvetTrFZT+OpZkjXPPg
	 +XGFTkyEFl+yd90CdyWoHkHTdqzscntkXCthZ8hCyvlVZO4AA8hEPj09WaVW73aqSUV8c
	 mETejbM6B+7fTlpb9eAGU1euJO8GHj7NJsAFUsuHsrrFZkziPoxCKvu16/nPOPsVeSilM
	 6KhWQr7idm4uUv1TqN0ZbF6XC3wJfBEjIIH+S4g5lsZskMsOLrQSSkD2NXe+DwgqMGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8CwPJKjV6kCIIzcblemdluBfnd2QRRX74DnK0ggRw68=;
	b=VU6kzUNSM0aJKG6mNgcoSnq4gSpZXj/Sr6F7q3oYPfMnBTdOyVRrapRc8KvBp3Yibrj4
	 dH21g9KAOKJfp0X+ksqn9vH9QNvNTDttjG330rN3OU8QU/dZyDV2p3HfoIQkKxwVg2eDe
	 8Xddz+Cw2sMEwbhcgfQpMGFMkY649CNDaOcTwtH0x2saEknSFIo+IczyzHxfmHPBlKXAg
	 8Bxn1VIRy6CjEZ840dncWab3ufGYiWrmkpLWW56I1nn1GN5ipYk7vB8G5FTslOZ8N52r6
	 gAssj9jwjVCEomyPQGVWyKwjPPxM5hTGw7HWTjWDFhey287GOJLXE521eWlCIdoFbiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=T+q7QWH4;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A206606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A206606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=T+q7QWH4
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1175820a91.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174875; x=1795779675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8CwPJKjV6kCIIzcblemdluBfnd2QRRX74DnK0ggRw68=;
        b=T+q7QWH4CwDRmAMjxVuYKwoDHVnOWgOKxBKRvqw3xB1wacFuxx/+Eshd2otJ9S1vIW
         HqBrAyjdiDA4an8Tyhu3etEu546IyUmqhc5L2N2bMrKbW+h2dyk5kIVNvveE3+rklaDh
         W76WW/RzEtqeB3V4eKTQ+ko0vh+JJOSJy1PeeyG3lgAGshimY48LPpiJ82xzxmTmNlqA
         34QqIGS2HegNP+hZmdtl5EsGsEM+YZOo2HyMAXVjLFJ8nn4hJnVhGZHsmXNVF0HDGb47
         fayNpBFbP4V7R5WeklzQYVI7udmhahxcY357jKBBsV6A24tNEz9wEM7V1zVRW2QvNQj5
         JVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174875; x=1795779675;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CwPJKjV6kCIIzcblemdluBfnd2QRRX74DnK0ggRw68=;
        b=fHA8A9Du24EcE4MhZGPrSkpos99OHPztoyPaLy+D9dTn/fjUBT2RaFDioFug1HqIpM
         5bUQBB4Z1wLTb0WqpTE0rDSJwD4jU29IctGaOi7SorJTWcixm6+XgT9SHUW6ownDyxou
         WYRqFdy+WW7p59IwH5G8aR3NUn3KOtp7z69FCQLyySQlwhnSnQ3wAFmCRiqioCbt8bNj
         F3lAIJH+guRTijjn1NbtN+3QZ/whZ43EDjEnpsZYIQLAFcc6yF3eQflzIj5u/nLcDhOv
         2nhfL1qUJ2sMGaav4SwxF4C5iMvgliXbR7fvvA8WgcKYVaZ/bMkeGmaqUGKlbQvFx5Vu
         EaUA==
X-Forwarded-Encrypted: i=1; AL+hErEtT9NN9rzqJLLcqra5bBw4E8j2j3TYOsSgHTAH6dWWqfncSzSz4L/nzv2lHKyfLeUKGcyd8IrO50U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mYgViGjZlqHsqeqKRcXFslkmtSsxwseBEbuvtL0F33sCgNCtM
	VW1xRTMIrVZShrYVz5ZTXF1EUyagBrFBvik34Od3wIYi+vEQgR7cQzDijbyvEVzMXbs=
X-Gm-Gg: AZFdTZfhgr0oXhheofptsKHlwMwvmfWTepg60VudC8dQVfjvqfcT8B1mYwJe4dmTFLh
	F6pT1Oz3SbPWhthcTQWquzqQnLT7Ogvik/UAKC5xDkILNHftjwFfMCOuvTNZzxL2wSNsSEtXpC/
	LUJAJnV8/8cA90DHmKyA4S8/+kSYRUWZ0BLEKgBTqMKa9QHqYWyerRMjCBpNkGK3IoEWG1425/d
	YENMHk8Mu1Mdjg1GY6SR1qrfaiP5cecthbspnxKVJXTXm5lXrFk8iFc47dj0ENAJxEA41R3XLQK
	QOjczcUzmxD8wDWmnCY9CQnK2W6d5xrWGmd+nSkRAJ7HOovJURJYgshN1dG/gBIqzUbOGia0tWk
	kniZuliq1zD/VTJScbZHXjLCbl6Ql1uGDdOCOYFbkV+jKxR0tmDHc7KRBIgHBPf0MWIGrD/2seL
	Oawt2TjktDMiLyOfN7882obSSHFIJTOwMRme/GmiHQ91niH1rajzhTOoxd+j5oXhKc24hRua0Zj
	//aN6Ity/lgM0fZ5phsbwt43Em6nq0462i3CfrRJnlLFu56BrgQcclfPYKtZmvVcCRJktpaVbhD
	rS/x3xRY/8W/9J4gd1BykIt1OleVTIIgBFyvXNz0sQV0teaGAwlL4f5PT9b3W+emRAUOGvzj9ze
	pFEo9Ga0LLZL2fy+sedUnoODIe1Df6jiP0EmS
X-Received: by 2002:a17:90b:3e48:b0:3ab:55de:e089 with SMTP id 98e67ed59e1d1-3b40a611fbfmr3110569a91.40.1795174874780;
        Fri, 20 Nov 2026 03:41:14 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm4125523a91.2.2026.11.20.03.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:41:14 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: Re: [PATCH] usb: gadget: f_tcm: put the overlapped command's request back on ep_cmd
Date: Fri, 20 Nov 2026 20:41:08 +0900
Message-ID: <20261120114108.3071955-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-223285@kernel.org>
References: <20261119140641.2768465-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-223285@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right, this is a real bug, but it needs a non-default setup.  With
emulate_tas at its default of 1 the core sends TASK ABORTED instead of
calling .aborted_task(), and a BOT session can't send a TMF itself.  So
it takes a LUN RESET from a second fabric sharing the backstore, with
emulate_tas set to 0.  It's an Oops in the target_completion worker, not
a panic.

Fixed in a separate patch:
  https://lore.kernel.org/all/20261120113956.3071640-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
