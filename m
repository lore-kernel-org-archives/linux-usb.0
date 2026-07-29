Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBCC42A167;
	Wed, 29 Jul 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785349336; cv=none; b=h+jrd6ZhqgOn0ylUWwcedQHeba0sxxd9fc0k+YJs0OtqB7gLBXVX3wzY30NhiNw4jR9iQB21Jauaq01kSpR2HWP+rupx6XOG+Nzl4A75hgUS5x/leBywoBHwj+qygSr5h62UDAmuB+Cg8H1WnjkrIiGcA2mvzTbRsaVyOElU0lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785349336; c=relaxed/simple;
	bh=5cSXMBpNs9hBevYPQkRTR0vcasVAI49hQ2TlwfXMIPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3zQLnddhOVJzwW4UDut//zzegqJYCdvAW+szihnkI4woFaeW5/9NOWCSx1E4C0zECy4cxMgp69Ys0CcEtJH8nwK0vFPlM+HEo75X6EK8cTCgO23BVIeeg6xtCifWpCT4VZS0e9lXm/GlsJ2MDLtiFe2ssTwT02HHfouaZnSQds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=UFV5uMKn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=crYwsjAF; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="UFV5uMKn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="crYwsjAF"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 9F0F8EC03DA;
	Wed, 29 Jul 2026 14:22:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 29 Jul 2026 14:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1785349327; x=
	1785435727; bh=tCEmIAz+T4auu2wA2WwOK9meBHLzuikBJRdYB1aASwc=; b=U
	FV5uMKnEv7rYugkv1YMckEnKoDUIY6oI1KRDqkT1Z7KhYgbaDpA0zAFcaO+gUbxu
	DhvgGHKPMj1qEevsiu1OvuQAJ7AxtXrDMBRJ2qiXii48RjjEzPv0cUDYoA+ABi58
	eD8FvkMjXscd8Yweu8AwnYxSByBTm7uesabRJ3yU6K7T1UL9cHDSDxRdTJpaulyG
	4vlN8RRbxbBGyCNrtpryTvJyPUafmHxFgoHMHEn5oLfRU/Sl+RRV036/6hWrI1N+
	WrfrmxOLfJxNC7KkoyU08CLn3zvg0vMiULIGsWxjh9dGHxax9a854abERwmeDvaq
	wrRkzUAF8F1K2HZUQHUNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1785349327; x=1785435727; bh=t
	CEmIAz+T4auu2wA2WwOK9meBHLzuikBJRdYB1aASwc=; b=crYwsjAF3/6SiFJwS
	ucNW0UGwii4TvFAOxXNbWhLl3oenSewmIdrnkQYvbiVyNpNyCLPRHQBomb3wlPcF
	gkIpol5tfUZrdJMZ54RVqiNgUBNIo24v0huyAGoiRNlXqTEhnLoZlIgqPQXEBX/M
	BQOkFZWHYCB219PhjOJ+DM1XVolnWlj9chuO+a+1RXi9Ms7/s/s2y2sR+4BAXNyO
	VtQWHT2nKJ4D69A2P44+WPCXyYpa12typoKbxYS0Y4xuSgLAmo0ljH1N+0qauzvk
	0bNb0D8n2eLw9LkEZPpDowqXExC82Jeg/Va7KIgKkXKwapAI/elwwD0A833LclWH
	R0R8A==
X-ME-Sender: <xms:z0RqaorO6OYD5xqizRX-zer8tZv9A2FMLDyFJlyxqBwXcbZUHgstSQ>
    <xme:z0RqanlG5JEC3Bfj0lLEe5_R8Yd9sb5e48rkgWZlCkcTnTfMhznq5YKv-GCJLnnB0
    y2lYBcBHCqim9fW1HAvHOBzxoSx8tZ7OYY3LZO8YHFSYXvMe-jPAu7S>
X-ME-Received: <xmr:z0Rqaoz_R3EM7T_qK3Tzvl8eKlP19BbrtbbNHgxBdPhTvu1dh4hgAnhYYlt7Hz9RcfrB5A28nCH-hJ5hCx5cvV8ojWI>
X-ME-Proxy-Cause: dmFkZTFHiOXOxwS7EouX3+qGwFjKCeONA2OUndrVtvrYVGsNWNqitendXpCmpVcFdgUFTo
    3sPIeyEHcqALZpXKuaeJXQZ5ZEXeEMAQNQa8PXv8eVk/ZYrjNhL/bvc70/C4c9Tpvqv62s
    TxFtmaeBcbPDfOzsMJCpdJ1h8s3yV2MmxhjQUZkIn5t8urVNHlrDhp4RMxrlE90tLFdGjs
    b40FkAkep3iMKVPPkzGythSetNGFrK7FAM7/YX4k6jfCfF9VZAN28cBQl5Coa4aq2q6aPF
    qCScquYaPfEQhnPcqVbuNJvrgt9XkiTqZKxGW6qqa/N2x4DVi1mtL5gDRMkXI0T1Gf7MT7
    7K4VpW8mpQhDRLjLFafnLgIsDlqhKz4+5gMmoG6tbY9AOur/jTC4wSSBsGpcxODzL/Qm/3
    zq7ZESiz4ulqZZYlVpL8V07olaDeEgeUF0fo7RVRJLKEplQj7QEWqKWkOYUU0cLTMDv2Td
    v7mVxccysojx/b6AvhQui7724tivFRfSz7nn/mgwfaaSS9uv8LagKilwvxGu1R7YuEcNAW
    2CYFIv9BlF6bG/Tr6UmLrqOFv5oPSkwGd+kcNiByi+w/vD1sSJFOmdA/zqqKxjF6x8mAxa
    bP6dYWfTBKRBD6DD7p6lGTEabmv/Z0AcaBg7ptNozicrd580m62LOcz4o+Tw
X-ME-Proxy: <xmx:z0Rqav_XwN8d23y-PWnj4G5MP02p3-9CCbmKAd_3lfe79-FrsG3Gmg>
    <xmx:z0RqakJsAhGZX7Wr2u4ZFB_d3M6xuQ_RIE-jcngh0VsK_5dHkdKmoQ>
    <xmx:z0RqatfTEFiQHBQoX6oxyje39W_z4x7xeW_AlgveuwfeG6FVuCHsew>
    <xmx:z0Rqar8rJ8Bb4byUFB-ZKqUMQaOY0mw8jl3o-WfH5OSq75ceXyr34g>
    <xmx:z0RqaieBgQ1nadkojKTD1HYpSdmEVjN3op96CjAS7eDKyLwVqIykZfiG>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jul 2026 14:22:06 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Retry if notification enable timesout
Date: Wed, 29 Jul 2026 14:21:50 -0400
Message-ID: <20260729182203.3667583-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found on Thinkpad E14 G8.
When UCSI notifications are enabled the FW does not ack the enablement
itself. Future commands will be acked correctly.

If this happens try enablement again and confirm acks are working
correctly.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 49f1c53721bb..ea25c44c2850 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2082,6 +2082,12 @@ static int ucsi_init(struct ucsi *ucsi)
 	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
 	ret = ucsi_send_command(ucsi, command, NULL, 0);
+	/*
+	 * Some FW may not ack the notification enable the first time.
+	 * If this happens, repeat to confirm it is actually working
+	 */
+	if (ret == -ETIMEDOUT)
+		ret = ucsi_send_command(ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto err_reset;
 
-- 
2.43.0

