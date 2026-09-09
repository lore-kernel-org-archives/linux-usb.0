Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEA034DB4A
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 03:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788925852; cv=none; b=S24q964DVlrKgiLcFOJzgzbo8+D7GUPmXV+q3upr+Wcr4ahJEutS7zB4w/KFTmOVyGLs/rbSMrCLIbt555kxHwHDXEKZlR2oKVKORYF6n//BduQlTQAEe0mJw6zTJPkp+glm0QOgkPC71BqCJXth8ZTJFt1il5Mkb/0b0Zzfguk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788925852; c=relaxed/simple;
	bh=sWDBzW4WJcdY+LIuSxb/plDaP/h6S/NDDrcsDsXRlZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sm/5liNJEIydnGf1AXEqOMrJFAGBu4Bq8iS1mbiMDqEfyZ4ov6GsSjr3Dn13U5CNjc4pGrzQEd/EyRpAqoIYZ7fbImSGtarsWom1PGdEjSG/xkEBn2CtMjsasbo4FspzaZJCOiIdNhVPzIRLrjfdyIndA9iD1sZdH+7sivkwuJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGdAROcK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGdAROcK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so57069055ad.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 20:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788925850; x=1789530650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7wTdvA2d9sFV2EAncRDbj9twueFuAWZbRGqPKTwg20=;
        b=mGdAROcKmOwOIlecRtWeOxZRMlDCxPQpfILlZwZS12+UnlWqzDjdwaQKs63VjymIfU
         gi8+Ped70DJyDInUY28ISIvL2XL0hDWCwwCMP3fUE1raikzwKWKEtajoQX4nuCMQfp0B
         vbS+bJgZQdlHhBJl9cvwvn6ymu5qGZFg5eNkV89AJXtxzZBiUhZhMSkVFcUgl2a4yopW
         G16cIa3tC0yNgVKOJMPMCCuL9cJax8k4GjGQJdY2uzn8H49RDGKI8hG2xU4XjWEv3xiJ
         0Ar6z9jIh4NO4FL+AozHt9ZID8DiCKIIxS1o9/+QADqdYyW2++EZy7NEOXUKkOqVHk2E
         Mpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788925850; x=1789530650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7wTdvA2d9sFV2EAncRDbj9twueFuAWZbRGqPKTwg20=;
        b=aGYIRHfLPPGP8PO0cObkrsMKDg/wDcFBWHDMe1JWa3kQeTe4LwQ6mhPWBQ4wmRU+k1
         n+c2niKXb1hW4Eg2LFtyuqbGuNSm4vK08bqk0LAwi4Bs4n78UmIJmAwzuZgEYqDyhNiH
         BmyDWBMiCIpDBD27H5v4+9v2RWYKqm/ys0oITjGvgWT/VayG2DP78BqXB3kLgV3QQUkn
         I0z6goB8H5DwWAkAduo3m6scrAvv1RA1qIlT8mLj5Ox6DVUufaQf5cf9aDnuWFSBB7cl
         dLkCm6iexoNTwCpZ8Ix+ufWi5Zltw0Jtn4KYQyBS09vNOA7YLVomOhRY/+PPZo6YuXKK
         XIbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwUufTh3MqL1A2vR1XGtDWDi7yEu9ojFXlfy7443q1SX0bJ+jaSasHlDwvNA399cbrlynB36LIrNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ksaQ/ZH+buu3LXaody9IPGcdWcw8InKtW2mVn5tRfpxGISEGB6
	5ayGFUgkfCaWiS3Orais9riwYRutXzqp38zJyDlur+sd2E2VR9Pr/jV2
X-Gm-Gg: AYBFou3e/3cJgsfglreqW0v/+fh2RzxyDGgHaJ+yl++Oz7jocPptktV/dmIQaaiH3l1
	E3aJY4QKPCOTPG5CU1IA+wFkmd9p8cyG9GP7g/gDbn67rtsQv0hnHGIoB7WCw+ocesspHXetiTg
	xaZz5XOthVufTY162tpgpnQBWvHM73eibJctsPk+4BWk9lNvmfuij3KwwZLRkMj9MI3jNVM+CXy
	kA/b4UV217NGv0zJmt3QGmeNsvo/rkqMZw/ZnXp7KgamrRwXLsysbjWrFNSt1oiP4GEPDUaesMo
	zveey6gTqTmTTldachQXq5JIA0UBMifoM7dF4vAP8X95qzM/nJy2OYyWj++a2mRKP1WMasJey3H
	e1686OInXaaRlyUFQB55y8dOQg9/Q7hF7CObqpnxmu44ZoOyoY2D6jUExyJmdoPSemmCK7QRsvQ
	U91MgGllck8c6adcjmJQ+nyOmpPHT5NgR1ta07+s/0o7Snd2Tv9wwaE+GvVBJo0/Mp81ql1TVhJ
	YLsGhI6vvg=
X-Received: by 2002:a17:903:1670:b0:2d9:438e:b70d with SMTP id d9443c01a7336-2db1232c88emr501014495ad.1.1788925850239;
        Tue, 08 Sep 2026 20:50:50 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm65891705ad.79.2026.09.08.20.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:50:49 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] thunderbolt: Validate DP bandwidth notification port
Date: Wed,  9 Sep 2026 12:50:39 +0900
Message-ID: <20260909035040.2929285-2-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909035040.2929285-1-4ncienth@gmail.com>
References: <20260909035040.2929285-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The port number in a DP bandwidth notification is six bits wide and
comes from the router. A router whose maximum port number is smaller can
therefore make tb_handle_dp_bandwidth_request() index beyond the
max_port_number + 1 entries allocated for sw->ports. The first
tb_port_is_dpin() check then reads the out-of-bounds object.

Reject notifications that refer to a non-existent adapter before
dereferencing the port.

Fixes: 6ce3563520be ("thunderbolt: Add support for DisplayPort bandwidth allocation mode")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 drivers/thunderbolt/tb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 47753a5c0f2eb..8551dafe98c8e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2756,6 +2756,11 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 		goto unlock;
 	}
 
+	if (ev->port > sw->config.max_port_number) {
+		tb_sw_warn(sw, "bandwidth request from non-existent port %u\n",
+			   ev->port);
+		goto put_sw;
+	}
 	in = &sw->ports[ev->port];
 	if (!tb_port_is_dpin(in)) {
 		tb_port_warn(in, "bandwidth request to non-DP IN adapter\n");
-- 
2.55.0

