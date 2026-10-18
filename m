Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA704CF461
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304677; cv=none; b=FcMsgV35vPqVnMEDLnfDCMXpCtpD/cgMhS9TIwt44myTgtXmLavO44A7NxEAJ7SIIrvG41ch/24MpMt/mNqPNnFJ9LD1meASsfrMijWaoPHGrBFm0+kISs0QTZBEq76oxwh5cXOsZ+MXfw6frOJNfZQyN++nhhWaEY0ZcX5d1yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304677; c=relaxed/simple;
	bh=fBON41rkWJm+Nr5IP0+q0DD6zo5hPQEiHIFcCKvNNZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMMGTjJ7JcZ20Hh4dtrrMOf2s1WUZG+7ML+t9qa8x2h98vWWNtxxSgkGp+GEb5Z2/fKsCztQzNx+iKK55u/XHjJwTIJRnoaSuuGG8goPqtNp6v31K2Jea3c+RqG/1VyzHFcq9irJGTgmGfyLohqmDe70Ai2cIRHLOqyy2G0aQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=oVd0RvdH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="oVd0RvdH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e946155442so8958495ad.3
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 23:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304675; x=1792909475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=oVd0RvdHSq64KyeFs1iLG4eTFH8OLdu4gWJ5w8y+79BPq+xg1l9KZvzlj/PrNzfnfb
         zvFjmCi3gPHUIjVenkw+vveiB289G/mOD567chisUkm9/8uvM5yUOrhCdOYLC2MLhq+0
         NuyapCx/jcvcIRdUi3CetNdmDeVeZnEtiTH0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304675; x=1792909475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=hQbPiwyuXUP2SlDFXYdTEtViV9yGjkaw+mcW1AK4cwI1SzvCxhO149BvYXaNKFIy3D
         ksGGtwvH5G5k9BBEJv9BmyO2lsLXTywgl9sCOH0tw2i9o8oAWl/nQZ3AAAv0KG09qj94
         FAZjIZkiKW/fMagvMM0NpWsH394jbKVANGVrAhFQYl0YN2b19Cv0KHcz+dRUeHbyYSpx
         2sJJSwT4B6RFTCCEPmU3TzhJJ1Ech3V34dlUTETGoP2B8698n0VXdybuPL5VCOjwNhjk
         WFxQHgTf8bue9v/LgcZ65cHfqUoresG7D0vQHbdq3BkoDwU68wFtr6EUnnjrWOQ8GIxo
         DV1Q==
X-Forwarded-Encrypted: i=1; AKwUvByIF7kUP8vhrumJ1MBb1IwdpO8bfAcoEbvV1OH6zURty5b7jv76PrCIH5YHJWwUfrYcXJPZEKkHc7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI++pAVT1/phO7ZRS0QUhwGPXn3VqGtFazgOnUCtOva19K/P7Rn
	lqecYZJvSkTRNXX5ckDeY9SbehbAHh7OF2/p7IgHlBpILeHceZWmnuGwbYuoyUHgTBATUB3v8n9
	6ZI//ZqQ=
X-Gm-Gg: AYBFou0F/uF6IlbeA0fV6AzP7Ix97nlk9CLbd2wuQq+9YQev3lKz5uhar/5AXNJzQgH
	1ZyMypz6iKIqMjNOpLOib4zjg/RRqF+USfMa9JtB6GKln3U+LDQCrobE3lok2jcURX+lf9CDBZ3
	muFZjtrB7B6/PUwn8yK/jOQxfgerk7WNloMPqE9M4lFSkqoT2OO+eqyd9R0QVh+cF38rgF+V8qK
	67kMmfEqk1ABpiuwyvZW+Gp9Ahchf7a8MtY1fzq0tw29DO1HkWL02YkdEntHbk5O0kANb6DK3Rx
	hpsf0a8BEthFkUE2iP+74NzzK8JWYJDWWPl0F8o9PFzjYU+Fheg8i0SucKJPJaMkFvIOzCK0LUh
	zjlpIoEOKB4c111MbNfKwyS1oZGUmm5uVh8x2xo3jPuxrSpYwdE8lzNsRtfXhTygTH+2iYxSJRf
	TeUU+1grREicO0Mxd1yOG4hVJg1VVqB1rp6A3GlZz4dBcgD+kE0ZldGtaYMcPrZXxYq+iGZFJwK
	jTddLhBLNGEybkfCsQuNO4RkxSQGdoFwRI0rA0jVpV006ZES7TMoMSHWNdpbKtb2g==
X-Received: by 2002:a17:90b:4cd0:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3acef104296mr3845305a91.11.1792304675254;
        Sat, 17 Oct 2026 23:24:35 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ee274sm10513293a91.4.2026.10.17.23.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:24:34 -0700 (PDT)
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
Subject: [PATCH net v3 1/2] net: usb: lan78xx: do not update statistics after a failed read
Date: Sun, 18 Oct 2026 14:24:18 +0800
Message-ID: <20261018062419.21921-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg>
References: <20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
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

