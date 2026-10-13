Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B096F38E5DF
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878190; cv=none; b=GD38++Lyj0SCXZ3GrnJmsWGkobPFcipi578/wibE/p1SFfaVd5zM3F7SvwX4Y3Hj9IKl4lddpKmeI/GaahlHK9Z5qFrst9jjMEyIDfcM3jtbavPwv1nP6rhL7I62sDdkLYGTrEi5tE3mcznHGFkHq4JulVhxTaWcj8HxNKQryKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878190; c=relaxed/simple;
	bh=6Hw6zOizikH4nU5MtOUJGtJVcNg17esB1LQ9dVjUH4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLGKmjiOlcI8NcgjSDg1J3TlavscQvMJ2J4JAnHt5sj3noWKvo+2TDw/4cDVNu2IuE730UHVObyGrkmBHUGtVdD+M7jJE1IF8ekb3K228wG3Xx8GrtTIIOVMF3JG2IftSKSL7ExCS/k2jpnUCbPj7a0AmS83Vq1J/Wz0MROHNvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=V6tzbRee; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="V6tzbRee"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e82462a3f1so14428155ad.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 00:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791878189; x=1792482989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jANvN0a80qAhabkHU+c1blDJzLk3XqzePiZeFwrI4g=;
        b=V6tzbReeS+Q8e8j+UVIysvotjKUF/OGHOMXq7HNsSECehnjjsa/A21Y4QL+SPKJ1gP
         BrlqQA66c1joyrdGG18xan1W8MRZxvsGHAAd61dwRQN0gX8AQCu7/+0VV5n+OnT6LFu9
         3+c03ec2wCCsVLW5NjIhkogAPj2KWsdzEy7EEBUnOz+bwEclsxB02f5vaWou7GON10j1
         mQ9y6lT5gBd36ZSJz2zcac2DbLOEyQwN83oWbdQFV81mLqxb6IBjgXfrXEDIO5Arxi8g
         xRqxUfYqerJ+1NMwlxkVqtz1PiGfToNMtzU+JnFRPJabxpZjfM+ATDf4QEy0zaFwOKKI
         V/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878189; x=1792482989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jANvN0a80qAhabkHU+c1blDJzLk3XqzePiZeFwrI4g=;
        b=2dgafFvboZhzHAjtkhryVRMWX6TkqAF1ZJvfSvScwIqi+QxyzEEwiQBJOaAEFyJ/Q/
         FTSfx6NaY3RgHkhVTrZO3J1b2cT+DrhhIGSlJt4hVbrYQrupCX35OpUvBURWtSTwhkmM
         W9wzXxYnW9H9YRg/DHt8gPQabi9rrIjFfsIPXBPcjMEKNzQzntNjbmmh+qAHisK5iuJW
         rmDEkeGi+qG3Rybt9C8ohwHkiO8BhX61x6u/Iv+3cTV4jnvbN2Bb+9MspFBjfleoYRo/
         pnGLHNMzCCfzlnOL/KJd4azX7oiV7weFyhOGi0DKi3LdxRHAt7iVRdzP+QLuqeqntg2S
         Fs9g==
X-Forwarded-Encrypted: i=1; AKwUvBzMquscZX5n9bV6PVdli543vaXZtmsurqtAcncVOIpu15X+2+ANMTvBAw24lqgoZ95k3CLc1yIRkmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYISUz33aEx5MhGL/Uiat5kAB9ezs2KatsPnDYNzs2pRPzM/ybND
	LXU9+fNjcKVFZitwrgpasjY6EOyBHa7OMepcgxpfyPh8xm0KnaKQqXFBBscqMhbQMcM=
X-Gm-Gg: AYBFou3xcTl2J/TtR935IKRMuqamdfaW7iryqOFXlojD1FX4aDISpkt+ZHugnxKtd/o
	7PXIUqRHPF93raj6/zQ0mypNLDEcJpA40T7wDBT+qGBUZUu8Aj+6Niar2SID6Jz9e6/nb8ZPXV4
	qhUuf2bwiXglZ+rcmvpCUnGHm4f76cbJciV97l96JOBnu5GYTzl4f1qmGf0X2Upu6QldFNaalFY
	RYbDhBIfXKOn/A84NTg9KJm9yo+bHped/K5M/FtUCVrDQvTWNUskdfhV98LbA8qsFseSQUBgGty
	VCtjPVZ3lfr/I8Zz2QcJRKRzOgcp4i9Z6U0E6X9LaAsEdPNl4kNJzV4CBHidP0f00MLaqe6xWX4
	3pBEKbUTZdzhdWLuqgoNjqwawTMDQSmFMjMlNM61n5T3UvN4d/K6/ha/TrKzV4+mEjggAdu1UGS
	jSfBLabN2XivZ880vR+qBT+BGfvN1ZrlKno9ZZCMLwaxkVvALSVboeUgHcnOdLCL9B4P5E04IIn
	8pKpg==
X-Received: by 2002:a17:902:e947:b0:2e5:9923:5582 with SMTP id d9443c01a7336-2e842bc0a30mr98712345ad.29.1791878189071;
        Tue, 13 Oct 2026 00:56:29 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422ba80asm52420885ad.63.2026.10.13.00.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:56:28 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
Date: Tue, 13 Oct 2026 16:56:15 +0900
Message-ID: <20261013075615.2940598-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-169209@kernel.org>
References: <20261013073328.2936318-2-yhlee@isslab.korea.ac.kr> <sashiko-outbox-169209@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ignored usb_ep_queue() return value is pre-existing - it has been that
way since the original c52661d60f63, and this patch only corrects the
allocation flag.  GFP_ATOMIC is required here because bot_send_bad_status()
and bot_send_status() run from the endpoint completion callbacks with
interrupts disabled; GFP_KERNEL was the bug.

Handling a usb_ep_queue() failure (completing the command so the session
does not stall) is a separate, pre-existing issue and would be a follow-up
rather than part of this flag fix.

Thanks,
Yehyeong
