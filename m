Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704909;
	b=HHqx8J0J1cUshb7tZNIrNgzK+B9Vv2uAJZKQ4i0q/30F+JsJ0IZoSGBHtB6yWNUKzdCE
	 MZw9UW1Ub9Mo3BeDVFMs8j0EgyXp2HBaQrBUo2e0lU5GZGDslg47ZTqPoej50B7Y8dXTz
	 WQv5Kp+IRGqecjxQ56kvOdY5MAGwgFD97vx7upGlLQPGqC4gOB1C515Dw9AwPJYWEL9en
	 965Ss6J/Sx1MjFMVYpvnw1QHjnwl/qKb9M39+oROXNqL0fF1vLQcFsYoU6JIToxU7fHMm
	 jKkcrvhyVDKaWl27jeC/VSEfyHUbnjfKEJSQ3nGan3fhNiO5X5MA36NCPMr18UDr3YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mVXNNrUzL4JVfBqwkPb92DjVAJYfDjQQxq0TjJeAwMo=;
	b=2CF/QBn7BrzhCa/Du7DBelR4Wv0gGM2MO5kUp7nuN8Dpn6Xec7s9y+LUIJzbbZcRaegl
	 w95uXGyRaA7qJ0ky2z9h/xuUX2z8uzItfUN2tcBjHFB3RZVEx9oERe/UVZCono5u0uJIv
	 t+ggf1+Dsb2OgUq5eBts8tqwIJeIOjsF4ddAGwQI0XRQDUaZHLLQvddJwCjClizC0KKlh
	 f7Ty3g4ghV8xZR8MeKhNNQs0Dz3vLBmk+Qtz+U2LHyas6uMgwOqJdRBtCx1lj+n9SXUIE
	 5RutoYVxyHEdFFWvuecRVznIm2NvCBWq06NfxdHgXOPzJcPCgpHsW4bGmywXMrasQDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=wwxYlM3t;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458C7606BF82
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 11:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 458C7606BF82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=wwxYlM3t
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32849555e9.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 03:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793704906; x=1794309706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVXNNrUzL4JVfBqwkPb92DjVAJYfDjQQxq0TjJeAwMo=;
        b=wwxYlM3tmou0xPIr+/99ZsG8KHCvZNc+dZ43jiU04HHBThPPhv1Ug8wwbA4nRfgVvQ
         RJrWUl7S2Tl4euGA0R1FZ2CM3jCEdRwfDOSeytdF7syYQcEYLCr/0JOIm7winvyonDRA
         g13vfFMYoiYVnlMOm+egPr6cg1n3MpK4BSiMXBM7XKKFr8UTI9H/QvpQTUOQsBN77gx3
         gMomt6i57p7Dg1Aba+HpsxN+gNjK2nKNbQDfyxhTFhrA5w0VUjRhmi0rYOGl86VvBuCe
         D5I+PLgsbIwzgsANRKjaKM/Y4nZ8FNVvFlELsKO78xrVN5M60vx+7kAbOBlTCXp4NnGp
         POuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704906; x=1794309706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVXNNrUzL4JVfBqwkPb92DjVAJYfDjQQxq0TjJeAwMo=;
        b=QajCgTBurO/7/YbtYZzhz9lq4KMaJtEaqYb9VFJOYui32+i57SIN0TrAk5Y3x/Aumj
         PfMusYEuaQBiona945jA1w/mHoZPLwhpkKpA6lS8bDxyQDUArPzn64gtDAHLO6n++3nU
         VSZO7WKe+VOJwnBnrnrhuVbFgglIm1aGAfjfH7Jwt2rMKUUkpFUU9EhCTHV1DZl7S+EF
         QmcF6hGfCIAYyhe1ass3uCuNeu6D0gI3E4oz56gb8XXU1+J3q/Z/rpLE/dTdsgm0AuZ1
         RD6pVd7wt/IhREDUISLnpAkGlzSGSh2uriqsERZHIhiDOUKGWQYGiA8G4t0DmY3+6+Ng
         Cw+A==
X-Forwarded-Encrypted: i=1; AKwUvBzTmkjVJW2swlXJrjIpjh7cDN/3TLKdkXOg+LzAgPdTUvy4DF0WKqHDfuOk3zFJanYfGEydU6anOik=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UwDqoaltd9mAOVteKWinbMu8bS7OOhJt1+cWvgpFUv9Dce7c/
	662BeYLUvx1CaBfRLR+UayA9Kky7+4uCaEmNc/dV2Cnz4rEkcFzXhTbpDORC5GcE0dw=
X-Gm-Gg: AYBFou0fBlSGiQNPm9WTx3ARrwTeTs8fNKubw642XMMldDHGW9PLIJPHyvbEMUJR+Pb
	aQAh4pw+qsvrNdUPBnWKNkXnhwVacDcPgctgQPQQwiisnD+asBWL0eYr/KC/PFQTIpODkx74J/S
	3bHBHjuZgDurT9uJu4XDOgoyoPfvPLxJFEtnwU/QqyufP/dClkqgWw+4tlQky6Ntz4LOtdY5S85
	0GDMkPOvQ+4lYsoQBu6q99EHxCca1a0Y1Fh0u0v+Jue7RyFFnN7kFPziuKQ9W8WjtM6ilJsPNWe
	v7/AoToLGi6r83z6x2GVs8xJQyAF1ZC2YKU7p5woM+ehJEevRFyMhyH04KtZ2Pyvzjau/ePOGr1
	izej4PlXtegY4ixRLbB2FaSNAM3poPb1L3jtM3FGit36pe7lKd+DaRGnWqZPdEA5oN1niBk2V8Q
	zw8i0gZYzatsYx79L11UGddwtMYeUIzBbBCqR5WoxJ3fQ5KzSuPbVs3tHropkz7RtDDwUSZS86R
	4Fx0xBvSbs9JiqFONr8S6BbXzAmm/DgBapNZpfW1RdR2v6bJRrmlmSXfEtBkInAjOfhtQx+PWXJ
	n2nn6WK9NOPNQEtwdH6NwKzoiO+dj3Zl1k80fyqzrhIcaboGJNImgTG82IIcPEIJCyUnkt3/mz8
	OQOBIuwbInQ==
X-Received: by 2002:a05:600d:e:b0:4ad:181a:4355 with SMTP id 5b1f17b1804b1-4ad181a44b6mr182386425e9.26.1793704906599;
        Tue, 03 Nov 2026 03:21:46 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm76135345e9.15.2026.11.03.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:21:46 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 03 Nov 2026 15:21:22 +0400
Subject: [PATCH 1/5] usb: typec: tcpm: Stop a source from repeating a cable
 Soft_Reset
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
Message-Id: <20261103-husb311-cable-comm-v1-1-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
In-Reply-To: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482; i=alchark@flipper.net;
 h=from:subject:message-id; bh=zxAJn44JdpWKi1AW3DIpb8Id8E278rpA6Y1UkZuFeVM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9PHzk5ekLpwPOcmq1frV7e2zam6pd0zas3av3uXMSj
 3vI6a2b7nRMZGEQ42KwFFNkmfttie1UI75Zuzw8vsLMYWUCGSIt0sAABCwMfLmJeaVGOkZ6ptqG
 eoZGOsY6RgxcnAIw1YIOjAwP9Ox4wsozXDKFyxY91tqiquoZILmmumXCpUXaJlaVV2Yz/LNdeUy
 UZ9F+rpyqNQGz3TPV3/c+2FVppb80cq6motCBZBYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A soft reset AMS starts with upcoming_state set to SOFT_RESET_SEND and a
call to tcpm_ams_start(). A sink then enters SOFT_RESET_SEND through
upcoming_state, which consumes it. A source enters SOFT_RESET_SEND right
away and leaves upcoming_state set, for the next SRC_READY to replay.

After an SOP Soft_Reset that is harmless, as the Accept handler or a
hard reset replaces upcoming_state. The SOP' Soft_Reset sent after a
VCONN swap returns to SRC_READY instead, so a source resets the cable
plug a second time, outside of any AMS.

Clear upcoming_state when a source enters SOFT_RESET_SEND right away.

Cc: stable@vger.kernel.org
Fixes: 6bd181ba60e1 ("usb: typec: tcpm: add control message support to sop'")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d721baef5210..c0c54caf99d6 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1914,6 +1914,8 @@ static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
 		} else if (ams == SOFT_RESET_AMS) {
 			if (!port->explicit_contract)
 				tcpm_set_cc(port, tcpm_rp_cc(port));
+			/* entered right away, so don't leave it to be replayed */
+			port->upcoming_state = INVALID_STATE;
 			tcpm_set_state(port, SOFT_RESET_SEND, 0);
 			return ret;
 		} else if (tcpm_vdm_ams(port)) {

-- 
2.56.0

