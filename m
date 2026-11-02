Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793578284;
	b=5B1Na4d94E3nCPFcfogHtORuQyA0UorQUmxSefLHlxN5kW6zpMJJQ9qwlgYYNGAfGOKZ
	 UOif9ShoB6y3/cz+j9tbogyxdzeQlrkIO3v42xjjRWqh4Rw0tLENgUPfiW6G5XIZjqg6F
	 7LBpLqw74XeF+HpgsWrkI5AzLitNM8PWKpERIuF6+2+mFmkB75rKffQ365Kt827QtzDhc
	 ocTzagfR+oAHltUtXKg5cD0Os8Lk+kzfMUJfWhpG5EFc/8VlEu8mFMJMmz3YoUQ5+V5oD
	 mxghWiYFF6eHLastkw35zXmBhj5M0/o4UocNLiJ2fsnZ2iULfbdsZbNLUOeAzKUpjyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793578284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7VWjf8n3WvDFh+c5IGrcgvXEjMEwnWf0FFeeKq0U6ZQ=;
	b=AMUTgpzWDLVAAq+eZZV5pp4k6hlQjbCpP6WxoWFoizI2MnBnK5qSx86CYOB5KnlWi6iX
	 YuU62nnUZZCyBQNlbbysFJ1wfa3sA5io17oLD2UwhkE2gAboX1JVriVWXQAn1nvLDWJT3
	 1WPzH2wBPlJ1jtQv2dXlnF9mLjkBtiU74jmHTxOWrgCPainFg264jAVKFXzoMQIyVCK71
	 qhOJa9ROlti5TqLiDH3dxAily+FvPN5PypPwc7XMN6apYLJjsGAp7Xr0e5oukfCXwVqxo
	 mgim0qEy2Tk35ANAs9uADJ444C62w0pw4Mr/EOpSUYTG9TiwyDYh5u1zF2dc6rvpnzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKfEHFCL;
	arc=none smtp.remote-ip=74.125.224.130
Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8738B606A32E
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 00:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8738B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKfEHFCL
Received: by mail-yx2-f2.google.com with SMTP id 00721157ae682-8b0fa446a94so7788957b3.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 16:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793578282; x=1794183082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VWjf8n3WvDFh+c5IGrcgvXEjMEwnWf0FFeeKq0U6ZQ=;
        b=PKfEHFCLO1Pa2cwXivsCSQUdhT3MH+Xe7A3u+cpoivfmVBg9GYcp8AE0qcJZBBGoDc
         bam19pUfhjf2sypZHGXLnDnzzLLFkiHRDJ2JrbFWIBDrnMU8+KLHlbvlac6gBqGpS8PK
         VjTIPr38Ne1OrzcRdeexT9SZUpjf9StVawHOIAsvPwBAPD178q4dfSjmYiT1V2HeuNDv
         wMqt+T292rulJCMlY28IbN1LdqKuqRCbmtK274uv53+uYBQnkRGOK/+cOAZliSvqw2Bu
         wO+bk4An1XRZmuugQaTUteNyk6uz9rZCdAuNmi3JnnYXV49oUU86s3kt57f56JxxabRn
         OjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793578282; x=1794183082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VWjf8n3WvDFh+c5IGrcgvXEjMEwnWf0FFeeKq0U6ZQ=;
        b=1L9AaYdMqL1cuGtCg2jWzk86rQeIZLCk8p/dKc9oEzAmY7NzGC9QfSN8fYoXyF+mF5
         cnTx1hhKEdysUzYK2pEVSoRW7NrIqb/7ZRDbslQODWy/uq7BXEBZPNsiz0RR8Vzsk255
         54ifaLgdfKDKRWC/rBGY0P5VqlvN6XxE8txs4M+hO71oL61kzLPkvfHsXUokD4ENDFi/
         ehIGl681oT4yf3fBQpJmOPnS1+AgOQ6FtVb4NthE/EnvK9GIXh2lMODRZ2PbE+9V+mmn
         qaWIBcykuGZg7S6XMA7BlUSdg0wPnE0awe0dY6IIVEXz4IMkGm+/+dWwUJTBFbZ0x/La
         5Hxw==
X-Gm-Message-State: AFq9FYJ/fHV0R2ioSyslp/pleHfruETi9jN4QaiZHcDgsMAqyj/plQdp
	sFHBo34qwt9R6XbMEho6X0UcfsyYHN09q74D513DrtB/Erbe6Y5i3CR6
X-Gm-Gg: AYBFou2a3VkTEAFYGlpq1EzcpXrjzfAUch0glO2CBgtMesTKJUTZ3Z63tWqANh6S0Vb
	NE7oOkJrj1KXm/CeDiqm+Caud8NdZy33UtXg63TkqlrldZ03JHvcaCKjyaRJzllFHrnDW8ZBcMc
	SHErycCtPIUfV4TZFh5U88MOptsuMWnJFgpwvmXCb84cgd6Fy1ER/VCRYzOCvDLNTFwin6t0Yos
	2H87IZkp9xE/s/KIFLeKqMf4INFaCjWdynRUNyeJu7ZKtqNBs9ttnYi0dXPZDvICjyAmUHm9q3j
	8ZtlChI6UWZ1Ot9W0Wmkm0s2UUkjM4kiGPwB9Awc74XpkILyH+A+2bnImUAJKj41h5wYWK0Dv0W
	vF4CRyx3NCLkabNmk0vqzyHnWFkz03aKcsjviiHCFZSOhfFmA7V8XfEzCB57cmhikmCr7+2aP2w
	qTrkv2IwxzW5WEei6byDsvq9FdcTa4btHAJeZQsfZpa/raOnXZPrw6yED/v881Pv8flumdL8HP9
	jn3Ko/U3lkk+GeEwFZEs++ByMReKqntqhKTmf3SYqc+zug20YRVcgLz8djn32zRvVT18HeaAhHx
	/wEbZ+JdP1tBZraAoY3QPmFfswusLDnt/XwNzExbpjJUB6yMx9bhndC8X98kpIBUwDY5mAWS0TS
	knl+EnrA=
X-Received: by 2002:a05:690c:6e87:b0:8b0:ea29:c543 with SMTP id 00721157ae682-8b2b658dfdamr48293017b3.10.1793578282295;
        Sun, 01 Nov 2026 16:11:22 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:90c2:3933:d321:134f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd57sm43161587b3.23.2026.11.01.16.11.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 16:11:21 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	oliver@neukum.org
Subject: [PATCH net-next v3] net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
Date: Sun,  1 Nov 2026 19:11:14 -0500
Message-ID: <20261102001114.38144-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
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

usbnet_read_cmd() returns the actual transfer length, but cdc_ncm_init()
only checks for negative errors when reading the NTB parameters. A short
response therefore leaves the missing bytes zero-filled, and
initialization continues with parameters that were not supplied by the
device.

CDC NCM 1.1, section 7.2.1, Table 7-3 defines a 28-byte NTB parameter
structure. The pre-errata structure also contains 28 bytes: NCM 1.0
Errata 1, Issue K.

Require GET_NTB_PARAMETERS to return the complete structure before
continuing initialization. Return -EIO for short responses, including
zero-length responses, and preserve negative errors from
usbnet_read_cmd().

The issue is theoretical and was found by manual inspection of
usbnet_read_cmd() callers with LLM assistance.

Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
Changes in v3:
- Target net-next and drop the Fixes tag, as requested by Andrew Lunn.
- No changes to logic since v2.

v2: https://lore.kernel.org/netdev/20261011035150.53315-1-xinsheng.zhu.ny@gmail.com/

 drivers/net/usb/cdc_ncm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 19db5a668dcb..5715c4bf732f 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -524,9 +524,9 @@ static int cdc_ncm_init(struct usbnet *dev)
 			      |USB_RECIP_INTERFACE,
 			      0, iface_no, &ctx->ncm_parm,
 			      sizeof(ctx->ncm_parm));
-	if (err < 0) {
+	if (err != sizeof(ctx->ncm_parm)) {
 		dev_err(&dev->intf->dev, "failed GET_NTB_PARAMETERS\n");
-		return err; /* GET_NTB_PARAMETERS is required */
+		return err < 0 ? err : -EIO; /* GET_NTB_PARAMETERS is required */
 	}
 
 	/* set CRC Mode */

base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
-- 
2.54.0 (Apple Git-157)

