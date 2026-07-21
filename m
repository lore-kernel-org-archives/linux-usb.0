Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F8F3DB64B;
	Tue, 21 Jul 2026 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628934; cv=none; b=VbXYxCJktGEyJl79iU27XJpkHAnYl6v5O0NJn9qeMs697sH73qhYkNaHT1uIvVhr17Z4lCdHx5hHgZ1DNGib8HIorc44IyWVroQQ56VgcgjNKkTU0Deh3FKWLb/fxdAUcGm/LA9dfKiDTIYVjWWR5M0ogcE/QWtMx26rT95+8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628934; c=relaxed/simple;
	bh=5ahVlNagwFDHiZoLi6dsBoUw1g3dj2YLzdPI4pt+hNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/wtW2BPTx8Cyd/5Ep3SlrM3VO7KK/2lDtLZI0wSulJChiHHMa8gJHya4C/E9wfXHnlpQmUbZN1AOobPuR0NxkRV1aSHobZOxYPEi1V1RO+qR6LV3xam+875+NXv9MEuBvyQlXbhdUS4lQqVT6GNcCmBNfErqQEVPcUsMNJO4Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=YNKekZ+I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Eezk5ZeX; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="YNKekZ+I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Eezk5ZeX"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 3C3EAEC01B1;
	Tue, 21 Jul 2026 06:15:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 21 Jul 2026 06:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784628932;
	 x=1784715332; bh=94AV+cR78S0dpuQCrWvPUW036jLFomuUdH+WCCzjOM8=; b=
	YNKekZ+IrYK7A64ID3Ta11wo0d0Co1d1Q7q15Od+uiJcLM7VoMUQLklSQO01J7GX
	C+kdx2IiLE43occfOZWPwUoOezyCFRWV25DAcCPjDca2MrHMq0yP4dQfec3w945Q
	5YF0mpsP8oOgCT/juhsE2VPiFHAbUn0dYcCSyIW0t/ZQpiKLihtyRDJfgNoxtCBK
	rRRuu97P2bRL+eSL/pM4kwzcqEO256zyYb/rBSOLxbbmHU0AXh/7Uk92QBEtR26t
	ap5oYNPi3boMbbHNXSpSoCCcvahquUlrjI3XJa5GMFT9t4n64L6G9UOf7J6P6LiB
	yWHFyON8bqKnuWbpuTjsmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784628932; x=
	1784715332; bh=94AV+cR78S0dpuQCrWvPUW036jLFomuUdH+WCCzjOM8=; b=E
	ezk5ZeXU3TQgKLXkCHMuMMH67jUio4c95wefdHbbH7byEq0EV53pJXaDPrGCgKPJ
	G/B5ZzKGV4pmSzUM/IXVVpFZlZCx9a5654l6MG6jrb/YjE3B3bV5ypjBhFuMkcaD
	JD8mtDEkjpyFMw8DTOx8HHTVBO7fra3kmyJI/BmMvpn3hfuifvvGdG7iZriCOdVD
	Dc6yGEmWQb14//SjPY8dTNnWXhoS1OeTFAga3vnrlk/ye1rNTaOJjM/oBgxLJb44
	U6YkW839W6M+Skoi2BBeXZA+PfZOLr2Qn7EFkjgaGFzSAFltEqdKy5lkqYBiL5HK
	+s9NNn7K+O7+D60Fs8p/A==
X-ME-Sender: <xms:xEZfatj3TqoElm7lB_GuGQUd5pJPeZCrokmkRrmxMylrzZVM6HP2xw>
    <xme:xEZfaq_wZ0UMUtwByQCzwY-L-h-PY0icc97A5IlEddpnk-WuPQWwUnXMhvdw_Knoe
    aaJwNjVexZ1lRJuSsygnWZMIdha0n_oYunfVieOPstFrD1IDQw>
X-ME-Received: <xmr:xEZfaor8C-kqgByaqmh2epY-DSCjqA1OvqJ43ynilNC8KMkhGEPdsq1rKG_uthv8GbEunZI3iWL485qbH5HlYc2krScE3TRgdg>
X-ME-Proxy-Cause: dmFkZTGCelPdHk18W4dLQbOqKO02toPalmUBSqIJlCMJbAYBHGMYqrYQKTJKHurziZmiCb
    QH6LxgEw1VSPq/bOYq4F1SlQWy0lx7Jf+eh2/s1GtdkMKirxcJsQr9QtH97/Tu1XJmXGBS
    hPT900IQbS60hL1sHASWjkyH9jRK6ZhO8OmqbafLvkkmzC32TgC3DoQ5hjhHM/8qjbSCWV
    38MCugc48y/bzBIgxjU2AjzXw1fBuuTV3/XT08Cq8zvwQcgjbc2+ieCMYyPD58S5gd9dIF
    fg7ZWGzc+1wK9ys54weg/c/FnZzjma9mXN+eU3iT+efCJKu8HjCyZCbukbquxxsYw98lYF
    8rRo83Ehhx4Av0A7sDXh+khCUoL7s2d5leAhsGM5zDf2/lCYeTu7FRL/PkFrRQFxoD7+sk
    QjSppaMRJMaqGe+3nNNotIJFXvf253iqGlgz70XvRLB6uvT+uMcd8taSPfouBbxetkfSYm
    jqg3wq0mai02l9n8rq/xFbpIlcHnDn76P/DfgLt95JDDuFfawRxE6G/Sy04WRtC6boQQGB
    9Odq90oPl38SUVlk7Iqe0GfEmn4oWpfOBd2przOn/2x6x9TpxLKkaQ6jtjAgW3PBDEn7Qm
    8pOgEFDBv3eEYEgebHTkcykDWU+GcaGrzLY5HHu+KSWRtNqTCjzi9ZmNpQyA
X-ME-Proxy: <xmx:xEZfaiXEp3FZtkimSSFDCOSlnabXozqVfTeyKWS31ztiua938TawAw>
    <xmx:xEZfanAch08ER_8tXIP-2H0BUKPKes1AsKnjoH1z340jm9kCqW-F-g>
    <xmx:xEZfam0rQXtsl8rFJcKLqgA2XxnJxLmyl3E_qJeTJrqyN2RCFkW6mA>
    <xmx:xEZfap06tfxu8CJDbpetwE9Aiu1XIqEuw_wxF6g78KGVeTP4QhvdIw>
    <xmx:xEZfao_x0FMmr4qW2Xi0fji3sJ6L1ETQaOH-TG8gjt9lcmqhg716697x>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jul 2026 06:15:31 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Tue, 21 Jul 2026 12:15:20 +0200
Subject: [PATCH v2 2/2] usb: core: reformat error handling and messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-usb_core_patches_2-v2-2-05069c892fbf@kroah.com>
References: <20260721-usb_core_patches_2-v2-0-05069c892fbf@kroah.com>
In-Reply-To: <20260721-usb_core_patches_2-v2-0-05069c892fbf@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>, 
 Alan Stern <stern@rowland.harvard.edu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784628928; l=1834;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=5ahVlNagwFDHiZoLi6dsBoUw1g3dj2YLzdPI4pt+hNk=;
 b=EsrOaEpONfJhF7qmDa99Teve6wK1raG8GyyKQ8dEZ0mRiieU2sLewrBi79QUstsHtrMD7yHhc
 stBiX6g2tcCCoadkt8IlnVBb5CJ0fQbYKQ2Wlbkg9S8a2qd9S5ZLOKG
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Rearrange the error handling changes in the previous patch, in both
hub_ext_port_status() and hub_hub_status(), in respect to maintainer
feedback.

Additionally, change the two usages of dev_err() in these functions to
dev_dbg(), and reformat the error messages to be more accurate.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/core/hub.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0d2166b8923a..a563f7db1c59 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -623,11 +623,11 @@ static int hub_ext_port_status(struct usb_hub *hub, int port1, int type,
 	mutex_lock(&hub->status_mutex);
 	ret = get_port_status(hub->hdev, port1, &hub->status->port, type, len);
 	if (ret < len) {
-		if (ret != -ENODEV)
-			dev_err(hub->intfdev,
-				"%s failed (err = %d)\n", __func__, ret);
 		if (ret >= 0)
 			ret = -EIO;
+		else if (ret != -ENODEV)
+			dev_dbg(hub->intfdev,
+				"get_port_status failed: err = %d\n", ret);
 	} else {
 		*status = le16_to_cpu(hub->status->port.wPortStatus);
 		*change = le16_to_cpu(hub->status->port.wPortChange);
@@ -992,11 +992,11 @@ static int hub_hub_status(struct usb_hub *hub,
 	mutex_lock(&hub->status_mutex);
 	ret = get_hub_status(hub->hdev, &hub->status->hub);
 	if (ret < sizeof(hub->status->hub)) {
-		if (ret != -ENODEV)
-			dev_err(hub->intfdev,
-				"%s failed (err = %d)\n", __func__, ret);
 		if (ret >= 0)
 			ret = -EIO;
+		if (ret != -ENODEV)
+			dev_dbg(hub->intfdev,
+				"get_hub_status failed: err = %d\n", ret);
 	} else {
 		*status = le16_to_cpu(hub->status->hub.wHubStatus);
 		*change = le16_to_cpu(hub->status->hub.wHubChange);

-- 
2.55.0

