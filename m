Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628300;
	b=lAEdG4KbS878DkOL9p5l+5GlFoxy7OBltQiomdYaakMPXbWrIoUnIUNQ8Cq+zVQI29LM
	 r9tKB/3Id9IGDgk0V6Yy/phg4Yod/vdayolOTAygh/dZALHGF7Q8Tv6Bp9SgdNdhITJbA
	 xCDcPlIkrel72UlD8TbMzGrre4TEuLuglPmJjkGG8uy5L/r1p+bh6tek+8StYXKlp9io/
	 7b2iaPlprdVvQ4pvwAeGCU8R/699Y8TEV7Y3aiBM7akdWGC8aj8xwQMGEYFdY+NorKQT2
	 gTXe90pEZrmJ2NCudc2zvYK/htEPqVahKm+gyhu7q4mXBLyrTMiBHLiKVTCAaz9ISJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HlH6HJ9AzhH0cBdXc0NNL2Vao0WiXPXGwYC4r4Hr7pI=;
	b=Si2z2XRsQrtrLU2H7lym5k1+3k73eX5qUBZldh8AM8Gc9LM1PgUChGQxWvIONPlY8bys
	 CbhAqdHQO9RV79348+lv0kbB0slyCdgqE24Vmggcc/zhSFTDHlCHTdv2LqdMOEJLhiPXa
	 8Yv8vTQjsGyJV4AY6LuYTn3dFP1LCBOsBMT2kPJtN1xasNWXTwfrNL5m0y2ZYhhC+XhaA
	 Alfg/xAMaAQ7AYjIglbpzDiZwStNGRC7ZeshNBKzY0NRVSGUWcDb0LS6NjGbgpM5yUGuQ
	 GVRue0EtAjGgzllGv3dlUFriQkhhQnO02PtozB6880kJIOJe3cLOoAmYo/IfFBAOpvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=cO5671f5;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AF4606A333
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 14:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AF4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=cO5671f5
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so19570735e9.3
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 06:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793628298; x=1794233098; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HlH6HJ9AzhH0cBdXc0NNL2Vao0WiXPXGwYC4r4Hr7pI=;
        b=cO5671f5GfzuJZP9nmVOTQhaoaNZljJhHb4Wyqoun8A7/QZ5xEwHE77qAQmfJy1Aya
         CbV2rKEOlk+QZDZehfgiNhgnFo7pXk74Jg+oqGb3GxtHF22pnwe7DYPVzjlqR0zZUttD
         NWMa+Yk1NDfQpo40+XwPP3Xd0+WzoL25UOnE2V1HCjk0s6y//Lz0qe3c2ojpqHKt1lXP
         ihN+S6hHbJvclJIDwhBMMzRJZXRVL51A09aDCzTVb8QwfrAFwEvvollDHN2eucnq/Bj3
         rz5g5Wnv+O3GuB8VVAJMPfaWJHUrgCwLCCOPVGFq2p79AiWmy6eunA0pEt7KVHhtStEl
         v7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628298; x=1794233098;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HlH6HJ9AzhH0cBdXc0NNL2Vao0WiXPXGwYC4r4Hr7pI=;
        b=rnGnCf91xwgiwK2Nh1QfsCY7gMiImWUh3eS2Y9m1D86WveQOCNUhh2oa8ETPnzLkgH
         AuTqg1V63ilTiUIhaXjrkq8XTX+ho2OtF2/t6L95nUJcp0ek9pGy6h2rWG8HIYcaFE0d
         qbPSHxTIddd3QjCzIvIlDS6jd/5fcG/V0yrnhVWOdBUy9vPVk7WZBtuJbmx7Eh9aAFrw
         qEcbk1cjlESTk4Z+PhwBt95o915D/0AEZO86jAggE1lJgu2LUHNWUA71qEo1lQOoqhn3
         oEpZH5Z6LHRhW3kChU9fnREFtH62yu5HOdtCKPT2Yhu1mlFHWDbbKcn6vhHiAy8S0ZTK
         LvZA==
X-Forwarded-Encrypted: i=1; AKwUvBxnBBFwn7QUmKvoFPlN0Gn1wX03i7mUZVsrUG3tleeOsKZQafFpNpK3KrSxSbLL1T4/fb0oMcp8GMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhdmIA5h/YLLWdqBQUd/VolrnboWRyeI9YqDO4EQucDQaxXY/J
	qsh5KdMNHcQ78rQe/Z2fXLXkx//Wyd40+/XIO746mz76hCo3W4glOF8ibXI3PpwwrY9lMt2LmG8
	rFROPEDrlBg==
X-Gm-Gg: AYBFou1nMXsna3UcwKQceVy3Uvo2AObsHDr2KJO5vbJx8NwxFSGhEjYBUHFKBGVsG70
	zmBVrjB49JQqSGOpZpinbCmgFQtI6JidcQTQyErt4T8BVixTEJasDdGJiw/9SgGy53uSCPVfJyO
	UDQhXG7G0ej7ZhszDcpGm8c2je0OVAljm2wOzzcPa/ptNGD5FQ44i+4gpk/aMb86KipqB11b8Fn
	jMIByqhv95XB0ZyC4n4UxpRe9McLl/zK5OD84ZxQ3TK1SkxwTc3ceruvahouJEE5+84RExHWOgH
	fKi+3HcSju7hSvh8n3Tr1+fWXpwby5ab0UtbVWUGe6TxNCfWixJIVJ2bFNteDy/0IVQMOSLYJOX
	1KPDc6d3i9QhbVWVJrNfSHWpLjGRjBH2qsf9Rt0uJo77Fn/8QsbuK1uiZSY/W/GWfHGpUNgLPFr
	yJMRsSE/l4rkznFjgHLFH9BxwME+eOl0K5/jVE4JZIFadIW30vy9Bczl8vedR0AN+YYc6Qhk8C1
	4wzP8RcZT11wDaeKAtXdYZEEItrwirTus9aNSXxUy4aA4hcpDcUul65jOAQy8oUVv5dxHRcETT/
	Cqnik4/qRv3Jp4dPVS6EVCjfRNcuNmXzJc2HijmJXhwrvy+bwET8/uVxP+wbpZmrb9MAK2okji8
	0IOE8NBuo
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr101213825e9.35.1793628298304;
        Mon, 02 Nov 2026 06:04:58 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe885d91esm202182505e9.0.2026.11.02.06.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:57 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Nov 2026 18:04:46 +0400
Subject: [PATCH] usb: typec: tcpm: Complete discovery when the partner
 lacks SVDM support
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
Message-Id: <20261102-tcpm-discovery-no-svdm-v1-1-54bb9b613065@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtgAlXpVUoXMTPqFEwkY0OLe
 HdTXb7F/xsoJ2GFR7VB4iwqMRSYWwV+cmFkFCoGW9vGmNri6pcZSdTHzOmHIaJmmrHvnDPDvW0
 6IijxkniQ7zl+vi7rp3+zX/832PcDHuB2i3oAAAA=
X-Change-ID: 20261102-tcpm-discovery-no-svdm-b8aa1f5768dd
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237; i=alchark@flipper.net;
 h=from:subject:message-id; bh=8+ESZci8+ds89DX2dU2TuMQVtHES8Aj9Kyz+KdWXPd0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9mNF8NCjCePHB6Ny/m+yvx2ySCZtxv4/XZNWcCctXs
 hxhfCGp2TGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUu6kyMjS9WlV3VD7rg5oL3wqBra5XumVm3Hlf4DWl8GeHxoIZEbyMDHsmm6j
 N054v7eAVziF76ELaykd/QjJen/Pcbe3taNSuwQEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A PD 3.0 port that does not support Structured VDMs answers Discover
Identity with Not_Supported, as TCPM itself does when no sink-vdos are
configured. TCPM treats a NAK to Discover Identity or Discover SVIDs as
the end of discovery, but on Not_Supported it only ends the VDM exchange
and leaves discovery pending. Every pass through the ready state then
restarts it, and the state machine passes through it after each reply
it sends.

Two such ports therefore keep each other busy: each answers the other's
Discover Identity with Not_Supported, which restarts its own discovery,
which draws a Not_Supported in turn. Two RK3576 boards connected to each
other exchange about 25 Discover Identity requests per second each way,
indefinitely, crowding out other PD traffic.

Mark discovery complete when the partner answers Discover Identity or
Discover SVIDs with Not_Supported, as on a NAK. Leave a Not_Supported
from the cable plug alone, so that it cannot cut short discovery of the
partner.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d721baef5210..e21fe544b2d4 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3908,6 +3908,17 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		case SNK_READY:
 			if (port->vdm_state > VDM_STATE_READY) {
 				port->vdm_state = VDM_STATE_DONE;
+				/*
+				 * A partner without Structured VDM support answers
+				 * discovery with Not_Supported: there is nothing left
+				 * to discover, just as after a NAK.
+				 */
+				if (type == PD_CTRL_NOT_SUPP &&
+				    rx_sop_type == TCPC_TX_SOP &&
+				    (port->ams == DISCOVER_IDENTITY ||
+				     port->ams == DISCOVER_SVIDS))
+					tcpm_update_vdm_discovery_state(port,
+									VDM_DISCOVERY_COMPLETE);
 				if (tcpm_vdm_ams(port))
 					tcpm_ams_finish(port);
 				mod_vdm_delayed_work(port, 0);

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261102-tcpm-discovery-no-svdm-b8aa1f5768dd

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

