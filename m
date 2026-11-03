Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704912;
	b=4A2746aVqwYDF8DCwsUV6y+wKBnodzPWnueQe7zK4i6waTkNIqvpa3QdhWQdrZR5b/W3
	 tYNibKUzRj4GK6gmCHqUStBPeAvTkNqA44VU79QvjKdwfwj9gsrBdbuOFbeb82sxy/y/G
	 KFFu00SgD6mS9o0mw8nM2v10VJtwmXaBOERU/j8OtQJTAIf0HdBa0jb/tjZdjAvROYXve
	 B1Hd0KCY/0Oh+O7YFK6pMzEp2uHN2+0wP/H+07CVuMVxItfOfldDTsQ83avVS4/0jsrRc
	 IMpUUveAsiW3d45NmOVYUISjq15nCskfv1OUWg25KgdSMOZpf+IExCXaNykcluUP4Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oQ+i/l6ez8rO41zcEi3WBZiEg+MA0Nn3B37AvKPDelQ=;
	b=Lv8eEm9Rlwu5XGxbF1h47iT3rvD7pVCUa05hVJlROnpn7t2JR0DyJAFMi85D8gvnlhDo
	 OTbJ56ENyc6hefD2NBfND1N4TUIWO6uPrb505QYAYcaDdOtc3k2Xm9TN09anBxYGaJ9Ic
	 VkAWAsLv0ARbYPCMaE0vAirQj2MUmsMMZaw92XwTjx4Lt8Mxr+YDnOtzHq4UPcSQgQGgj
	 LK+ACygPav6sG28k3Co/UINOOFiQRkteclubMJpqzRt/dbgcBhTftOtHCDUpHwkaAiQeL
	 gH91pYDuVv0m57zpdkDGh9VWrl2NhV2gPFJgAN7aDbtWnx8JaMgCBzqaS+lrHOdYPLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=DRdYMDvz;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D2606C545
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 11:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15D2606C545
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=DRdYMDvz
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so32540685e9.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 03:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793704910; x=1794309710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQ+i/l6ez8rO41zcEi3WBZiEg+MA0Nn3B37AvKPDelQ=;
        b=DRdYMDvzKSXQUgioJU4Q7fMBhsWsKOLb500NRS+hMGFa5/fq8RVRFTb+jCyHmjGGMg
         iNECqQP4z3lg9XoF0SqVxNFv+M7Qi2Rrs3nJxHtvHYvvi1DMbrh5VoDG8ku1W3dhCav1
         jXSgQm/aO3SqVMcneyUKscC/Z3QHei9NfFRdvXFXbxqMZ2XG1ZwSibcRmbObPxULRCIc
         cnYySZmlW6hPE7+Jcz6W6yeYOZ8P1+q0fF+XmBCiQu5I8HuQykW5B/OjsLJ7UHEAia+/
         7guxVxIKXxWeKuDZJo5Zm1JSf/FbpbPe1sQOGuFZZadqcHcTX0GGa1MuTVYChK/6ss0a
         2SPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704910; x=1794309710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQ+i/l6ez8rO41zcEi3WBZiEg+MA0Nn3B37AvKPDelQ=;
        b=PawLSFeysJthZOJlpJknMmhE4gcBryDjseNwLTiWM0wBobyA+rfHFjugpIxXUH7Mbv
         /aLAH4yjHXkCgiEj95NovCvoN8E1ISzsN9/zub1nPhEXvmeq/r0UsGYCB41jqbwncbkQ
         4LrglF1TYGFJoA2BPrDNlaHIDlLpqZ6mM0OiTkdgmLLny4N2ooTqH5CzHTOaLEFqfsQA
         lbLYPwIqw+3CdUvaweAL0yNJ4RwgMlIONnuRvB8aVK0bQgo7mrnVnpNEZmgBa7LsgKps
         eJE2PClH6i05hAJ6IsKsD1ljCoB+JQ/eNPxRh7qRtFXacLDXUueXv7D0YqTyEQ2I0AXV
         v0aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzooXvWe3l5pNMhY0gJqjWUkHRAa+hdDQnxkbsfux14Q5msBxkE454BazNpMt1RW7ahYmOqGXCDFLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gQ/wt5jLG6e/I5OzCfwj7feJZfNk5WEFS1y1hZbHBxM45z50r
	eJ+bKl41I9FzZ/4IHlytRnWk7uVK5D3j1lv2su8ZXRPNimyQ8BGDkLHwASZHrCIKJTA=
X-Gm-Gg: AYBFou0CfZ+iqYEtt8hpRK7WNijzxvUeyKTxIgrUSFo+jMHsCoNLzhy6zR5Q2djk+ja
	oPuPzJkaLvgPKczTJkdXd3ngHqqkVKhnGMrva3PMZr5uBOfUz4cNBsxgyJwdhhYXcLXvLYII8IO
	CVOIqdAEfQroJYsbaDvRQ0GhFu+DIjYlfcPjad9zSwY5W8ck8haQNG9VJi5Ql9R1POVsICJwRGL
	zVWl1/K3O1TSOOqyX6V7dyVR81UvdJwoy1CYy0NfEMyOEPn+lF30aWe/exK43mAMqOuaKwZkFSw
	lejU2Mz5tvTfHxckmeyFwLUiG8CN3/B2kDTXkbeXKaS7b8ay5Msn66c8m9k15q4oJMXxB8S1lSh
	C3psSdF7FACGBxkWZVjAR1WL/jjlXThu7lQXd9xSdIBxMWSjhGeAFQacjVsxrV/yIFWSV3PRwZk
	mP55S3zqf7EjDhLzVisQJsJy44UJzbVia/g/6lYCyH74sr+x2ecYUVzUVJGLA4N2DWc3/Kwq3cA
	1CmV/54wghO5wvsr4qT/W+Z2liUCWPbJW0nDTHUrVufDsQavxznS5EQMvugVlXQvlJbk1bAW/8h
	5R4nqf9ZfzZSQQR8x/iHY7dlQUDs9qNspz7h5CvI/bBwOsLYz4G6YB0/k+gvtjzcslUd9L2uSVT
	mrj55x2RJ2A==
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr284423665e9.34.1793704910295;
        Tue, 03 Nov 2026 03:21:50 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm76135345e9.15.2026.11.03.03.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:21:50 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 03 Nov 2026 15:21:24 +0400
Subject: [PATCH 3/5] usb: typec: tcpci_rt1711h: Enable SOP' communication
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
Message-Id: <20261103-husb311-cable-comm-v1-3-6217dabc1a85@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004; i=alchark@flipper.net;
 h=from:subject:message-id; bh=92BLN6mDRG08oaYdV//oEqkr1ngSve47pYUCM2UIR8M=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9PHyEfX1Yj+ydiNnfhB6du3pihmTN9VCOfTk2CfXp/
 Te3ra+Z3DGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBU11ozMiyrtuadI6PuHr1ncXp/TEXYr8/bnMWeiSgEHY+VO/+v8TDDP0OJmOs
 THIuyOsPXuGQz/rj581xhl+c6Q/Wd6RFX3OYLMAAA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

These TCPCs transmit and receive SOP' as the TCPCI specification
defines, so let TCPM discover e-marked cables through them and learn
their current and speed ratings.

Tested on a HUSB311 with an e-marked 5A EPR cable.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index af8356df6b98..232eb721fb3d 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -337,6 +337,7 @@ static int rt1711h_probe(struct i2c_client *client)
 	chip->data.set_vbus = rt1711h_set_vbus;
 	chip->data.set_vconn = rt1711h_set_vconn;
 	chip->data.start_drp_toggling = rt1711h_start_drp_toggling;
+	chip->data.cable_comm_capable = true;
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
 	if (IS_ERR_OR_NULL(chip->tcpci))
 		return PTR_ERR(chip->tcpci);

-- 
2.56.0

