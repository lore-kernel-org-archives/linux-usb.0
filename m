Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1DE379998
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152741; cv=none; b=P1YW4vlBr2aBY0Lf+kKymX1SbDPEIkQY9Q+eieDAgVQk34diokriDxJfpe+2x3Ci1677yUgAg3CWaaIUucXScYdvaSGcBbA6r/wgcZr7z68NXOsHL2HXmmaFYyZnBRj+IfC122yBWNh2Tz5zBiq2rIeDBGpz1eLBHA1S7OnKUDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152741; c=relaxed/simple;
	bh=j0E9slfjlQutlT6Rmi1TRe1co8dcfLW5noTfuk2g2T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NeY9CtUd05+CFP78FL0rO5vktmpo/vrtRv0nbZQ+Y/34rWlUeMOlCoPlxT5iIOaharAbFl8R+T+qpwe6zkRN3P3k1yGx/qxKhz2Vl9gmmK25ceCqIpKY8XAiHEaptKnCpTAVRKay2lEXlUzaNBGlhLXuSLt45aAzn3aFQ0r7U4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx8ysRbf; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx8ysRbf"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso453230a91.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152717; x=1790757517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IX4TEagbPQFXdBfnOIheUTG+gtBUa9fq/Un7VWSnr+0=;
        b=Cx8ysRbfrxnCBY5+B/XrzoK05UtRyDDq1w0m/0WZyFqU0zIBJDCFIUNZ4M3enV3fbp
         jn1lAk6Edc/q6ruU/aOI87lucPU6wSPRN//6xtoaNwrhcxDcIREC/Lr+wU20FHW0zCeq
         62ZVv70NI7MOwCxmP67YqCPd0RJzF45NN1vaL6oxpRvjz9TQLIxtCs5UbfeloLc88hdh
         gj8wDzMKduxpUW1ed7XXO0LSgROgooUOHR71Y9NA5qA1NlKZMUiLkLlrXxZXqSbAomcE
         zkfPWSspXUZBCZXFoFAjSCIAsLuYZoZVsxIdEbh3tKhkZ4Ywn6DuKcMzYAIbUqG+76Oz
         MxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152717; x=1790757517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IX4TEagbPQFXdBfnOIheUTG+gtBUa9fq/Un7VWSnr+0=;
        b=r8Mc+1hbmrTYJRpKw8eG2HOfN/szxmmtBWXAkVkcZn0MOHvJjiiH8yN/X4AOs7Z1Jb
         nbz1CybycZqC3h7WJeaUQczRfKpQyTxbYJXjD04VY7uw7qkzNUAzV/7BhBl2CtT8Agbr
         eW0EDqgHWVo8m2fIdwj1P+gm7Y0NlXUC3FvU3/oSQOLZc6aDeBHRayzTFZ3cEJFY1fw5
         2eelX7fforIJ2meawVK6yYQirP1itX/aJUpQ8tjS6sw7x6ldP0DMiyHTLInRC54n01Dt
         Ef45oJcwx5a0g39ysqRbIW3VmHykvaIhJVkQ7TzA0gEGpO286EqydWV5L/kJ+UsncnJQ
         RD6A==
X-Gm-Message-State: AFuF++l5wrNVsXayDkO5zqmQAJSbFxH00BPK4VKPcHACeLR26PMvxua3
	dCVbSl4lgdbfmNB0MyXXUzQIjPwh0zkb53jPjxhNLzFJP+zsIglAvUBEMO7bg/VG
X-Gm-Gg: AYBFou3fgiuEOj/w46Hovj9KLofnh4jfHyhnxLp/sfgbAwfck0INyrx+JU4FfUnw/h8
	dYqveadrtZCr6DHXXir2eEmb8SF4S+RXLLFuAofAyv9tcUPqq8NcEPVmWjiinxB/aPUxHunmrjO
	/QToSOVLgLTOu551yrsjYGaZf8M/YXW4JaTTfm0VqbbyyM6+9TkadrFOsCFkYdr1RebzVQhZLwF
	i5FJDSJu+N8H2GrJMpGnfTiGG4yCTvX/DN9lARYOh55c6SnqeNQcCHU9B+0DmuNnz2nFOucc1ct
	Wb/hNvXuaXQPLNzZmlHiuPrYreO7hMMEuWToRCBPq/9xqvWWYO7LxbgWuJdsXQNQlVqRGS+vX5D
	hQSG391px2upHjTMMW+iIWfUKV9lRn1qAO4S8bfn6OnICxWYkymxuSN9KAl4NwyEbzD554/Ulue
	QDqNxcio2H7X34+B0Gre+ns+lvgRYd2G+AwK0S/Wof1VOBq9qW0aJj3XJJq5MXjx3hHpW7LsvJF
	EeYbDBoy/L3TE3ISWpJtDFwGUJwEy9T/8ZgJNZtCC5i8//NdweyAWDfqmK9vp+03l+RENveVZMt
	qA==
X-Received: by 2002:a17:90a:fc4b:b0:39e:6c69:776e with SMTP id 98e67ed59e1d1-3a07e69606amr1458680a91.23.1790152716997;
        Wed, 23 Sep 2026 01:38:36 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-212-242-176.ap-southeast-1.compute.amazonaws.com. [13.212.242.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddf23desm3793463a91.10.2026.09.23.01.38.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:38:36 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: core: Fix unlocked hcd->status_urb access in usb_hcd_poll_rh_status()
Date: Wed, 23 Sep 2026 16:38:28 +0800
Message-ID: <20260923083828.64925-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_hcd_poll_rh_status() tests hcd->status_urb without holding
hcd_root_hub_lock, while rh_queue_status() and the completion path inside
usb_hcd_poll_rh_status() itself update that field under the lock.

Take hcd_root_hub_lock around the early bail-out check so that the read is
serialized with the writers.

Fixes: d5926ae7a827 ("[PATCH] usbcore support for root-hub IRQ instead of polling")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/usb/core/hcd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -727,8 +727,13 @@ void usb_hcd_poll_rh_status(struct usb_hcd *hcd)
 
 	if (unlikely(!hcd->rh_pollable))
 		return;
-	if (!hcd->uses_new_polling && !hcd->status_urb)
+
+	spin_lock_irqsave(&hcd_root_hub_lock, flags);
+	if (!hcd->uses_new_polling && !hcd->status_urb) {
+		spin_unlock_irqrestore(&hcd_root_hub_lock, flags);
 		return;
+	}
+	spin_unlock_irqrestore(&hcd_root_hub_lock, flags);
 
 	length = hcd->driver->hub_status_data(hcd, buffer);
 	if (length > 0) {
-- 
2.43.0

