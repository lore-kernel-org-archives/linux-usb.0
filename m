Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285F63955FE
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853511; cv=none; b=RESuToNrngM4sxl5PLUv9D82qBfdwuyiR7Mxbgh+gWU5lslc4i2zMRHHXcNrlyT9DsfmIOzvvjDx5aPMPTKWydIuXJM3pjd4w+N5ARQMXJwRP63guSnLgkBQ2vnXcdHjmvgmCKUlU+7lCcd5/ySQnpgwmqmczD+xqBYSrBLNiFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853511; c=relaxed/simple;
	bh=lc9zj8acVJzB2Zqg5NYLr7ldjKhGUblQwyVTN5qJy9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeoAqISjayPdzG+GvGADEkhbB9ljh+i2UzsgbmfKQekcHQSLz/rnJ5SLxXqb/EJJDJ6PHp+u2H5aZJZ3tzisGVXLpgsilaTNr8dwiqF5+YJb/YcOyCcdyKU4YJRKGDJD520knqJs+Q7+ooU6BwMgGID3z4WjWNR8ubAmxboOKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=iyp5Xkjr; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="iyp5Xkjr"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8935f42e8f0so798288b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 18:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791853509; x=1792458309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rogv8gP1H52CoBczHw69sKFPcqTXLhNajNS7Lu6i04U=;
        b=iyp5Xkjr9/0PVvrnELxm+jrh8SzISYCJ69A1ly05gNkK3pXL0T0xoORr9VYECpqpTW
         f2WtBk5CmHPfbAX0dudG0oqruztFRPqId0QWzeOCSxbheDIaCKI80kqg63YjshMViGI/
         Rmhfxkq/+Xx8z0Bwq25iJz/8oqTBB6EU1REYzkJWIWksbGOFDSCBOXG+SFrykXPELUmQ
         eJzoPLeoYbrSruTmyUkDnjcLtO7yng2h6earm/uMi2j6DgOOPa/odfms4nAqAaAKH8iw
         N30SuUFdvCGc1jBiZTboRjPtCJynnmIYbePS5Ie7Qqhh1+jTZcTXA91b5xi7RrMuCVX1
         I0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853509; x=1792458309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rogv8gP1H52CoBczHw69sKFPcqTXLhNajNS7Lu6i04U=;
        b=Rat8lDCBl8aWJt0Mt767quwePMnFRdFS+XB96Ay3PLf2txC2b2DfIKg1bIAaedF5mz
         QFWZVT1a7JRrSP5cki/QYyUvVb4fza0G4zK1j+tQjhRvD53riRl7/R4BOmYKnqzBJLIY
         8aOk7+7rC/zzPqgtgcC7jwKcuPgHi61FvO66q6JCzmSQJ2M6v1S5HURK7UPWxMVJPDA1
         Wpzq3NETzlAWHFD/0JBPHz6qsgz9XMaZc4VwVJA06j2MpwuH7GKToLma5Ju2IokrUO3s
         KaA+TtYCHt4uK28ZsKQQVlHneH30m6yP52m4dtz6jJ93fDzhE2J90Zxne7H/1zWHL2Wc
         lueA==
X-Forwarded-Encrypted: i=1; AKwUvBz3wns6WbOqBcAJsRrH6gNxZhG03WWkAwtceRPABAeHBxNjbvDwKMROFbK4fkIdXTOCs4NjNl5/OyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe+2QG/GhnLsfqkVNxuWRDHLur382zwKjuObMBJm0S8Rbx2HM1
	6NZyexZqv9JDMR0G3sYSJnLz3Gw39a2avr7LAxjfa+9Bs+3N2ZBpREsmN9YeLfLcJcYYOdoVOCo
	4mSmy3FEV8w==
X-Gm-Gg: AYBFou23EEgaDjnkwM1TC5ayrSxu9nt60W16S//veu18TgEl9jhaoveyq4VUWnCo+gu
	aO79hDvtnMd0Z9e7btR5G02u84b92PxLsf/Ir308WYEzprgSkVMZMHr4QetaufQg+v6jPQ4YEHE
	GTGz9FcRzFoXLnv7YiW88FvrUcRhy42zK/cC0B+0ebJAwRLKYq3XUVNhoBTHzWV7tSVZpNIDrtj
	HiWeqzLoDgWSVMI/UdIKAvuF6gbIOdr6JT2F/nq2RPE0PbN8XtnC/65xKtOVTedXxCa9MtDKOoO
	nuTWfqpx5ng4BU/bx5Q2vXWR9N7oDjThtTFEpUJJGMx7sjf1360WCkKWfL1R3N8M4m8meEWB3fG
	1JpP/zzuagatko3A3X5qcmOQB/yfY2QMHckNBhfoj/doRKpCgOpjru7PHOf3NLIQVd6gX4k6IrP
	mnD9+vO1Fh+Aa/Ar6x7GltfgMmq/wtHDtbpzP3SFBWn+PtX2Ncwt3Q0kntUPWvL6dcl03w0q3cI
	2+8WA==
X-Received: by 2002:a05:6a00:4185:b0:890:a3ed:8a49 with SMTP id d2e1a72fcca58-897c7cd481emr9345777b3a.51.1791853509580;
        Mon, 12 Oct 2026 18:05:09 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107194sm4387216b3a.18.2026.10.12.18.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:05:09 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Tue, 13 Oct 2026 10:04:54 +0900
Message-ID: <20261013010454.2472267-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168374@kernel.org>
References: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-168374@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks - both are addressed in v2.

Deadlock: you are right, the failure path reached bot_send_bad_status() with
cmd->data_len still at the full declared length, so it queued an OUT drain for
data the host had already stopped sending.  v2 clears cmd->data_len on this
path - the OUT data phase is over, so the status phase sends the CSW instead
of draining.  I confirmed the drain is no longer queued: ep_out stays idle and
only the CSW goes out on ep_in.

Log: v2 uses dev_err_ratelimited() for that message.

For what it is worth, the same bot_send_bad_status() drain is reachable
without this patch by any BOT WRITE that completes its data phase and then
fails in the backend; the failure branch lacks the moved_data guard the
good-status branch has.  That is a separate pre-existing issue, left alone
here.

v2: https://lore.kernel.org/linux-usb/20261013005854.2470384-1-yhlee@isslab.korea.ac.kr/

Thanks,
Yehyeong
