Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360939;
	b=hnEk7kV/u31+yD4Mo9oIVw2Cq0aC3ZGVKOVjhLHXA4tR3Cl+rP6cHhj/9X2evLiq29Ft
	 D2NJ0R/Ae950CMkwryGdNo3Sn3iBxiTcVulV/4e8lJ9VUjzoqWR0kqf+01lL8xlBJMuWM
	 48uXOiKIVzrn3VymY70tsMBuPpxuDWa8xa4cYdksx0/bvpF5UvxSNDpI7cMsw0mSdn+eE
	 MKNG1lA4S//mkiMgj636MD03HchFd0I2VzWvkzfmQK47PT69ZFsQtzC05Y/UW53TpDwuO
	 aXfDOfH4nT5J5WYzvkhzS1gWU2k8Vtp7SL1B4tXBG+Iyh49N8qPkRbaBGlw07W1C5nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BrmOR0k5r7xy31gHMJ7w1Hba46gBSd2dRL8+89dR1Gg=;
	b=KmDJ1Nz3evDpTqcPRy6176XMPvGAm8T+ekT5PIYW3/c7WpxFsvbyEWkC/NNhkUN8CXcA
	 03Lz5WUvD0m5d2OpWyGfc4HFiOQeDiESnnqR/DbTvU95B4Lgi2yebMMESLLjBjw4ecLLa
	 ESd3S99XGeidepIWZDyv4RNtW84sOY3BY4xp9EPwqdwbuNOCMbYKD18vbj5iInycGYpvR
	 xu+Mb5tCpYMuo8aNhWLp00r3c8/Jr1TDAXjdutGlGX7lQeKSbuDbmJD4QNIPhuKNKwVml
	 /97mcNbRxaczdT3sIRjNM0O2PLgP2Ad6FCZWj57Ioi+H1zZkkWLn1fvd224ppRDMvEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=nrkZal5s;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68C606A334
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 01:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B68C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=nrkZal5s
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2242739c88.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 17:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1794360937; x=1794965737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrmOR0k5r7xy31gHMJ7w1Hba46gBSd2dRL8+89dR1Gg=;
        b=nrkZal5sa0m6AXQH099P8P+BdPNe+Bj+KHrznDlnWn4jqUPlQlolnUbv+FFxl9+knx
         t173qdfOVHrNjNdvXg0t3Albr5e8uCSHCe69KbQus3MT6xTBKvksWi0ATODsiwBkw7l/
         lcf1HWLSUegO/iNAKO8ftdKAMH2cNaJ6LQPJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360937; x=1794965737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrmOR0k5r7xy31gHMJ7w1Hba46gBSd2dRL8+89dR1Gg=;
        b=Yfc3jS4eRs3qsBDTJThyf2VOaimzICmvQtxBivOXUO7hNI4q/Ie+jw0ELcjNPPVRdn
         wk/PVLEuWYM6Snm6Uwmz92lLdwE1nuWJaAE2bjscyf+7LVg9t356pKQpU+sdL2b58Gzs
         EsUNthVmNGJ5RxNrJ1SlT+Z/EU9rgZSvIFxZBDByMzbMelQw3zLLVgBhb5l/gp8xdrJc
         iU/1Mej8CHazDXQBFci+PFZ/zh684swEhw65gAipK43oWm+RS+0jASh0mpxWuiEeyaNp
         BT0uZY/TPCJV2FU7s02WmP02bEQkG1QqERYLCkbSqAQFHBiM6AnxO803Sumup1YsjLfy
         wkMg==
X-Forwarded-Encrypted: i=1; AL+hErH1Wb565m/9D8Ckf0ehyOpXDEeE18J89dIuHbX0lKNs//lIjExdFoS86ZvUvM0aScpqQgaqVPmFGOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z82snSHiqSQGBIszyfMNAE7KBR6RiDpXScbvtBY8F4v3zms9fKo
	gnPLpxXZFbatg8vPhOQ4MNlCi+IjFbskdj6zcr3OkA3C3a3p4qJoQpL5VzHhHVWthnkxSz7NdM0
	9U/kiCvs=
X-Gm-Gg: AYBFou0hWHnKSTOAmKKJgjOiPI+ebaw9t1h7Js1iQS/rXxA8zXzuOs2Ce4ZlIgdBrbf
	vOjDY2SDNwSbY9XKjTjKbi1J6L94rzwQfsj3pNqePtMgq2dX9dyXMGh2CpRv5k6yMuaPFeUwdky
	vKDRzkcK0Li7kXgrVci9jaxt/BT3BMljoEunqGZf6O1QXLaawx2gfRMejusckrTiTslx7Tr80w4
	P0KfgFQzkMPrqPs92GAElBlIMUFUHXUZVksNqieQzirKP9gb9nXqbATOZJ8IE/2dPzPUD/w+buD
	pEX4X50S9UaG14y9tb9/xtsMHYVJlTTfU/pWoCK8OYtyUOmfIh/Fk/qzcZmr/1xjmvgyjMypGp2
	rh1qavHCWjAQvvhKmgz3jvSuUl06fSnfwOp7n7rrD7u7ojfptTT10CdvcLAhI7bO9HA74HBaEiX
	CemVvdUO3fAbBJeFZF/2IMl9qISCueAumZl3/kfkGNeqE+uM6lw+tQORNCHBtN+zpxQz6rEbkYM
	kgkoSqI6QOREEHSU96IU6EGWpVnFo6oLeY3qrLkn0/pO7dvWWKjdlWaIFYhLIg5/KMXLZQd6fSn
	4djFt1BtVu6IHZgO3gdTwIkB0lg9C+c5p8XJVoyhXpaq8A2AJwxygjrFog==
X-Received: by 2002:a05:701b:42cd:10b0:1b2:de00:9bc2 with SMTP id a92af1059eb24-1b3bef25cb9mr1698072c88.12.1794360936994;
        Tue, 10 Nov 2026 17:35:36 -0800 (PST)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9696223c88.8.2026.11.10.17.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:35:36 -0800 (PST)
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
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v5 1/2] net: usb: lan78xx: do not update statistics after a failed read
Date: Wed, 11 Nov 2026 09:34:53 +0800
Message-ID: <20261111013454.34542-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
References: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/lan78xx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index d73002b2c21a..76c2d98b49df 100644
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

