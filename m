Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00972340410;
	Mon, 13 Jul 2026 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957487; cv=none; b=qce+mDuEzzr98EP9OcQXZ5LQ13ADSqzshs0xr+dy22MXboKBDCi3LoEuSzHBHpSCtAK5fmVettQalsA71dzyZa4Go62pHDWZp+UyVBZsuDY5xu99OCZRc6+jwTdHih95co9Gd8/kZlmwxpDkJapynkNebs6uRf3Ni/7GxY8uM74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957487; c=relaxed/simple;
	bh=i2CZTUXEQ3hou/RGOkSypfDwEldYfuj/m1E4ty+SM5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJgzEq82XZDPGKB6w7QF8+RAGJGAvC2DgMTgcHr4I2wRmC2q/WVRAwM92HQC9AjnGBxw5M5CZIdPmxOWCXQIBb31n8bSEGI41u7EtjkfFMfrAuiXSSt7mjPgHpGFsLAz1cbs/C1RyIZRENIXUwAITJPhbSIlFD/6F/96nlTOtTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=pPUDON79; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lQzi46iX; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="pPUDON79";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lQzi46iX"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 554D2EC0084;
	Mon, 13 Jul 2026 11:44:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 13 Jul 2026 11:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1783957482;
	 x=1784043882; bh=kk3oo+cn7S549tlbg/+iWEtaXESiNMv/FlPnN5HZBUI=; b=
	pPUDON7968WWx8qw8R/ihERPndX/LfOI4lAI2XvoYcwi0qLGZBabTYaiY40kVPJT
	W7uNVMep+buX2wtMub5c5w3KhIZa0htpE+TKgZ/4eGIw8Ur6bH2e++Hq2XfQurUc
	ltthzGBMXrP7M3CFDH72rEr4YrLvOMwymrG3B0HaM2i/WTmyaE1o/+ehBg7h+Xds
	U3MHy878OWRwHiajQRB0c6O5m7Ba4l0A3t7K+GbrVmhWoK5JG0EcuU2QWfVmmP/S
	G1LUVDLY0NwPxQrrjWyYpipbhP6UZDwylGdEkTuAwfTnh+1QwZA1Uyyj5uhzxJnt
	A6lp1elKeSXPEDNZliTbLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783957482; x=
	1784043882; bh=kk3oo+cn7S549tlbg/+iWEtaXESiNMv/FlPnN5HZBUI=; b=l
	Qzi46iXTv5KQ9OEGZDv27II+NmoPFbc1gXwBxhjABwuvoW7QbjePYFKqVaRzgU3k
	AHRADZw+fcE+bO4Joa9Uz6dYbOr68r3QoX22aphbw4CxneQ1VxSSDszslfMNlin6
	XAWuNCqhJbkqid7UyOWDIC301mJT9Xn9FGT5pBL1Ui0IBPjzKREVvSfcI4kyP9do
	0Jex7Pg/yNmtcqPnDERG79Ik4ZFPIVFOusjh6Oh+X+O25uOCDN0dCqUe24P4C3Hv
	AC4YO4NoB4L0FE5MNrU9tFpkeBwgg/rZUQ8i2XTDj7o4tYOkh4d45Di9x5+XYDAD
	BGtHMnCqzV/rbnpxPNpgw==
X-ME-Sender: <xms:6gdVagz7wvV822m1IJHYYqI9VqVvNYk6yO-7Pcw65RDWnK2CUo3KVw>
    <xme:6gdVaiG6wYFNk0ivxjeqTsWIBjqEyBPrwf4UmsK2nKH8B_v4xc8cBACpt7Nn8JY6K
    jYD1tvt4H6zKucqEWjvPCDM_ga7GsqyeQS2sjJtwRKaQUfsY7o>
X-ME-Received: <xmr:6gdVaswbYy5L5-Q3hGbrKbhRAu3zjXlsd6vIdmWDI5rEanhpCUNagsMGKh2PKpOBQL5uKYleMoI2TmaivUAxEywyhFFb8Q3Cxg>
X-ME-Proxy-Cause: dmFkZTFY6lH9UbikzGGF+9sTo8UnYKIW62Rg0AFuhhMRxe07csUQLwTQQfvo4sy375h/2V
    Zr/B98moAMOnyZQc0VbUs8/0nQgbxv8BFVIvKwhho5KTzQkAcyd0Vd3LLCSLohNBSMvv3f
    nNZzs+RUmFJ7N3+Jh74cJuWWmgOlbSSRIKuYu4y1cGYLGe8hfMD3YhSXQ9elcHbZpvhVwq
    CnVsURCx4qbz6b3Fevycl3cZxx/tUTnzwkeDlYUn+08SoZotEhtT3huicw7MBejLP2aKkV
    +4GdT2B09kBadJKQMqneWwJoWrlcm0YoXzzK/QlifjeAGuPHj1XuxvYzd+OYapojrw3aJJ
    fbzelQ4YHTAOZuuPQPJXpl4JuHr9O22drgWPOdlsHUBGziw0haqErzX1vcUbnvbuBb49U3
    IvT0eUzg2gYtqG+xHZmFsJI0JzucybiJZKNaEyfXmA6G+3U9iyj/ByhVIbi7wM1rpiHeBL
    a+55DuZM+uItLFBOh5yjhyxKisNn3GROC6wUqg2XkRv6LmJVDVwRXCIy2j3T/sDLPunUv7
    +BIeQAnRq5HqDAKXSTxsG6mXNvBkMk8osMLKhhfZlxgYatuFuWT/yt6PesYiHl7FyFAebx
    4Wu187Oeu6ed1KMH5dlOXt16KC5Rd2xA7pF/N410TQlnNE2jKAluxlm5HqFA
X-ME-Proxy: <xmx:6gdVartr0qE_C24p9Bgq8D_IGHvqVOreynMnlDxupsqRA_9konIibg>
    <xmx:6gdVah30sPUMq0Ibkioy9anv0PEKDb2j11fcr2FC9Fy_Co78cS1Krw>
    <xmx:6gdVau_kkuPUVr9Jwwk83n4o0__TF2F4uGz4pwRweIBETuC0Ernspg>
    <xmx:6gdVaqPGoNBxgMZ8hK1f-pV6oL0lJKSPpZCnl-O3GCOnDnyEn753nQ>
    <xmx:6gdVatvo9Hw2YTCdXLOkXpitUIENUU-vM5r9b8L7QRbgtlKqGGxnRaza>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 11:44:38 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Mon, 13 Jul 2026 17:43:51 +0200
Subject: [PATCH 1/3] usb: core: Add size check to find_next_descriptor()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-usb_core_patches_1-v1-1-7721c2b33f53@kroah.com>
References: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
In-Reply-To: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783957473; l=899;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=i2CZTUXEQ3hou/RGOkSypfDwEldYfuj/m1E4ty+SM5Q=;
 b=RUrgy1yMo0i72Ua1qWrrKQOULEuhroZkV0dOBWGqDGyJw7DO3lhTHZtxCGcQh8DqAoHfxGEbu
 Y4jqFzgRNyKBQwSTrztUwCeTjcgtlQEipkyxffs9SjPvKE8ppwC5C7c
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Add a size check for the descriptor header in find_next_descriptor().
This prevents a scenario where h->blength = 0, causing the while loop to
spin forever.

Assisted-by: gkh_clanker_t1000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/core/config.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 45e20c6d76c0..17c93e95945f 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -29,6 +29,8 @@ static int find_next_descriptor(unsigned char *buffer, int size,
 	/* Find the next descriptor of type dt1 or dt2 */
 	while (size > 0) {
 		h = (struct usb_descriptor_header *) buffer;
+		if (h->bLength < sizeof(struct usb_descriptor_header))
+			break;
 		if (h->bDescriptorType == dt1 || h->bDescriptorType == dt2)
 			break;
 		buffer += h->bLength;

-- 
2.55.0

