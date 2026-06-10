Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BA5352018
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114976; cv=none; b=VXk7KTECmavLQ54dR56psDtGAhulVkeaO3Ivu8sd6mQZ1FoosZlm6rVpG9Hy30ZhOWOwTjsfLOz+IcHP0ZVraxjXENbJfor+7QMKCPoVcAJ6dLJ7Tjo27PkM54Ys87usulkeUZnE/wXLLOsj20t22zHkFQxyQ2zzej2TUmZuZqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114976; c=relaxed/simple;
	bh=TcgLzz2FKVyslii3l18U6N+Lfgdl8BRpY9C4tApmbr8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cxLScIkhL/jfcR4ApPRaxpEFVcKIbsCF5mDzYxLaPFCfeBGqT2v3oiIDCyCRUHg+pSgAIQhSCoeKi3qKZGBLlXGIiyZuViDNG7g9BVQNtXeXi6oXmxw4vz37ZMxc9lkTZjOpYAhKJJprFLlriIXcLfuo5qYNtxWsVt0iIgujxzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NhE03k66; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NhE03k66"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-30761ab3483so4056387eec.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 11:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781114973; x=1781719773; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7qiOYfoqxge5ltmSaYzYpxHCL7kE1UyHf9z0w0ZOhY=;
        b=NhE03k665X7Y4H3BOp3TQs4QoHRpJISu0f+a+Ok39fCWvvj14CYWPaOP3WZSaO5W3W
         +X8VTbpD2lg+UzvQqWDOyZhVkG0+UcXwq+1rcWCinNZSBecFsQx+NaPIRxaNk4e44Awt
         ZN9oUn65MOYbkl/ge1i3gxh1lZh7F0/MMiUkrwtaFNbImHMEQNBOr4wNy6ua5o5/ysAl
         eI2EIJEaAmMb/geOKzNJ9Vjmu3A4PwoxGgfYyXYsxiy7kmjGTMUsLHXjEgXSEJyVYGdF
         64cBy06g2CHDudqVxP0UVWCvCPMQlgx63o3pjoO7bWS5KlhYBA89oOA5rrJ+5Q0etz+r
         h11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114973; x=1781719773;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7qiOYfoqxge5ltmSaYzYpxHCL7kE1UyHf9z0w0ZOhY=;
        b=mZdyD0yE+EfuXCWtbq9NcDFmhJlPG2Nanf8cTEzAwvq3es4F2q2nSiHKGAd768AFjK
         YBWBCy1z46+4t7JOjBQIFFPrbnemJgfxzPuYc4R00H/zUiG1PxYwx6+W3YkbK+mmvHQU
         nE7F+2nyKF53SCZCWnwTJi+gJ/YRC0mjeD5K+Wdmxv0CBCWksSU21ev1ZF3P+R6G5G9r
         bJdZGs/UsHScjfgBuv+XRTQ3SFPVRKjH2AoL6J9zcbOEEIq8pFukfgyKpdU04QTlrp1Q
         3PrVlAZgZhPBSiOPAE82bx9FkglIOMPBH2Hf7r3OvNbOW6ozq0GwReiqQl6g+eRl2M4Y
         cfig==
X-Forwarded-Encrypted: i=1; AFNElJ8LuHMiNQC9Vjq/jrTWFXLYm6niuk5e2irRXv6GNZsNbdZfXmtURmyDKnx3H5+xYU7td94NoHML28I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/IUBgDQfQ/5qX9rT21WJL2yYTvWgyF5KuRrqDADiXiHk3pqtY
	mXyroI8oAG+IT9tsK0whJIWARnLj4Kps5ZfJcHT5g/hJQpVI8J037dAVIZ3ehB9TLNoFIfBRmAZ
	GH0rc5pftwQ7mAQ==
X-Received: from dycuc24.prod.google.com ([2002:a05:693c:3f18:b0:307:d71d:34a7])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:fd02:b0:304:8366:7456 with SMTP id 5a478bee46e88-307d5fc3000mr6139844eec.3.1781114973047;
 Wed, 10 Jun 2026 11:09:33 -0700 (PDT)
Date: Wed, 10 Jun 2026 18:09:24 +0000
In-Reply-To: <20260610180928.3093023-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260610180928.3093023-1-cmllamas@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260610180928.3093023-2-cmllamas@google.com>
Subject: [PATCH 6.6.y 2/2] usb: gadget: u_ether: Fix NULL pointer deref in eth_get_drvinfo
From: Carlos Llamas <cmllamas@google.com>
To: stable@vger.kernel.org
Cc: Jianqiang kang <jianqkang@sina.cn>, Neill Kapron <nkapron@google.com>, kernel-team@android.com, 
	Kuen-Han Tsai <khtsai@google.com>, Val Packett <val@packett.cool>, stable <stable@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Kuen-Han Tsai <khtsai@google.com>

[ Upstream commit e002e92e88e12457373ed096b18716d97e7bbb20 ]

Commit ec35c1969650 ("usb: gadget: f_ncm: Fix net_device lifecycle with
device_move") reparents the gadget device to /sys/devices/virtual during
unbind, clearing the gadget pointer. If the userspace tool queries on
the surviving interface during this detached window, this leads to a
NULL pointer dereference.

Unable to handle kernel NULL pointer dereference
Call trace:
 eth_get_drvinfo+0x50/0x90
 ethtool_get_drvinfo+0x5c/0x1f0
 __dev_ethtool+0xaec/0x1fe0
 dev_ethtool+0x134/0x2e0
 dev_ioctl+0x338/0x560

Add a NULL check for dev->gadget in eth_get_drvinfo(). When detached,
skip copying the fw_version and bus_info strings, which is natively
handled by ethtool_get_drvinfo for empty strings.

Suggested-by: Val Packett <val@packett.cool>
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/linux-usb/10890524-cf83-4a71-b879-93e2b2cc1fcc@packett.cool/
Fixes: ec35c1969650 ("usb: gadget: f_ncm: Fix net_device lifecycle with device_move")
Cc: stable <stable@kernel.org>
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
Link: https://patch.msgid.link/20260316-eth-null-deref-v1-1-07005f33be85@google.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/usb/gadget/function/u_ether.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 49ff3fc62f74..91b2d1f5ed00 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -112,8 +112,10 @@ static void eth_get_drvinfo(struct net_device *net, struct ethtool_drvinfo *p)
 
 	strscpy(p->driver, "g_ether", sizeof(p->driver));
 	strscpy(p->version, UETH__VERSION, sizeof(p->version));
-	strscpy(p->fw_version, dev->gadget->name, sizeof(p->fw_version));
-	strscpy(p->bus_info, dev_name(&dev->gadget->dev), sizeof(p->bus_info));
+	if (dev->gadget) {
+		strscpy(p->fw_version, dev->gadget->name, sizeof(p->fw_version));
+		strscpy(p->bus_info, dev_name(&dev->gadget->dev), sizeof(p->bus_info));
+	}
 }
 
 /* REVISIT can also support:
-- 
2.54.0.1136.gdb2ca164c4-goog

