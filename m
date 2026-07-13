Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6CD3DE425;
	Mon, 13 Jul 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957492; cv=none; b=F5GFeiLiHWdZTIucPHPMdZX0YMSSRxyt1ajqivLVCw7qG5+wrg4WLyr7xgX8se7qWyudPN6XwIe5mML1Ht/jLuqA/xeRK7hB7NncWRx+RCe38nzNL8M/VH3M1OuPEIzO1l7JVRsxSMPvv0sZe65gp3pzo8jOeCT2fz3P1Z1Wdxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957492; c=relaxed/simple;
	bh=0VCccmYDWpK/oTYjIIoywXY3zSry1JDAoxEb1Xrp29A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGtTwjhB1HpJnxwSh0Quxn90o+u5+ZggbS0JwkpI4AAhZdVvYooCnKnDo5k/KxrDUYGjLqwLi+ylFz9BgvQiFyGoTEnuWXtV5kpb6VgPJR7GXgaxJcwLk+a3dqjpikOATDGUWp7vWysOg9GQTcaFxWxpuqO7daAvdRwMOB3wNBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Hq9ht7Zp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=miJoZoRm; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Hq9ht7Zp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="miJoZoRm"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id A2E31EC0084;
	Mon, 13 Jul 2026 11:44:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 13 Jul 2026 11:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1783957487;
	 x=1784043887; bh=zM35qb7+kQwuMuWX0N7MHmQezh7Ps2eM5se/5PKIfDM=; b=
	Hq9ht7ZpAfA3ZCoNjB9QxvRb0TacrvqvrUeM88NLl7toIKZNwJMG35DM+E3geAMA
	0vbK0ZrDFN3fja9DqepjrPiwmVcz3GyljfIPrLubTxT0NVIg6AxRcpG29CHFQWSv
	JULhg3d5dCNlkBuMfDH56LgtcXaH+eC9OnE8CNsQnCI8TBJWv+BRYImXOGCTkT4l
	uDQbxY23J/QGG/YOzrNSFu/yIQcNKl/bN/428pGksxoabt307r3hCqOMSU7r96HT
	NZjorp74M4RnOzo1hDZLEOrMOXUNdjcMtsDGLp5u8FCoahGCxO/hviplMTCipD2k
	e22cb0pciwq4FsF7cdaw/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783957487; x=
	1784043887; bh=zM35qb7+kQwuMuWX0N7MHmQezh7Ps2eM5se/5PKIfDM=; b=m
	iJoZoRmYtZHVmqwm/6/lEX99h6hBMGAbxGKaR7/4BgDB7AqrDCZRX6+IbgDZ0ijN
	9TztdLVVzf/Q6Z8KRWhqFtOJChCgV1Ig+ZXip0KCmytFHG938JR7Ep2CpHQMTFyS
	eLDJw4ZEBoYiaYqiZ6YoSjQEGbMC0nCjHoYY0vxInfJkxW2Svmvutfz8VXsfjxFR
	sVGC+kAaeLCg7DX5eCuzSLanEZTQnHsAvJA3Zc8f+dEjgx3L97OCwpP14kEDALpF
	x12Bfz44xsJuZqkI1OyiPlTEgq4tlQOjjNtWrzm0YEP3XfU/UbV5s6E9PVQ96Fvu
	iStvOb4zp/CIrHIVtmv+g==
X-ME-Sender: <xms:7wdVailI9jwHQ2tje0TAc7p4cx8n8P-3BqvAEZvGqaLBa_BsmWngFg>
    <xme:7wdVanqdnSaxKslDWVBWtotp5e6wqkjlo-wXJsMyvJOlLYV3r3lqc_7s86Q1tXPoN
    ftrGYR7eAoKdjClmFBp5nD6YQiiOtKTRCn1BGJGFISEzV9wMdUI>
X-ME-Received: <xmr:7wdVarHeULJIwrW95Sx_TdvskTL9rCzfHaQSv4vyOiIszJIcnw5UQ-RSGOWfEYJyxesjB4gt5L8vwLbCPaCTqe7ha1bchrpPqg>
X-ME-Proxy-Cause: dmFkZTFY6lH9UbikzGGF+9sTo8UnYKIW62Rg0AFuhhMRxe07csUQLwTQQfvo4sy375h/2V
    Zr/B98moAMOnyZQc0VbUs8/0nQgbxv8BFVIvKwhho5KTzQkAcyd0Vd3LLCSLohNBSMvv3f
    nNZzs+RUmFJ7N3+Jh74cJuWWmgOlbSSRIKuYu4y1cGYLGe8hfMD3YhSXQ9elcHbZpvhVwq
    CnVsURCx4qbz6b3Fevycl3cZxx/tUTnzwkeDlYUn+08SoZotEhtT3huicw7MBejLP2aKkV
    +4GdT2B09kBadJKQMqneWwJoWrlcm0YoXzzK/QlifjeAGuPHj1XuxvYzd+OYapojrw3aM/
    impbtIrOeHO7V9UYoepEwwaCxGV8eOzH6Kr9GScXc/nOrYHbPuGzVablgEvXgENbxf9d10
    M8rHu2w5zoCy+RDzSV1UMbCjHORcyQd2JrV6r9IJo9sFbS49mgqaGVatHvh9YHzmWtrz8b
    nm0Lp6yTFOcrUfPpna9YtGbr6AY3pep6HRNC/A9hTxL0LLVAZZJbrg2Ssu9yBCTyN/TmmR
    OrcSXvRuvprd2lY5FUdFyQCb8zdfIHCxPSufXA1+p9zU+CkP2l3DlQ/M6guzVIGZmTRRbE
    AZTbFMIwz36mzjRhtDE5Q0TsST9ntogrqMQBMbWu577QroximuQ9kKQGX+aQ
X-ME-Proxy: <xmx:7wdVajwlRKxLZLKL3FNBnem6b8xjcIEnprag0r-RWhvvJGXxxMYV_Q>
    <xmx:7wdVagrWsnUCZKP-Y9elbtcs5x77JpSxR3Z4ECCKSUvgh5gNuL6UIQ>
    <xmx:7wdVatgE1-EZZIGlVXI3u-H_1k0tpwHNPBnTo4VQcqcni4DEg2t4bQ>
    <xmx:7wdVatiyGcFcB37C7bweZBWf4-RTdAbTX469EGeCMPWtoK_8uryn_A>
    <xmx:7wdVahh_Jcw6X48ARMa2E09WFbOvs_OL37Bpjfw0GV01l2ICIph5oaCE>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 11:44:42 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Mon, 13 Jul 2026 17:43:52 +0200
Subject: [PATCH 2/3] usb: core: strengthen size check in
 usb_parse_interface()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-usb_core_patches_1-v1-2-7721c2b33f53@kroah.com>
References: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
In-Reply-To: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783957473; l=970;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=0VCccmYDWpK/oTYjIIoywXY3zSry1JDAoxEb1Xrp29A=;
 b=kPJ2Ng6ZnJQMtJFZ5XZ177tHZSOUlppTH+hFSm5z2vunV6Aim7MsiQSIYk8KR234Q4mSLaw9X
 BEnrSF5au1wCYGCy14Cqps/mAHsQWJrajxxDOkJPpyldq/f+/dCaOHl
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Change the size check from size > 0 to size >= sizeof(struct
usb_descriptor_header) in usb_parse_interface().  This prevents a
malicious device from utilizing trailing bytes to incur an OOB read.

This matches the size check in usb_parse_configuration() as well.

Assisted-by: gkh_clanker_t1000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/core/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 17c93e95945f..91a51cedc1b8 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -623,7 +623,7 @@ static int usb_parse_interface(struct device *ddev, int cfgno,
 
 	/* Parse all the endpoint descriptors */
 	n = 0;
-	while (size > 0) {
+	while (size >= sizeof(struct usb_descriptor_header)) {
 		if (((struct usb_descriptor_header *) buffer)->bDescriptorType
 		     == USB_DT_INTERFACE)
 			break;

-- 
2.55.0

