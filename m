Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204047;
	b=no3Ar2/jOcSGB3QuLhNRLdTpgfCjY+m7Gg64q29eJYJMDPug77sIu2E/IOK5Ee9wHOkh
	 rPwzHnA3ZpB35TdB8oxIHy+j+r1CBeeFQb9A7+jPDvfi63hvBFNw0Q/hsK5ghmiLedzLB
	 C9m4ldJ4sOPh761whVdKg2GG8U4HcubB28LOPnssHvHHqx7egOIniLPt36XH1fxYcwIVm
	 mBYNmKsEdgPb466JVfTwFllciIBa+WKeAR2cR2pIDoZHUtGinsdueFjx5veKnCldlSPSe
	 Hsa2hjekDopogNsH4S0elnkCvD0nW/3Vpbi0U2s+ZlHAleXZbNlz2PHcX6OAbYSrTGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=O2qqcHYDrDvU1pi/hGMfNLEpUbo9EQZ+vjwKdO5NYR8=;
	b=Ps4rLie+rHjdVrr84ssgqJ6WlauNmJHTjeCQVFg4pQ5/K+9pHyRYmVfVBIVrevl8ibv8
	 IC2UbkNr4u6MwRTnt7O8gvCGgnbuf/Rc1rPHAZz9Cg/gtjz+3KE0MsgfjfDc8BJjCGsej
	 IowB9xmdtqTIrD9Odgarp9DSr/NcGJLwjpLA4CQ6nrJ69LNOFCiXMDYPPGF+3ECcPQzVS
	 XdM6MYHH1zsku4pDnjrzVNxP7EtIvdklc/R4TA+Ul5PrK7bCJsNej2EUZLHc68xATl/Vy
	 leGTQhsfsIRTWp8aJSUKZQQrnNTV2OPB4BPsxykqSl8iYMddU39fVtC/Hu6ar3u0A7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YS9l+9fG;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01BF606A32A
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 06:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01BF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YS9l+9fG
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a19a2621dso470557d50.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 22:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204046; x=1794808846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O2qqcHYDrDvU1pi/hGMfNLEpUbo9EQZ+vjwKdO5NYR8=;
        b=YS9l+9fG+46AAYn9re7YeusN0aQNrcdDL9x9lKzf98FpH2i43l+V5VveM5jsCARddK
         1F3p1oYdSV/ZX9T9vxZfjNmMZxEHRk9NYGt9hnJflYHg6xD2XxolElzB17/MkbmoDblg
         VWtT4S1C6m1yYFPPPprKV48772ovoUy8IUd3Wa9A+vhUle6M65GVa0udpF4SRQ9T7xgm
         IKpBM7zTFgZs6UvOIsHzHcUNKtBbTDfO9aWYQCYmxMQ6rShFTxd1EqE5zXw4Y9kM93GZ
         lvXQCTDJs6lBNkPpqiU0MAOxL81A8NKo669u7uMWQKglAEFWYgCT/4N+BcCi8pbQJl1R
         gLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204046; x=1794808846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2qqcHYDrDvU1pi/hGMfNLEpUbo9EQZ+vjwKdO5NYR8=;
        b=ho0no3rpNCaNTcuK+/jgBp66nI7MLCzyLIktdkZaES3zL8Ab1bfaAkxvGemeD1dpQU
         35lzqu6bjXsjLDmLNSRa4vVaLQLKq0n45B8QmeFNkSW86v82Bo03aQ6ZQICzlGQAAE4Q
         R9S1XJQcwDrpJ5lcWrFK5HNVl3VkRaHEZ4GkRiQ6E1ByNUQxm/9DsXVx85kAGtVldldN
         7URjWVQEzanS+p7T405vosi32RSvVcRF97AEMlpYm53mt2As51c29ocb9Ns3jiAogBjd
         6V0fhm7qRNuxunSn+myTQwZirDXb/6ClTC6tUcY/4Y3ZL9WnacZiWE+1qra98Syto3J1
         8njw==
X-Gm-Message-State: APuU4Z8QSzqZSxn6T0JlRMMLt+WYzHf/EtFq63uFaRYUl6+1Ah2Vl9gp
	saAfd9K7KA+ni2Dh4VqMT9UdgoAu253+2+gM1c94dvA6AxFisbo3lXABqYMTCkTw
X-Gm-Gg: AYBFou3wul+RzGhKVeL+M3eXPRqhABKUpxdJpCRhHPdoQP/FhjjkoDsscMB+uKOxYhQ
	ncWGSzleJHEz6LzqA82sbbGFN/VKY33MxdB1AyeHVqxcz7Y1aBcEc82lGnM21MrxjRLrit517kT
	FJBPZfnr92tWDKS8wO11yjCKLUJzuBMidVj7edlsB+MSiqdglQMIXBtAbe8NCvaQ00B3/dS8k9/
	DEFL7u5Xw6yeO5vY7C8+XTIYJOD95/B/WgnJK7GfKUidRwrNzcEwU/jpV1LXekV3YHbS+id02NI
	j3xsdM496YuXKLvHI/EqHOmeaYSRhZVljhxROKEryetu03GVBfS0vQrB/Uqe9sklZyBXf7A6sgK
	KmsErHEmzXFaMHf1D+cbz30863N5IWSja0r1BqntIhD+gbn1jImke3JHEvLyiS0Q9WgvrEWzk90
	MmEoovbGzPPpl6WCQw+RM+MflLA8vnD5B/kkPjoGv3TpF5whfzbK9yHA/2qfa312tX6d1EJSviE
	8P6JJ9p53qPv0tWVe22vNLYqrAe7r+DZOhK6CQFWlzCfyVDcViuI/JX2UT9QKmZtp3HLD3eqGdv
	AkR42Y9Vi94GFB2aHHCwMe8qD9VkPGjI0ZRlVEA6YjbNYurCiUBPctlv2PJ2AvJv1MY5C3r6F7H
	yzodbDQ==
X-Received: by 2002:a05:690c:92:b0:8b3:2d74:af96 with SMTP id 00721157ae682-8b36cb326e5mr20160367b3.67.1794204045641;
        Sun, 08 Nov 2026 22:00:45 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:f9f3:ca9:791a:3a8d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bc43733sm28628607b3.33.2026.11.08.22.00.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 22:00:45 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	nkapron@google.com,
	gregkh@linuxfoundation.org,
	khtsai@google.com
Subject: [PATCH usb-next] usb: gadget: f_rndis: prevent double-free of OS descriptor table
Date: Mon,  9 Nov 2026 01:00:18 -0500
Message-ID: <20261109060018.71063-1-xinsheng.zhu.ny@gmail.com>
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

rndis_bind() allocates an OS descriptor table only when
cdev->use_os_string is enabled. However, rndis_unbind() frees the
table and resets f->os_desc_n without clearing f->os_desc_table,
leaving a dangling pointer.

When a ConfigFS gadget is unbound, the function object can be reused
for a subsequent bind. OS descriptor support can be toggled through
the ConfigFS os_desc/use attribute, which determines
cdev->use_os_string on the next bind. If this flag changes from true
to false between binds, rndis_bind() skips the allocation and leaves
f->os_desc_table pointing to the previously freed memory.

A subsequent unbind may therefore free the stale pointer again,
resulting in a double-free.

Set f->os_desc_table to NULL after freeing it to prevent the stale
pointer from being reused across bind/unbind cycles.

Fixes: de7a8d2d534f ("usb: gadget: f_rndis: OS descriptors support")
Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/usb/gadget/function/f_rndis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index 7de1c5f8e326..b9e4dff9a12c 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -949,6 +949,7 @@ static void rndis_unbind(struct usb_configuration *c, struct usb_function *f)
 	rndis_opts = container_of(f->fi, struct f_rndis_opts, func_inst);
 
 	kfree(f->os_desc_table);
+	f->os_desc_table = NULL;
 	f->os_desc_n = 0;
 	usb_free_all_descriptors(f);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0 (Apple Git-157)

