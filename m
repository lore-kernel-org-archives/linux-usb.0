Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98893CB8E6;
	Wed,  8 Jul 2026 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508961; cv=none; b=Ci9GH1QwkwOKi9SqeOcSXiBGAl478ZmBAPRSRi5vyPM+RAwU0XLQYOV5VXpm/BMi5bQr62eV7TBtXGBKMZUTYwPQwvuNZYzbPmv3i7il53wCjrqvdZnb7XXqq93JOKuU75mt8vzYLq+TvUxQH5QzVNIbWoSrArEGhVUHn+Q8Cjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508961; c=relaxed/simple;
	bh=qSnpeiV9iw337dLNPTsKq3J4jDomRf+T26wV9gNUbcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fuCim8ALSrS03WWbcHYu6O39kVTeTlrvDf9IZX52zm+R4xV7nG4MwahB4dX9LPsOsISomEiFu/TfWzw8O406paTa2mPkqDhuiTMRl4RAMQ0weOSKdRTEiWCow6lRkMdqqulGbl7347dCTacQMsmLWlj16+GDN4sMaEIufg917Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=P23QHUzu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oqfYpH5r; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="P23QHUzu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oqfYpH5r"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 9E6A4EC0125;
	Wed,  8 Jul 2026 07:09:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 08 Jul 2026 07:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1783508956;
	 x=1783595356; bh=ywKLHS1ya2Tp16JTNI1vjeftQff6ooYldMkRKhITw0o=; b=
	P23QHUzuR2ihkB+OhY6nr5zwQLVyfhKlDtNxJnbKCNpZXEXH8qlmTRZWZy2VxgFu
	wcAzVY9Rl/SzGhTvZS1GbQHzm75z92eEJeaVhAM4p3jdpBwXfKOfbPD1232q9KBV
	efK55oya4OwSg4x61apT0Vv2dCto6TcTRCSA2eOkTu7I59lSZsacDkz4g0vaFwi6
	Qmbs6h12RaUutZOphqaH3S+tYZnkCVjVY+DYqDuOi6L6KlSovES4gB0GFPlLx1OX
	63f62/M84UUQ2vAsmIf28+8+3Jg0rjp3Avd6Bpw9iMarDXGTEQEEmhTLrcHHwCOi
	hOdM+KcUv1hxelgGrpOyHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783508956; x=
	1783595356; bh=ywKLHS1ya2Tp16JTNI1vjeftQff6ooYldMkRKhITw0o=; b=o
	qfYpH5rlOFJl7msDZUMOsZMhm03kzMljzSukADVxlRWE0K6aBEBRLe9ql9PzzkMe
	exTcpwcvyQFvIAyn2KQAqktosdCyXM10yyb9TRRY0SQadI4rpTdwqy6FdlJ3fSmO
	ttDm53Ujf3SF4tRjE7BLJXSPgVcFgentkAbre+n9Rolx4MKgPxARBzCoioGgRaq+
	ggU/Gj5YgASD9n8rIrl9urt/Z8vSpcNlSTlkvcED8nvg3ePY6WS49FGgfpxmlcKR
	kRr2hm8Y5P7ROTiZYT6hgjuYX90AZFeTQe0KsI0BHZbJwejRje3ws7v79UtrImNR
	gfXYz/5bG4vXIVGsAP3SA==
X-ME-Sender: <xms:3C9OavfCQC2fndoGCnKSmNEwBVNqqpaFGOrYGhlSlUE1oI_69E3YRg>
    <xme:3C9OajD7kDp8XULICaHfCCQ2k67054IRXcNFsgPYBIn0rCxEWLhDOivjyEl59Vh2X
    fEKBbGfph0YIPrMIY-3KAjtkunjJwrpvuADrihrBOL8yXs5w_8>
X-ME-Received: <xmr:3C9Oai9J6Q7YsE3lMMQ6W5PjVlwUs-ZnJjBg2R6YY4YU7w8R4maVRzZNMynOF0rRWeJ1Gfn40IhrIjCYkEPatWes2rO9woBpcg>
X-ME-Proxy-Cause: dmFkZTE1aCyK7zBLmWB5Sqkbbd0SSm1kpYulWaxJJ7KzlQp89Lfi/lwEOllrTRuMRchqSc
    I2eSYjRWK/dURgyadGvaWKd0zFhRbdOZMfJ4R9C5sspgkt7AdXbZb0A18C2iOHgi0aLPRG
    gaEIfBf587q8NdigtEY8HXuStLNZUq6DgP2VZg5oUdpxt6xQbS6DhIJ8l9+3alfRRzNJ1K
    0+tM5+QpfEtqdn8tbu6p7zHspX9q7J+e6l9ZlCvewqJaozpBEHww71/3o3U/+7OlWFQsb+
    52vC6DvnLYeQKXrV+7bJx509rx+CC4AW0gJPPeFfExXRSE8Nb61SGUHi9vQJTf7iSWJaP7
    7vWhuVGx0D6pQyUqFtEg/kakYXifdkiICcXJxiETGioBGr98y8UbXFOq7TZQdZDlNKpjin
    KXOjOA7c90afYu1t9rRPN5d/t/F+Nuz8Wt3vmxf1+xfimUCNCpfRdwOGLaPXxYSqnMPSdL
    Ldu8cWJ2Gks74Gfy9lcvUVXrIbRNLvfoEersthGKG0A5ku57XDlC0aXU55CMzxYPGXVfLl
    TqsQ3omyEnkvaQN0jDBbnQhs0XnhyE2CVuSYHNWZcmK9lKjj89VMPYpD7aBF6O6MEy7l8Y
    RiGroNBbAN7oG3oog0TdQkElduoJ4fq0OUz7hVEFGKx8Dl042Z0G9ZUayRFw
X-ME-Proxy: <xmx:3C9OauKw_njeiTcDhl-7loifMtDdGiFAuUSayiB6pGNP6Va_Ybg_LQ>
    <xmx:3C9Oarhvn-tYWIvkuvIARFYEt20AhhEeTT2c4hjuoqmwZ0bxQzBoQw>
    <xmx:3C9Oau7HDjrgXXenXrfehOVK9ZER0KjEaI2god5mLQnrINsHhrL5KA>
    <xmx:3C9OajaHZVbqgC8r47avUvZFY-IHo4Tg_TnbzLFBgfJIZG_TdytLSg>
    <xmx:3C9Oaqakp11DJWhPRmFbOI0Isr_IDPE9Bm4Kr34oVZcWAxyLVWidIanc>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jul 2026 07:09:15 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Wed, 08 Jul 2026 13:08:58 +0200
Subject: [PATCH 1/2] usb: gadget: function: rndis: add length check to
 response query
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-usb-gadget-rndis-v1-1-e77e026dcc6a@kroah.com>
References: <20260708-usb-gadget-rndis-v1-0-e77e026dcc6a@kroah.com>
In-Reply-To: <20260708-usb-gadget-rndis-v1-0-e77e026dcc6a@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783508953; l=1927;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=qSnpeiV9iw337dLNPTsKq3J4jDomRf+T26wV9gNUbcs=;
 b=lMNmgBsaqunPDcsHkjeROBNaGeQZbLFAWJ7o4YvDDxPCczblSnB+9eXxWe6itWtRMKiFAUNyj
 ZHKxo/VvFt7BvJ7s4mFctuBrwgwrEgkfqZFYskS1jv6Ry1zqnDcTuct
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Add variable representations for BufLength and BufOffset in
rndis_query_response(), and perform a length check on them.

This is identical to how rndis_set_response() handles these parameters.

Assisted-by: gkh_clanker_2000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/gadget/function/rndis.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/rndis.c b/drivers/usb/gadget/function/rndis.c
index 3da54a7d7aba..fe2018ff071a 100644
--- a/drivers/usb/gadget/function/rndis.c
+++ b/drivers/usb/gadget/function/rndis.c
@@ -591,6 +591,7 @@ static int rndis_init_response(struct rndis_params *params,
 static int rndis_query_response(struct rndis_params *params,
 				rndis_query_msg_type *buf)
 {
+	u32 BufLength, BufOffset;
 	rndis_query_cmplt_type *resp;
 	rndis_resp_t *r;
 
@@ -598,6 +599,13 @@ static int rndis_query_response(struct rndis_params *params,
 	if (!params->dev)
 		return -ENOTSUPP;
 
+	BufLength = le32_to_cpu(buf->InformationBufferLength);
+	BufOffset = le32_to_cpu(buf->InformationBufferOffset);
+	if ((BufLength > RNDIS_MAX_TOTAL_SIZE) ||
+	    (BufOffset > RNDIS_MAX_TOTAL_SIZE) ||
+	    (BufOffset + 8 >= RNDIS_MAX_TOTAL_SIZE))
+		return -EINVAL;
+
 	/*
 	 * we need more memory:
 	 * gen_ndis_query_resp expects enough space for
@@ -614,10 +622,8 @@ static int rndis_query_response(struct rndis_params *params,
 	resp->RequestID = buf->RequestID; /* Still LE in msg buffer */
 
 	if (gen_ndis_query_resp(params, le32_to_cpu(buf->OID),
-			le32_to_cpu(buf->InformationBufferOffset)
-					+ 8 + (u8 *)buf,
-			le32_to_cpu(buf->InformationBufferLength),
-			r)) {
+				BufOffset + 8 + (u8 *)buf,
+				BufLength, r)) {
 		/* OID not supported */
 		resp->Status = cpu_to_le32(RNDIS_STATUS_NOT_SUPPORTED);
 		resp->MessageLength = cpu_to_le32(sizeof *resp);

-- 
2.55.0

