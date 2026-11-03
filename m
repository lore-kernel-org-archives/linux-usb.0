Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704914;
	b=xDL8zLhF8pnZb8a1F3yTrWZrIkhwZ2RLK0sKbwXK9wS3VeOY2qCUieXwp7B/PKH2BBPo
	 Py4aMYcHy9M29+K4dfGUz7imSmb2Bq2kfMjjrpRRvOdMOvyGISrJfdUt/KtlURVDTBnUG
	 s/n1iIJ3vCH6HWXzDKK3bdSkBvvEc6Ij9K5xQUeGD6HvC1CK8XGmh+Tgad/J+dxsTugys
	 DwaurRabDmahAeVqHm+i1wu7O5cIYiZ5bHXs/Uo2ywWUZGxTUqFN9ZVWMHdJEQlxdjMkl
	 XT5CxKTQD6hAkszegkLlc1qYdqDUNEMXTv49TK6UvM90npfkAW3TBQFuZGI3yeX8d9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sCcU7tw4sqC8FGz/5EeKsU7NeWYyAMpMaMD60H7GVXY=;
	b=B4CA8GNcCPLbPYYCMvCAYOdBVX1CgT1pEuNG1o3S2At88Z673EvUcUmTQVW8hRP9c7KB
	 Wwt1BuvhreLw0m2Qrmt4rO5Q8BUH2sDSAb2vps6Ef1CbTKbZr5ktc6Y2+WIrs9qkmdnD+
	 cJrIGaLFKab5IQzhvPN+j17X4mf/hUGANReY28RN5mAprPp8O2AVC3ShpgeVN8dASgje3
	 /ZiDqLNKfuMakwevDJpgdP12oNHIbaVUA1tU0cwJpyCxdHzgH/C5ygqz+lanPIQlTK4ol
	 FdeDUlNiE1PAcQWxce9YrOR8EG87HXARWWybBvM4MwQ1bmbf1ZBx3HwZZq94pVbutAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=JfFpSO0w;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8F606B139
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 11:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D8F606B139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=JfFpSO0w
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32850565e9.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 03:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793704912; x=1794309712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCcU7tw4sqC8FGz/5EeKsU7NeWYyAMpMaMD60H7GVXY=;
        b=JfFpSO0wp6t3A87HA0Rifqg/jTqpsx1lcLSzR1cQGO124+8hrzhv+YXJ1uuATdbaqV
         wxvKxH9VFJr9P8tOi3/aLcGX90ykNEnw79qFrpENi+/yNsIgTbUXkGJqLp/WvcIc2R1g
         1zAeOIcdOzx4Grx5XaFhumQlkNn8CnZ7Ae1jMH9iGLCQaNCVTeJQ2mW2ecTWL7OatjMo
         vYkkzI1Vcn/yIoC0KmFMWraBU/Mp09ix0yqqUsKFoiK3lCLoDW95jo+/QalL2yI3/PYH
         m4Cl0Ox0FZZPtdhImDVYw1uJmD1mqlizNH4QdekZY/XSae6kMbwtc+hY7e6TmgBcUW0b
         oTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704912; x=1794309712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCcU7tw4sqC8FGz/5EeKsU7NeWYyAMpMaMD60H7GVXY=;
        b=PHAW+1pDHQORFJSYQDewyEf691mVPYGGvXGZlOO/YKntBeZkRo+er6zFQRLVCR0FE5
         Ji3ZpSOcy/ywpyRLAWzMvxVFRadti54tcZHwPCR0C9RYjNWHNXCOcLVjChsvCioSm/75
         hwnqvvmhzvcOgyzn/ZSCJEdUcxKOMJBhEoceXeJtHfjnfQcNtCII/52Rzb+ha7UJbojv
         nap0vjQme/I76XbpVzvtUaK1w+hdcTy8RJKBPvsji1aGkEO+crGm0mhoVyhiGM6uxPEh
         EAGPQGyQ/sfnh7r7PPlgLlZw/Ibplra+kqVxizlTV4KnNgzxkT+uCKpArw54qKadJyR/
         Ad6A==
X-Forwarded-Encrypted: i=1; AKwUvByFoIQXOlIPWITgUYEZZOLIQDbuPNtE4bKamunQu0Q/E9D9p9L3w3pERTIF5e5gF6N8y/vPdv6c3RI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ki7l1iRC1LdueOAugSQ8zgSX4tT+1cJvtgDdaMW4Sl6UkpXOy
	c8vCL+XDu9UlwfvW90RdiOjcwi+miXxJlZEWQgDm7M3aQYd86+ZiyedpcOTUTHs7UjU=
X-Gm-Gg: AYBFou2dEsY+w7cVC4mjtHULpDbw8qGyil/U6WMVXUPEBmu0Sj8a2jYiXAhFefCrM/K
	3fODFj91a5H9UggmNn8S+Mi0OlUw2/uw5Shu9kvU5ta8QTl8ENXoWjEAM1nojmTQlcT2GdxXPd3
	h7VEXxN7wwcw6SkykeP/AQt/3eIhefGum+8w+h67KtlBWQ4ChBkwzuJZUH4rrBs+rPyf8ee8qW3
	G8SLCFeaB6zr5gknp/TWY573tbSmxypzkBgx/PAaf1Tppo6/37SbHBU5DyCV8YAYDm8Z6AK9BXl
	uAu1sXiYzOg0dFPPqcwJ7K1OcEIrCicLEzyEXKT8vNVlfJfQnA71tse7D9a7ymRpODHKLxqFgf+
	WPKZgv3XjoOdWI99RvkoKqxadGoEbXLEarj8Uf39+XotEtWx1vlhND8TOGO5yiGhBXWZXWRmq64
	jLaSCfiU9RzQehacbyNb+faCyDGxmDK7I1CdQLPBW2VzLTWGQtwZd+vYbTENPxsT9kpjiQ2gt56
	YK56Iddls32wCa718GL6vxAMEhV+IYD4+VKtBxHmM6j3J/sfNftVyP9XLUdHAXcsgOSlJw5bjzr
	6eLxR/9oi548llT//MXqKpCA97Yzno3HgtFw8nxAG3o0iGpVYEEMwXSz6it/SZmtUD4ip+Zp4PB
	IjVG0Co+63g==
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr288346075e9.18.1793704912111;
        Tue, 03 Nov 2026 03:21:52 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm76135345e9.15.2026.11.03.03.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:21:51 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 03 Nov 2026 15:21:25 +0400
Subject: [PATCH 4/5] usb: typec: fusb302: Tell SOP' messages apart from SOP
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-husb311-cable-comm-v1-4-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
In-Reply-To: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3957; i=alchark@flipper.net;
 h=from:subject:message-id; bh=SPaMVKHCSHADgoe045gwJLD6PTFurGogyswiSAjqPA4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9PHzEVX1B4tQnF16EXPkmFXNVV5+nKH6bLNvtNVO+7
 TrbaFDe3zGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUJ8Yy/C/JkApRW3Y//tm/b47Xj33cxhAdsIPB8ppNhtL5nc+u6HxmZGhUu3r
 1R6napg2FtWd2vU5Kz7neHs51v3im6tl7pb//NbMAAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The driver sends every message with the SOP ordered set and reports
every received one as SOP, which leaves TCPM no way to reach the cable
plug. Start a message with the SOP' ordered set when TCPM asks for it,
and report a received message as SOP' when its RX FIFO token says so.

SOP' is Sync-1, Sync-1, Sync-3, Sync-3 in USB PD. The Sync-3 TX token
and the RX FIFO token codes are from the token tables of the FUSB302B
datasheet.

Nothing changes yet: TCPM asks for SOP' only from a port that claims
cable communication, and the chip drops SOP' packets until ENSOP1 is
set.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/fusb302.c     | 26 ++++++++++++++++++++------
 drivers/usb/typec/tcpm/fusb302_reg.h | 10 ++++++++++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..8b3a2e095ef8 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -961,7 +961,20 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
 	return ret;
 }
 
+/* K-codes of the ordered set that starts each kind of packet */
+static const u8 fusb302_sop_tokens[][4] = {
+	[TCPC_TX_SOP] = {
+		FUSB302_TKN_SYNC1, FUSB302_TKN_SYNC1,
+		FUSB302_TKN_SYNC1, FUSB302_TKN_SYNC2,
+	},
+	[TCPC_TX_SOP_PRIME] = {
+		FUSB302_TKN_SYNC1, FUSB302_TKN_SYNC1,
+		FUSB302_TKN_SYNC3, FUSB302_TKN_SYNC3,
+	},
+};
+
 static int fusb302_pd_send_message(struct fusb302_chip *chip,
+				   enum tcpm_transmit_type type,
 				   const struct pd_message *msg)
 {
 	int ret = 0;
@@ -969,11 +982,9 @@ static int fusb302_pd_send_message(struct fusb302_chip *chip,
 	u8 pos = 0;
 	int len;
 
-	/* SOP tokens */
-	buf[pos++] = FUSB302_TKN_SYNC1;
-	buf[pos++] = FUSB302_TKN_SYNC1;
-	buf[pos++] = FUSB302_TKN_SYNC1;
-	buf[pos++] = FUSB302_TKN_SYNC2;
+	memcpy(&buf[pos], fusb302_sop_tokens[type],
+	       sizeof(fusb302_sop_tokens[type]));
+	pos += sizeof(fusb302_sop_tokens[type]);
 
 	len = pd_header_cnt_le(msg->header) * 4;
 	/* plug 2 for header */
@@ -1037,6 +1048,7 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 	mutex_lock(&chip->lock);
 	switch (type) {
 	case TCPC_TX_SOP:
+	case TCPC_TX_SOP_PRIME:
 		/* nRetryCount 3 in P2.0 spec, whereas 2 in PD3.0 spec */
 		ret = fusb302_enable_tx_auto_retries(chip, negotiated_rev > PD_REV20 ?
 						     FUSB_REG_CONTROL3_N_RETRIES_2 :
@@ -1044,7 +1056,7 @@ static int tcpm_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 		if (ret < 0)
 			fusb302_log(chip, "Cannot update retry count ret=%d", ret);
 
-		ret = fusb302_pd_send_message(chip, msg);
+		ret = fusb302_pd_send_message(chip, type, msg);
 		if (ret < 0)
 			fusb302_log(chip,
 				    "cannot send PD message, ret=%d", ret);
@@ -1475,6 +1487,8 @@ static int fusb302_pd_read_message(struct fusb302_chip *chip,
 	 */
 	if ((!len) && (pd_header_type_le(msg->header) == PD_CTRL_GOOD_CRC))
 		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_SUCCESS);
+	else if ((token & FUSB302_RX_TKN_MASK) == FUSB302_RX_TKN_SOP1)
+		tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP_PRIME);
 	else
 		tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP);
 
diff --git a/drivers/usb/typec/tcpm/fusb302_reg.h b/drivers/usb/typec/tcpm/fusb302_reg.h
index edc0e4b0f1e6..c98a502bfbfc 100644
--- a/drivers/usb/typec/tcpm/fusb302_reg.h
+++ b/drivers/usb/typec/tcpm/fusb302_reg.h
@@ -174,4 +174,14 @@ enum fusb302_txfifo_tokens {
 	FUSB302_TKN_TXOFF = 0xFE,
 };
 
+/* Tokens starting each packet in the FUSB302 RX FIFO, valid under the mask */
+#define FUSB302_RX_TKN_MASK			GENMASK(7, 5)
+enum fusb302_rxfifo_tokens {
+	FUSB302_RX_TKN_SOP2DB = 0x60,
+	FUSB302_RX_TKN_SOP1DB = 0x80,
+	FUSB302_RX_TKN_SOP2 = 0xA0,
+	FUSB302_RX_TKN_SOP1 = 0xC0,
+	FUSB302_RX_TKN_SOP = 0xE0,
+};
+
 #endif

-- 
2.56.0

