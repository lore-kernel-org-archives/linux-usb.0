Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986213CF97F;
	Wed,  8 Jul 2026 11:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508963; cv=none; b=S8GFU8OYOh/OUhIK6ROE4lSekP3GK3vW6u8IU4jXUnqaVi4PIdgkk0lnzqhyVQflgia6AUWpMcg2K2DToZC6Zi/j652r/vgR3AJNFftTuoDDz8jrCsANb4BztQEoHdvsS1xDQDuNF8y0Vxb7hbOf1IO92mjWCj21KxBxIJ0RW3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508963; c=relaxed/simple;
	bh=Np+McgC0sD1WFfUaq4y52vL4+lX5Trsc7gA8hPUC5qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hITxYdcvx/l84kIXHSqhpsMuVq5RvrAj49MU5S1XTEIU269K/3iIisKTEBo6ILIafcUVXifBsK7AW+oFISNe1yZAj1YN+Rj+qYnbujrw8RhpwG/pSNcA3lwAGlB4rsnPk8FA99AiAjaWjkVjhI4ERv3pQkB96JSwnMyj+/luYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=eu9Eh4BD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NSp7kkzn; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="eu9Eh4BD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NSp7kkzn"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 91906EC00C4;
	Wed,  8 Jul 2026 07:09:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 08 Jul 2026 07:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1783508957;
	 x=1783595357; bh=NRTvSfwkBGEcUGAVdljr62+5ju6Pug3Arp4ORIeQysU=; b=
	eu9Eh4BDv+IPrWVLaaIsl1Da/4bTHQHt8prnd6gswiyqMaCBdNoZSkCWP+W2OHu7
	Vi3uEnHXAbiMKgAlSXnWARJHmseq4f0kkXdtSkyd/AVYWFlJBoEksEygTxTlwpct
	mZszI870+r7Ivuz3TlpmkhbOeJqrZWRVzuuMGpdTYUSzpr89noOIT/5uFzBiPCSw
	X6rX7aPJkojs300gxJUBBTNdXuYA0dy6iBpI8kfFnpPEpmFy491BOJzpU5M/D6MY
	1LTtsxTpOALUTE6B/Qm2DrpJMTgobBbOG8hgFed0VEV8prCjH39lBmR5wnVE6wAM
	CzRYjBwfCZLucNd7d5h8pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783508957; x=
	1783595357; bh=NRTvSfwkBGEcUGAVdljr62+5ju6Pug3Arp4ORIeQysU=; b=N
	Sp7kkznX/9AoxjgSY68HxAIeed+4rDX75XAedYq0/zjq6tWePk3mdbtwTQW44caa
	F4TGViPCD7BFGHceoMJ7NvQQuCmR+OPWaBN/Mcy6H5vjwMqxkwgx5+FXb73vxopt
	U/l9kp4QjEfUb+bxQJIZQFRpiei8hhLjegd52ddACTQ+f2sZWqfAx3/Q7cruF1KR
	jTRPC0iDmPomigSTqWNmjZT8t2LK9ws9Ixpt292rGAo6unwDn0PqEWQGNTX9l0Ed
	Z7YudS6DtlOEptKmYp5sdMi4tASD1wc3UsmtYSRzJ6CI3QM0yrj3+nnVWQOl7GAJ
	RzzL6JaDVCBJ3AKpBFkYA==
X-ME-Sender: <xms:3S9Oah_ALT6PrIm_6FqMB-SjACIdj5Rax4hEiDoEndukY8IxIFb1mw>
    <xme:3S9Oaji1ymue4xJQzQF-gjmqjSKYu5owh9WL3Cq0P6__DkIyzMEyb0YnUsVIunmXt
    Cuztyv_OORVaQXiCDFKBIbzdenf_NA52ct-uepz5ZQjQhkvnJE>
X-ME-Received: <xmr:3S9OapeuAFFR53A_O58EcdSc0NSN0Naa1UdBPElGiXKlqrWDSeJ2Fxo5T4hBnrDbJJzyQ7e-CUCNNn_kJ52sqNCg_QBvofr_dw>
X-ME-Proxy-Cause: dmFkZTE1aCyK7zBLmWB5Sqkbbd0SSm1kpYulWaxJJ7KzlQp89Lfi/lwEOllrTRuMRchqSc
    I2eSYjRWK/dURgyadGvaWKd0zFhRbdOZMfJ4R9C5sspgkt7AdXbZb0A18C2iOHgi0aLPRG
    gaEIfBf587q8NdigtEY8HXuStLNZUq6DgP2VZg5oUdpxt6xQbS6DhIJ8l9+3alfRRzNJ1K
    0+tM5+QpfEtqdn8tbu6p7zHspX9q7J+e6l9ZlCvewqJaozpBEHww71/3o3U/+7OlWFQsb+
    52vC6DvnLYeQKXrV+7bJx509rx+CC4AW0gJPPeFfExXRSE8Nb61SGUHi9vQJTf7iSWJaN/
    LAgaETQ/3QfOO31fyrWDLMUiwdeKX9iSYwI1s9DalQJ4aUykYKx5eLEbracoF1CYUR62lv
    GXWK9Z4HxsvgWUfzLyr9dZ7MOdG7I/Wrav+J0yTIIMs6KvEW7GV72/cgZzsdbbHstGtzkU
    ysfBRF/X3hrFLQ0MBgc0r4eak56pFKEeekSpRnGtevh4wiEmzoVQSbTdZu2QX73saekTF+
    FSJc5CSL9FaZ7pXczyx8ceaGHzu+AtRJAnNUmsQgBgs8jX8L17OeFBF92Bfmra8JtYIE+H
    3yh5pXYaKxBJ/ggKYx75p+JNwo/gbrOE32wXgoNWAEhRNP2L842K54DdZ2Yg
X-ME-Proxy: <xmx:3S9OaipO8E0t2rEutN_uXCura6_LsIJsLmcDZ4XujC6et0lSxiYDBQ>
    <xmx:3S9OamAXLhgy_vj5Li31lGUdhN8hZjHerfHDNrs_M6q0yjcGfxTqxg>
    <xmx:3S9OanYaTZzpYbMAXKIzCIeaovOh4qX4vPBCNycDcY8lGab8BF-GbQ>
    <xmx:3S9Oah7bdC7QQ1t4RBbOUBIM-rmiWPFmFxMRYFk4iB0hc2LXIkwS5w>
    <xmx:3S9Oas5SCGXhZZjLMk-74S6p1V9CQ1cRR5wTN4im3jFcZLqgcwA6m6ZG>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jul 2026 07:09:16 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Wed, 08 Jul 2026 13:08:59 +0200
Subject: [PATCH 2/2] usb: gadget: function: rndis: add length check for
 header
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-usb-gadget-rndis-v1-2-e77e026dcc6a@kroah.com>
References: <20260708-usb-gadget-rndis-v1-0-e77e026dcc6a@kroah.com>
In-Reply-To: <20260708-usb-gadget-rndis-v1-0-e77e026dcc6a@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783508953; l=1000;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=Np+McgC0sD1WFfUaq4y52vL4+lX5Trsc7gA8hPUC5qo=;
 b=ncFz+YAnvYLcz5arJbpDtbnUPttym+pKINehpgtvWhIX4LNoaC9z3VFDhnujPDuRyf9kKPRGt
 E7k6Zq8Vd69DDAgcdwbI4/HLs6a025BBnf9zd7/fN7tZZ/KCxUQdkom
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Add a length check for the rndis header in rndis_rm_hdr, to ensure that
MessageType, MessageLength, DataOffset, and DataLength fields are
present before they are accessed.

Assisted-by: gkh_clanker_2000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/gadget/function/rndis.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/rndis.c b/drivers/usb/gadget/function/rndis.c
index fe2018ff071a..a2fd239b7ad3 100644
--- a/drivers/usb/gadget/function/rndis.c
+++ b/drivers/usb/gadget/function/rndis.c
@@ -1080,6 +1080,12 @@ int rndis_rm_hdr(struct gether *port,
 	/* tmp points to a struct rndis_packet_msg_type */
 	__le32 *tmp = (void *)skb->data;
 
+	/* Need at least MessageType, MessageLength, DataOffset, DataLength */
+	if (skb->len < 16) {
+		dev_kfree_skb_any(skb);
+		return -EINVAL;
+	}
+
 	/* MessageType, MessageLength */
 	if (cpu_to_le32(RNDIS_MSG_PACKET)
 			!= get_unaligned(tmp++)) {

-- 
2.55.0

