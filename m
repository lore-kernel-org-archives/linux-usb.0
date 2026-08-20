Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAB73B8939
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209600; cv=none; b=nTJhU2DA9SOHjfmfDkzXMnMpzlK4WShL0s8n/9qSzEjz63dtlqIAfCUsIgEuyP8fRv50Xs+HRakKHLaCrc8tb96KPYCbVFkQUKA0KObNG32iLjHtbYyXbbORHFFy7ZWNIa+08FG0pg2ge3CajjfCsJptnMfA22lMGwI5CpJIjgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209600; c=relaxed/simple;
	bh=bISfyicDdSVgGTIJ3XXfHhL121ttkBeyMJAc4teMCF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=quxOCXhlQCrC4HxajH9pFQaGricJD57AXL18ZsCUmuFs35hUo0QB+sSGR7QlHMkxAwe8NeSZnfgTxXqYn2S3uQP7a/LrogBtkUQTLpP5Nuhs0t3e4OBDu/c2W6jPYjb0AISNyO1ooH82vNBDMJduMYEuBr+XqPMEwLPDm6kgv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlD9NSwW; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlD9NSwW"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c96c92c0980so969415a12.3
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 00:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787209598; x=1787814398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMAp3wQtiDEpnFh3jW4YwdqqglRZMQsWXmp530DZXnI=;
        b=IlD9NSwWblpxFhct0JA+wVaeh1wQTAc+IfTxJ0zo9y4QtxbVIki4GHrN274TOQiNZt
         tUikPAIgjrVS1qACfBDbjGKGrWeydMqIbTml14B64UjNepP3jvrOJXGk4Aw8oET7R9Mf
         I5gP2xF8f4Zl9dGr8Rq7g7wznR+ViV9T/7TR9PQMWs9SBVWGFKhfbh7rINJxsL6dAuWR
         1zETZVYhePqwCA/f32w5aMdX29z4U727VCyEu29+gcSizhzgMJYsu9krUkThPMXMlvpS
         onWU9f5TRLlO90Eecm6G3KnoD++m+VOoNCpUrDngeXFgUQzicO6j9tnXxy6PfYMlwzDV
         Lvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787209598; x=1787814398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMAp3wQtiDEpnFh3jW4YwdqqglRZMQsWXmp530DZXnI=;
        b=C5WEztRyPX2N15j0BBhFtfnxM+sLOWxdTaS0xoe2KVP1JcIOE2bf8b7GCiSZaJL58q
         qzLPOzHkoOyUXf6093vTScNSVR01f1yYmRUKfZrslT6qAQsVM70XF4Qp9dFYPwsMN6LC
         F2mVLh6FHYn28ST4T1hENDPmJ/fdPSc+4z0y47qw0bkz7rma94f65ubec63J5tfAI1jz
         L0WcoOpfzPJvmpQSbzmBAZ/d7VCGhAZ0t2Dqh+3fFOf2F85jlq/2NkDqRrbgzOhAChQD
         1B1kcnD1+pWwRG40XZ4cc2F7UpT/LMOQoQSiMiCirZlp3QBR4Hw74FSwfTuLCml+xwHm
         8ycQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJVFwjBAg/CTZ3IQ8jG1EQ/dJz66WZdEXNVWVh444paxXAqMUHjvhw4Ld6oXOvQaLmVtKTkTQLLTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5iDOq3D9GI31k0n+3uW87AhOue6dU4t+XeLmLR0X+vMMv2E73
	U6Nt66SafOp9gYXyGKrEs3QQ/j+3/evZURZ8OMMjOB1VlMvd4r5mN7vR
X-Gm-Gg: AR+sD10hzUNd9/5i0hORGz3vqyOOMTdLVvdPhJU/L660HtWFtdb7/joFNxGoM3K4IBr
	8nLSO8r3uet/GwdpGPVeGFsO5TGi7MdO4i7/A8YXg2zvT6Kq8hRlf0n9DOyZx7+qQdqucCQiV++
	4TyAOgGKqHrAyYpT89hvUBdM9QgH4kmvvh8ZHe6oG/bAI+XNCIZA7jgF1hi2w/RwFyj3lCwIuYn
	eMvTFngCr3IosmCVHwSwVC9CL0axMc0HxvAe74Tzl6rclpluaijoT5qJdmJlc0XhWK/8YyKUPqs
	IGKfI5lV4+l2qvmeKZLFpYIOXIzobyIw5K0nSt/L8YiXx3AGe1tjCdZ/cpQN5ScuBCOiRamVnvY
	Ed7H4f6fmP2CpOHvRBmbnAf9ukIAoHOl5L+sNpg4kiL+5zboUPbsNpV3KxSedCsVkB/M5kwXqBw
	NPqmIaD/XzXhTb/pYpuWM15E9Rzb/WUh/fpZ7aURWk01bTN/dPM3j0gzUKLnMr
X-Received: by 2002:a05:6a20:a126:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cd011a0cfbmr19140084637.14.1787209598506;
        Thu, 20 Aug 2026 00:06:38 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:17d0:9614:8caa:e85d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad69638sm12460899c88.7.2026.08.20.00.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:06:37 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+e5e28c3e953b2eebb16e@syzkaller.appspotmail.com,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Subject: [PATCH usb-next v1] USB: serial: keyspan: Fixing use-after-free in usa49_glocont_callback()
Date: Thu, 20 Aug 2026 00:06:21 -0700
Message-ID: <20260820070621.3286443-1-rafad900@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usa49_glocont_callback() obtains the private data from all
ports of a serial device using usb_get_serial_port_data().
This can happen during keyspan_port_remove() which frees
the private data which can cause UAF.

Fix this by calling usb_set_serial_port_data(port, NULL)
inside keyspan_port_remove() right before kfree() of
private data. This in turn allows "if (!p_priv) continue;"
condition within usa49_glocont_callback() to execute
properly.

Reported-by: syzbot+e5e28c3e953b2eebb16e@syzkaller.appspotmail.com
Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
---
 drivers/usb/serial/keyspan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index 4d3746c7a94e..0e08acb99970 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -2997,6 +2997,8 @@ static void keyspan_port_remove(struct usb_serial_port *port)
 	for (i = 0; i < ARRAY_SIZE(p_priv->in_buffer); ++i)
 		kfree(p_priv->in_buffer[i]);
 
+	usb_set_serial_port_data(port, NULL);
+
 	kfree(p_priv);
 }
 
-- 
2.43.0

