Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8CC3AFB19
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946579; cv=none; b=MZCPQgU5z2vCxbWnn37W+i4tVk2ScpK8IKRrLqWVv67H6bNl2QihwuVYTzoBq1WRORL2rb9hRmf165LwUjv7+oYfHzAknSrgeCI9dVxo53ebpPixJrtfs2Whv0eTYIlH3fpHqr+GtRBWnVNci3dRNEDcc89RC9bC2IfOKLAEQPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946579; c=relaxed/simple;
	bh=fBON41rkWJm+Nr5IP0+q0DD6zo5hPQEiHIFcCKvNNZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hiAdu4UkFc3XqJ8CM8ldKIlfjqT0mdFlqn4UdCPwR6fHwT0R0AtWpkdwgP6FImTub00Dok7f3xYXaD9kaLoY2WlmTh2tmpkSXftkCK4YhrasXvkFrAjI6JsPau5w8nBE+e1vFnUlSzqxpqXKxoImKXP5/Gx6vs7k4mqZo53rvwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=RW6pOnFE; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="RW6pOnFE"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso6372879eec.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 19:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1791946576; x=1792551376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=RW6pOnFE8abbsuBRK5RCPD7ELppHLMzg+X7ZUKEx9vSBE90iHPR1fl8sq681saoCLj
         Do680ch5lbDWX4cTJ2uPSRqivtGuSERxUGEmSPnOiOGmZLu50NkBi2lxkElXwl/KhYE7
         aMTQn3fpnG5a0gWvSeZVVKcQq+1bda9ttJ+Uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946576; x=1792551376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhtM3DINTPwMgq788UyncE7FKN56YRahvoDja7jwel0=;
        b=T6gYdR3sNZ510GkI2Y0Y96BcauoozIh1cNDydwl704xqSrJxq4mkd2g70H6aOj6A87
         wVMIjAi6i+MYOo6u1U4pgRtTo/+7KDgXEgtRXFcVHk0R7U+VE2Nwcvs+o7DZ7A+0Ias3
         +ci1YH7u4JVKMi0Dy7ueXzx+GgEks98wn3H2d6nTKAlyD2tngAuiYuSkw5FFKx1YZZA1
         QIUKKgu1l7kCy+rigFThOPGKDnVeyNEL3yV1olIQYIJKkDJx7glJaZGWKJFyK/BblAO5
         1AqDF95GQTG4K0y4jzNy7eKIDOXoQQ98uJ2UdrFFRlE6An7ETOne+jgaXxJeLF1jnfJN
         mClQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT3kxEZx73TfQPWDri1pwVXiG/5P12hWX6Fu28dTLXV+p89WWv/L0qlHFHTw/yXMHPM1arjLMBihA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2MthN1MlNsYWiasu5Nkxyyg5UX2fbwKZgqyQwl0kGp/oG4vqj
	sNcbD8y+PvT/iC1Iv9FPPU8+ryivbFXBttwqLjNlZ0v6/59nHa4KO1hyxjHDwHDzwEQ=
X-Gm-Gg: AYBFou1SHUP0O8/yKcWEJsBmVenazF5/A///vk4ivZ2V1b6I2olxT4MqogZ1liZxJRq
	PdIaGSxcvszZPMEKiN6r7LE4+NZ23D7abayJ5AMDN+P5I08BjofPmnxu6vJPB85IjX5dZaNuo2v
	3NmEZz4rx4vZ+Olut4eO3GPuTj+LaR5+2KD0QuVYM9gx5lO2/eRB1Vw/H8XFo9MbRP8D8B9dfgj
	854AuRKxbn+GJWiC3HPSRGD+I40t+OapE3I4dkZtlZRMLRWlSW7l9h5fO8G1FFxx4t9dAOMxBkX
	oIKvvuf4tIatI20fYBUuAoR5M4knTT0dR/ylVsJyk5ERwJdHgMuZyIc4MJ0tTyVNtvnBqnDqAYT
	wloU8r3af8LpV03yqPUuqULH1LkbmMyMuC2PqRLvhAYsRVbbbya71NHRN9zf2IfkM5KzDg9j4F+
	tYBKZdA3CNzR1pr99WT6fLq1v99c6VMQ+zJtn7rB3EEue84nV6HekloJDaHsTXiGygVbLmsAcTt
	Pbbu7kMelBfoG01ZZQDryDwwmDhGlJeOfLkOA==
X-Received: by 2002:a05:701b:424b:10b0:144:e246:a0b5 with SMTP id a92af1059eb24-16a5e968b0dmr19796817c88.40.1791946575008;
        Tue, 13 Oct 2026 19:56:15 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm2122640c88.6.2026.10.13.19.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:56:14 -0700 (PDT)
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
Subject: [PATCH net 1/2] net: usb: lan78xx: do not update statistics after a failed read
Date: Wed, 14 Oct 2026 10:56:01 +0800
Message-ID: <20261014025602.26334-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg>
References: <20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg>
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

