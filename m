Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914127;
	b=BPf4KpLatRtjUYq0FJrt+rYrkxqyM4GLluWI4i+wrYphxmE1etTUzixTE7/24lhOs6q7
	 vjqt36Wab1EhdYEHSCfpMKLl5j0PZuX3MWNZJrAHspGyxOS80Hti0tAPdASV3E+YqKUQy
	 gLB8b92ruruSXvCgo8j5N2ZYZYJcS7WNrpDeb6MCbPeQHth6EX1+wC8h00tLGv/KuG3sc
	 R+IQOYJbAua2A0pySNA1THAfVOpyVWXAnRjQ6pkhId0W5q6lj4YpZyDIJ/nPBQvnaqA0X
	 Kl25MwL5qUsXJ0oZIhQrMCCAPOxd6Ot9zQq0fnRiney3fpt0RTdmBwu3/Y47rVJrk3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=R9thyVNeFK9yczHShfvrLBM/SBStk1V4iKn/81Hubf8=;
	b=ZqgveSjgSzNJuQHNAnsu8fhBxxxQv2hF+3Sms5e2S8cUUWwgSIQyBR3yDZdbi709rLfq
	 itCCm4YME1a3VUSFUivJnyaawkh7tADN0CGd7tboel1sJB2Io/IpjBXij2tso4esKx9bB
	 ONMtuC28Y2zArrtngIfGdu229DrVS4ibkYqoWnCzGlGGDFHFsRPi2G9aIHNjIkq+lkEkP
	 B+wVpBFZG+aKRHUvWtX110/O87xpIm4/UHIE0CM5YzApkIWYNlH3FryI8a1huUh9qVUYx
	 WlBjnrzW3b/Lq9qTsEEi+cHk1j5RQ7qEQZqy5FwTO5t6/RJga6nvq1q+NmFcmVzNQkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=4aKx9RlU;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB4A606A33E
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 11:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB4A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=4aKx9RlU
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so23064815e9.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 03:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794914125; x=1795518925; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R9thyVNeFK9yczHShfvrLBM/SBStk1V4iKn/81Hubf8=;
        b=4aKx9RlUXMeXqBBpugMtt6aua/VZYGgaTWsQW4rgrUDb3/wXxshenWwlT9HKsR/LI3
         vNZ6UrqNsIEgMm5BNWZUbJbcTRuiR+ZLOKRLxdrLIVYZfJKjagx5dcdYfRb5HLT32NBW
         tbxSGcYkz8Ab3/fh1EwVJBHOc7vc9HVQzArIr4yiVwvb1vL/ivcorBFfV6X8Vmk+pOSp
         Rm8dHwUDbRKmjP4+lmSjzXfGTp8VzGuYuZeTaj+gBpzB0KQa2d/m479CzHCNCQBRts7k
         OCe4CyZy3ZBNw8Ta6g26lBTo7avcCu+Gd52QdNgCcpOqd1O3X4/GlAdRuxYlK3ZlLTHm
         8vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914125; x=1795518925;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R9thyVNeFK9yczHShfvrLBM/SBStk1V4iKn/81Hubf8=;
        b=a0vo6tvNq38h9x22Pz23u7s+J0PlMOuA4PrzsAIIFERGAXZy0BJEzF01LvP+EH+Pg8
         F1fRT4xhvj1T5fx5I4tRQs483QLG0qq+X/ZCbWR/US7NjsXEyiO7gTJ8GopgWQ/mSMbf
         lwTgzHuc4SWAQFKsNkDWmO5ow/6zJ/IAfTarczeuqQCvl9vvjl4Ab3rFeyS0wYZjUk0r
         Bt6Auc57mSmrFUikDxsGm0PMUiL0KyjKG4m0o3Bc+dMSch03vbgyt2YSsLfADwbW5IuB
         gTKJQ5rYzRULOkRON1uoBbrQQ0HuHm6TlAgepH3c1IRqvkdqDXRB4HzEogfjEl904XYw
         VN4Q==
X-Forwarded-Encrypted: i=1; AL+hErFJtQZTB+F6HXeOLtsf4ZLPssHTbHeUxheJBD4q808Ik+KUrREZ0G/DSINanas44Vw96dMfUDwzjs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p0hp1+DZDR4bo/j8cWXEbnE3+lesE8K7+70WZPcQUKOTDFK/9
	cOv+5oT3VfOXpVaUx4HZC0tDLpFfsItmEgrxz+SIjurPiRFwSRIIjcUDKwwJRnlO5pY=
X-Gm-Gg: AYBFou050TNTyoL2ssUO0SmY0LyIMhTE2FLc4aMbADbcZOb6fRFudagNarYcL8BvKBw
	UbOtMvsqjzeXKUVtLertPtbsvwA9df0CJxdxwhSoTyfYUyjTHBluQ9c3a0/EvRuBzHu2xEqsYff
	7aktkZasRt6zhgUZxJ726iOqzRvgzoc6WLELgUJLi0sj+txaWfOnJ6tbvrCzaUGvxal7itB6D5B
	2spIiiZ+QBCqYQ11J22Ot/2vK+IrCdC6n+SkFO2Xfy3YZL25g28YT2YxNjErTEmltX4MRkDCSWi
	8oWMPiobraM6wO87s6yJ+cuCVU9kuY5GEp9KPy6mfGa7FQbSTTJF4eLTPUw0URPztvnsufbcU1T
	WL/nkAemYx3MYU2n+0cR10yRt0Aaw+QdxbB5e0Sxo8VHtkzzMhdDZgu5Qcmg6pmOHG/MelHdgfU
	npFLjog/lcdw9fwJWmskBVdag8N6whUDJodREmCy5PivheoiYf8HOzATPj4RV0aEHT4BTJ9e/5g
	rxjKBiXwaP9tsdYGN4etoJE442oPbCTh4+Y0qVhhERLUR8nwmC3HZfeIdGw3qeM+X9k4E1wcOyg
	aa704Eigh5IC9HBV6g3S+ZzHuXJblwdVpci7jlGE0U0tAOz1wz1zng2BCMj5jefme/i06sfrja2
	Qqgs1t0aiTu8=
X-Received: by 2002:a05:600c:638e:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb5bf390e3mr260911265e9.31.1794914124967;
        Tue, 17 Nov 2026 03:15:24 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8220sm59773745e9.5.2026.11.17.03.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:15:24 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/3] usb: typec: tcpm: Fixes for talking to the cable plug
 as a VCONN source
Date: Tue, 17 Nov 2026 15:15:14 +0400
Message-Id: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrB0wqQbbq4gLEyftCNWQiUUQ7
 26qu/ct3r+DUGQSeBU7RPqx8DJnqLIA9xnmNyGP2aArbZSqakwufFEWnzCSUMoz4NPYelCN8a1
 +QH6GSJ63q9r1t2W1E7n0T8FxnFCtlG93AAAA
X-Change-ID: 20261104-tcpm-soft-reset-sop-96b4a156f823
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567; i=alchark@flipper.net;
 h=from:subject:message-id; bh=gHWuQ7jOWigjSvi21cvS3TrAf1L0yhsS2pG75G68CDQ=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT9MfdSbKtsaeHVTFRYKRrDb8sXtewzZ6X3ldfhVSaMu
 elNdXIdE1kYxLgYLMUUWeZ+W2I71Yhv1i4Pj68wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPX6eEaGKSs41yzd+aPk34c1wQI6FlLfJBwF3wXneDusfTpdmF3pJyPDldfLW3v
 0Db3DDexnTlbtvb74U+f7PbE5X7wTZnd7eRjyAgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

When a TCPM port is the VCONN source, its exchanges with the cable plug
on SOP' can leave state behind that later affects the port partner.

Patch 1 fixes a Soft_Reset meant for the port partner being sent to the
cable plug after any SOP' VDM, which left a source without a contract
until unplugged.

Patch 2 fixes SRC_VDM_IDENTITY_REQUEST: it either replays
Source_Capabilities after the first contract, or stalls until a Hard
Reset if the cable plug NAKs or never answers.

Patch 3 is hardening rather than a fix for any known device: it keeps
messages from a cable plug that breaks the rules from reaching the port
partner's handlers.

The first two carry Fixes: tags and are meant for stable. They are
independent of each other and of patch 3.

Tested on two FUSB302B ports (RK3576), source to sink through an
e-marked cable, plus injected cable plug answers (ACK, NAK,
Not_Supported, none) and stray SOP' messages.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (3):
      usb: typec: tcpm: Keep the Soft_Reset target apart from the VDM one
      usb: typec: tcpm: Leave SRC_VDM_IDENTITY_REQUEST whatever the cable answers
      usb: typec: tcpm: Keep cable plug messages away from the port partner

 drivers/usb/typec/tcpm/tcpm.c | 94 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 79 insertions(+), 15 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261104-tcpm-soft-reset-sop-96b4a156f823

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

