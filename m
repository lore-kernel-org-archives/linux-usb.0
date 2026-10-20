Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455630;
	b=kj//yCKfjXSqF1xHjbKE1/3DsVkzKCWhn32jGqrzJQ99o6XIeOWKuJTB/j9/X4XBdfMX
	 7dm3lK1HqPTuWXV0V+kDUKVcHjSqiCO4Ez3WuCMlIiIk5p+rVrYptFS7BGIcHy83xgHtm
	 NhU5ulMc+1g+ftmGmoRk4IW32ukWAOcQyY8qneut+o56wgSU65XlvBemGWBM16B79vpJm
	 CAXZmAgCLrJdoOO2FDBq97MOI9EJjWiap/bEKRPYn3RnFDTzpiuuVfUWdMS1Md3idp7ag
	 demh4J6s/w3Bgv2evh8T8ys+e07ImYIVy0jfcJ3bfInX4TCObgdL+I2w+5LCPDjZ4Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
	b=RD2BLZF4J9/lDGTH066R9BeWSQBTMI3GdvHj8O/cjom36cRjK5rm6HRRX3HF+Ohmcu/r
	 j32MomgbHuLd8ITCoaO+vPcGm1DGPtyxGQnOMnexxuTYGE3wHoEOgQcsRXlM/dl9+BN+J
	 BSjqWvA8bV5BewkXJ8dEk5vCOR7yBX1GR9+LptT4FGyAaFasLDH50MmLez/okduQGJWLd
	 UcKKNLBHm9e3mssjNweMZaZ8s73184WG6atUiWxkN0rc2UqJFoHKi5jx4onTZYa5EbkWw
	 Xq9+dXXbDOyl4TfgNUQbpPJLoaor7qed+KVhK4R7TgW5szt1K9L5VC0V1ZWQ6L1+aXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=TE84NacE;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425DF606A31C
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 00:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 425DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=TE84NacE
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e987a2ba0cso22045175ad.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 17:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792455628; x=1793060428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=TE84NacEl3T3mzY4W5rPDIpq+6Lfc1rNcOh90s8Y5vYh6NNcH93ogskkvSMh77tyF8
         4LgFPp6S8w3qhRfFgUZO6pLVeeEpPlMLrzo2n/BkMLZovv8DeaxJ8aK4m3wedYOi82BH
         ucyhxq8lB3pkJ7nIltsjr9LJGTBFRRQWYWF8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455628; x=1793060428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=Ze7LMAwovY4zBl/JF9Ia8iJsoims39Le+CLAIYUT4bLZKmDFDa6jdS2mMMvoJo2z+v
         mV0TGPeg9Z1huyHOF6iqiwrNuLHZeHhV8hXxJkWoTIreYqD61O+3s46Yq37JXRa1xNfw
         Peich36k14XeEBDDFkke/FN0Up+hyMC+qEE4eoDocqd8HxPbq3CvqgIYj8uvQhGE9hb8
         6rhZCoxLz1kmwJFPTeDKAmdH8Qt1VNLA2jPV59Zyx6lXg28ZsQEPJCqjtLQLAaXLVj7E
         +YhtN5MrLJruPov/iBtdn+MPHsWj8ewEVfE30aHAFh+AabA9KTsPSJZJgZ+/J5nZgWYs
         RruA==
X-Forwarded-Encrypted: i=1; AKwUvBwfJsO9v2mU+welsOKU2sE5/c7nxsQOLrv96ifDQjbWRrMccbhyPE75L1uM9C2iKdrpAXxaERWKhlQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN+LHQypyEhpRABoyNOgVTLQ5J7Y2LnMGFiSG57Vpcb+LDHICg
	pODWlfG52tB4bQtudCPeRtXJHDMEsfmEDaLvUj5yD0QlhoGyTddO5sbQMw9MqO0RGvM=
X-Gm-Gg: AYBFou0nVamm8szfWB3Xjx7gXXXAWLUDmOvpqQMJ6K0SPcQnqWqFxP1aAcFyi9Zp5Co
	1UfAIP/kWzBIQZq8bYdR/NnaXIV0r7v2YaJLMOZSEHL3SqWYWv/VcjnlByPBsQEVQGq6HUaJnvR
	W6NkJMESL2sD39AhL2bbtonMVTkn++0NYaOIQlYegd3xlcaAaGlfdNHS0zlPjHehj7T9SBVN55w
	BSuNHSdw9n3z0GXcT41WK5Ri+xEFa7eO579watFJF49iF5FVrI0qetzTlRjr0H20+PiJueq+fe6
	Ihvyua6AL5f8bTurwQPgkZ9Om/8LObIigLCw+kp94MHxFTZ9Oxf3IdKKxTBisHZKnEDpgxnQ3zC
	Zs6mBkxRpXF4gizjuyAH4Cc3KGeIHesXFgs2mH53qdGmqDo50yw0DQOsIZFj867QGUu3wTUUSWs
	+KCks0VkcTGQzZWnrxGN6/Vhn9mx8o+hWYVVMsM3Jumh44fuefkTHyGwzrjfSNcns+JAzw2/R2k
	RJkuLFsRbWHhq4p6QwQQjCei/oEMwRF3ZlqSwH/nhVU2M08KvL7QIaFC6qVdHGtWOYMpktD9qX/
	1SKvfIwF0G7WyEw0FxXKKU5ZacAEkXT2WjeJ
X-Received: by 2002:a17:90a:d44d:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3acef19cb63mr7592251a91.25.1792455628530;
        Mon, 19 Oct 2026 17:20:28 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d6df89fsm1694273a91.11.2026.10.19.17.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:19:20 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v4 1/2] net: usb: lan78xx: do not update statistics after a failed read
Date: Tue, 20 Oct 2026 08:16:20 +0800
Message-ID: <20261020001621.2920-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
References: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lan78xx_update_stats() reads the hardware counters into an on-stack
struct lan78xx_statstage. If lan78xx_read_stats() fails, only the
rollover check is skipped: the counters are still recomputed from the
uninitialized stack buffer and stored in dev->stats.curr_stat, which is
then reported to user space by ethtool -S.

Keep the previous values when the read fails.

Found by code review with LLM assistance. Tested together with the next
patch, which makes short reads fail: with an emulated device, ethtool -S
then keeps reporting the previous counters.

Fixes: 20ff55655a93 ("lan78xx: handle statistics counter rollover")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/lan78xx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..cb8204371f5c 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -789,11 +789,13 @@ static void lan78xx_update_stats(struct lan78xx_net *dev)
 
 	mutex_lock(&dev->stats.access_lock);
 
-	if (lan78xx_read_stats(dev, &lan78xx_stats) > 0)
+	if (lan78xx_read_stats(dev, &lan78xx_stats) > 0) {
 		lan78xx_check_stat_rollover(dev, &lan78xx_stats);
 
-	for (i = 0; i < (sizeof(lan78xx_stats) / (sizeof(u32))); i++)
-		data[i] = (u64)p[i] + ((u64)count[i] * ((u64)max[i] + 1));
+		for (i = 0; i < (sizeof(lan78xx_stats) / (sizeof(u32))); i++)
+			data[i] = (u64)p[i] +
+				  ((u64)count[i] * ((u64)max[i] + 1));
+	}
 
 	mutex_unlock(&dev->stats.access_lock);
 
-- 
2.43.0

