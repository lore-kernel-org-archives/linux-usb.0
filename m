Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010738;
	b=nlOXcRM5OcfDUx1uQvdatHbhPNO50WyB7qTwIjzreKsE30Ifmbq3TGCaFuS5zNWFEnN+
	 BTgXbig1JHGM2iadprIhV7myz6urK5kqotSdvOag/S6IoF7LMsbOKXW+7IQcrinVui7ro
	 bhQKXCOVPstavSEYN8RbzWlr2MpzjD05hc8bRaBxaUJYa7napD47Fvm3U+THuNtVA06Wm
	 GsukagZBVFolItF/hYtVw77cusq9KsvmY30iffFK8gyRz2t/UuDKp9Fb6SG3kgfayKpzX
	 6SuiTAjdDE888SD0hqvxwEOg2ehccn9hB+u4TUTXfh7U696C0VY3l1XvUrtQ8K3B07w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+VbWtfq+Ox3MSoXAgs6LwTdQofVbO7Hu37NE8+JdFzs=;
	b=rMGD8RqzCGtsHdzGYiFg8DjT52CthAp/YuS3/SWDGB9G09jebzM9sQPOadXYCqxPRWtd
	 XMyTMU8jGRXDhxTmUc4m3KurdLHlVfJP9ymBfgCIIRADbYgUJc2F0c1gljdkXl+e3nnAE
	 6/PtXoJEXfKwvOQNoC9eCo9b5SQiNPI48n3QG4cLmU9UftGUwz/s3bs+6Y3P9ovsLgV4V
	 5eDhvLJN/MpPAIfRuLyY+7GCW0I6H1FeuGNOMI6AU+8rSmxoxJ3TAiPhUDhg4gMOaCmF6
	 UjWlgQ5Kd5Zgj2mbbhXvXC1WEeO5TVxqBpzzVDv8LIII+W2yfieZXWT30FxFkDDT0nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9UgL+p2;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E960A260B
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 14:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 925E960A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9UgL+p2
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1523713eec.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 06:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010737; x=1795615537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+VbWtfq+Ox3MSoXAgs6LwTdQofVbO7Hu37NE8+JdFzs=;
        b=v9UgL+p2DxPP/ZpVy8WsasHVtRRa0oX2YDIQg1sUOBbzN7a2KRULIjVf5EUl0Msy6F
         pq84YN7s0mIn8IK2ZGkG4AhQkNWnWCjy568cSdSVUijjeshDFckfZC1MhaYexQrPCGBP
         kOhbkpg9uzaK1a8ygKoV5xNWpOXrsh1Y8f+bvEzgfXLFcIzYtBtOCnaWpcbzYLoAkrFp
         vQhRXEf+bHjXcev3X6hxCh0YQQiceWqkcX4rHXtzBj9fynyVOoMyeAkBuDaVwH6NWIox
         3XqBCk5KuEJqhlemwqkWnLcSIBi1wnMKXQBB/0GHegPQTvRal2ShdsUFjQzKyUQ26r82
         nARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010737; x=1795615537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VbWtfq+Ox3MSoXAgs6LwTdQofVbO7Hu37NE8+JdFzs=;
        b=Lx+GaXJootnChggd4XV+S5AU6YWyTdhblZb1CbzThqd6YPveFEpDPuldFW2VVyroN6
         yvkQzacoaWrL8E/AFJ3d8CBfYOEMZP500MzcEphxrE3HN1uwtgZ4wvRBu7JmRFjC2UJS
         AHLyu7JjIfCM5rbJ8+gIDM7qbMPzVBJajf/4FGrJVkMjzGyBkxQ6xtHZh6M25FpBPMen
         l8xN+ErgvdS0efuHqaLWcNit/2yNDBEOY20HaN0z0aHfq8SQsTWYDYdpFhdOA+kui7rc
         DZtBe/horcgs0Zufy6iGFC0lRqoxzttUNkpLXJE3CmgEK6kA723QVBfdZ/XLScmyf9kR
         nfdg==
X-Forwarded-Encrypted: i=1; AL+hErHmWT8g+sng+/VuhdjrDo98gspHhou/BjIkInYSYe8EMUYmm50vb05YXD8ytwcCuMHfp/39gEWHfSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z++pGuw1stVhLw6twgj6NeFEWBgBpjHAcWt7UHzioUYTgIvwnyO
	mIdDjreuIxsvxyPbcVM11hCDq0tlsrHQAJLc/6TmFYzcJeyncylj5th4
X-Gm-Gg: AZFdTZchiAfUk5F9y1lBRgtdnKDu4ShbQe5qVuyN5/s7AVMsrq13MeP9WjH57xu3WJV
	6E7z2hSkMo8YDDfoIlxVHFx3bleft9PYPU6dWePQr+fOt98135BNnGy+1nnM1n2Masc612Iqix+
	E2JCalRSFMpk7TorwpU3tnqgGriZyN3EWrybSdj8IqUghVdoBVQMV8vuwaTlgZ9SFi7uDt7JX3m
	V4Bk2H+nbqYIbZG8jldGty61oSeP4Gw556NKGcOhWII925jjRx5GO5W76/IitLZOn/kYjODNXAV
	qNvi26rHfiRFTV1aqGjtPnb4FZmzJFfaAqd8nrkkEti1LqhFZgH8erul6t/9qnMKvb75xYv8eqE
	YfgtQ+PuD8Kc8SOQFE/J4hAMZM3rfZTeKx7GgVfe/Ko2QDxTA1vawBvjxPodJkeaszI9kUL7p+d
	zQ6jRhFYaRikLBowBNqFN9tv1wfcuo5iTnltWEz7Z+uGfmtTAXgO6HYPle6pQDPpqeUXCZ/P6dC
	LTMm1iujfMVUlbhWPIQKH+X76jXXxcFeNK3RZxOzcf9BGImjLnr6aY6l/qC0pIBvgYSRP3LepD6
	DOZKymcZ98zNSGnS1fpY3uLq7wjSCqH5Uho0pqHrgORF61g5pIU=
X-Received: by 2002:a05:693c:880c:20b0:369:f961:ccf8 with SMTP id 5a478bee46e88-38281afc80bmr2281351eec.19.1795010736457;
        Wed, 18 Nov 2026 06:05:36 -0800 (PST)
Received: from localhost.localdomain ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm9901823eec.18.2026.11.18.06.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:05:36 -0800 (PST)
From: Guomin chen <chenguoming88s@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roger Quadros <rogerq@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guoming Chen <chenguoming88s@gmail.com>
Subject: [PATCH v2] usb: cdns3: fix NULL dereference in cdns_host_resume()
Date: Wed, 18 Nov 2026 22:05:13 +0800
Message-ID: <20261118140513.8281-1-chenguoming88s@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Guoming Chen <chenguoming88s@gmail.com>

cdns_host_resume() assumes that the xhci-hcd child device is bound and
passes platform_get_drvdata() straight to hcd_to_xhci_priv().  That is
not guaranteed: __cdns_host_init() creates the child with
platform_device_add(), but the child is only probed once xhci-plat
registers.  cdns3/ is linked before host/ in drivers/usb/Makefile and
both are module_init(), so at boot the child stays unbound until
xhci-plat's initcall runs; when xhci-plat is a module it stays unbound
until the module is loaded, and it is retried even later when its probe
returns -EPROBE_DEFER.  Platforms that set
CDNS3_DEFAULT_PM_RUNTIME_ALLOW (cdns3-imx is the only in-tree user) let
the controller autosuspend (20 ms), so the parent may already be
runtime-suspended by the time the child's probe actually runs.

When the child is finally probed, driver core resumes its parent before
calling really_probe() (pm_runtime_get_sync(dev->parent) in
__driver_probe_device()).  That runs cdns_resume() ->
cdns_host_resume() while platform_get_drvdata() still returns NULL,
because the drvdata is only set later, by dev_set_drvdata() in
__usb_create_hcd() called from xhci_plat_probe().  hcd_to_xhci_priv(NULL)
then evaluates usb_hcd_is_primary_hcd(NULL), which dereferences
NULL + offsetof(struct usb_hcd, primary_hcd) (the offset depends on the
configuration).  The oops faults in the first instruction of that
helper:

  pc : usb_hcd_is_primary_hcd+0x0/0x1c
  lr : cdns_host_resume+0x24/0x44

Return early when the host child is not available: it has either not
been created yet or not been probed.  cdns->host_dev is also cleared by
cdns_host_exit() while cdns_role_stop() leaves cdns->role pointing at
the host role, so a resume after a role stop reaches this function as
well.  Nothing is lost in either case: the child's probe initializes the
controller from scratch, and xhci_plat_priv.power_lost is only consumed
when an already initialized host resumes.

Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to xhci")
Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>
---
 drivers/usb/cdns3/host.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index e01264dc625d..3456f065111b 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -140,9 +140,21 @@ static void cdns_host_exit(struct cdns *cdns)
 
 static int cdns_host_resume(struct cdns *cdns, bool power_lost)
 {
-	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
-	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+	struct usb_hcd *hcd;
+	struct xhci_plat_priv *priv;
+
+	/*
+	 * The xhci-hcd child may not be bound yet (xhci-plat can probe it
+	 * after cdns3 created it), or may already be gone after a role stop.
+	 */
+	if (!cdns->host_dev)
+		return 0;
+
+	hcd = platform_get_drvdata(cdns->host_dev);
+	if (!hcd)
+		return 0;
 
+	priv = hcd_to_xhci_priv(hcd);
 	priv->power_lost = power_lost;
 
 	return 0;
-- 
2.43.0
