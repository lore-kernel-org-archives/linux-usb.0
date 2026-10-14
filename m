Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC8237DAAE
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 02:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946413; cv=none; b=ikAvMvyEt7z+t/1Qk0XiVP5dteVNVxreSAB/xohP5Q8CzJdHKmWrxl6lQrFDRYe0suUoxO25FzScC2LnH/M7Cml6B1fTTki6ol04eHiLrCsOe3eT16LQkXifxp+IynJKOJLMS65oLEI0lgNUO3G6jzX1Ydi671HIUZzEQswmXpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946413; c=relaxed/simple;
	bh=/Egt3tz5Hs7aeJWjwPyFfGyEMQF3bDb+gjjLGnhPmKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbqcCSXIwFJEajOGPLHa/KFxvjtI8o2d/zwJlbDCDysUZQQ0lIlmhvD09OVXB3lgVfALd0ipDeO1sltYW40+vi6jnxwKbjfdEyPd5lt9Ej4DSwXS8WuGAkSnU3JblK+sslMXSWYrzx9LHzjjSPu449zWz9OFq1X8sdt9tVDEsZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=Add3QjnX; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="Add3QjnX"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2562138eec.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 19:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1791946411; x=1792551211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsN0OFGAaeGLWTKOy2XE6d+vAOcJRUzLtjGQFjg/b5k=;
        b=Add3QjnXYaqUvTsMSReWqQanja9fMKIbAa8bauuXutrNcYz37zNKh3tO3i43lqMaKS
         hvy8fTQfdkUmJwdV/bKde3S6VL3FG9orHJLNgYZ26/YoU27w9Ti9zg3qMIGBSgqc7SFl
         eGJMiyT8DdrWXf0T3oF6UmtmrkS1+xxrVTPZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946411; x=1792551211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SsN0OFGAaeGLWTKOy2XE6d+vAOcJRUzLtjGQFjg/b5k=;
        b=tW0aPtq342EIX2Fcre1TMS8xqbKaiZRjv5fEnAmvQOSkrp68+pHMuCKIW/13tOdOJ5
         OGmlaAZ79Q81eOytI5sud7Lc7vZpbzTTXhH4yw7+GcF9sg5w1WOngnMM4CSyttbJDhmG
         XcARGG9kvFf6TZl93Fl0JNtUmQUivjgXXcBMm/lRZxekSMa8QE+U1qCS8Km4IhENSmj1
         fl4HfcAQIupovoQn6xuTkfE/YdmxThZ476hzQaLJl4O2ugRejxFUjrwIAfflVutCkJX4
         e8hGpovh53+14z1asRnZbF1g+kSJ3SEkaCgF15qXHeYoIsAd8zaSqjYGGzWzGVFyrlXs
         ofTg==
X-Forwarded-Encrypted: i=1; AKwUvBxFhU22iOnTScV9It7RFMei7H95qJ5mqqDCO8gzqKTIqon1zhEyQlRk/MwgGlinBXHyfJqsT4WKdJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOWP0YTqGfxVLSO6olA3tRbh2RVWDL8MbMSUE6zXUM8DxAXAcO
	IktA+rDgGM2fSMJXOYaSXzBAXqPDJs9yA4przfGRSVi3CgUAVpc/zSa2sXjVm0b5s+w=
X-Gm-Gg: AYBFou21Yb7HxHcwZN9nEThtWQm2BCTs5HdmnP/49kz3pSoPi3Gezdk6Lh4GTINsWCV
	lPY/94F4/9VoAW7hE2EHFRWj8qf9Eia212G90C3bbwLgpyw0+F0kMumEBJ75sL1GBnr0e3dyaCI
	Dk/HemST0uB6SlAH2kwsMh/4aLCUE5BkHuXRgHPfoGUbgUU8GOoN6sVYtfp6kTlV9PCaSC0ll9b
	VP9wMPHXxuYhV8ki+E68LpZa/I/UK5Yw/2zGm3zAiRrh+3tZ5VakTh4ERWh63HqxvzFFpt8QCL0
	64UniQLj/NsFrnMzsUS7HrFmsZNZ+noa+ql3dNAntfUpQ9ctbG/5AFea9otK+7RhUQN8pyCaS8v
	rbZMUZWexEuYBDPAadFlYSIBs7UPakZcwZnIvHf9YHI4UZV9BhqgmqEknpteINSq4+4ILnMNVHL
	gE/gR3M621ykVTpGgIugBp2S1lN3vqIY9w8aaF7G+R/9YqxfjGPudeZ7j/ck6cB3/GGXTI1rCP9
	P0ppjR87rg8PLFGLgpHIlCVKBZl
X-Received: by 2002:a05:7300:2c01:b0:35c:1567:7966 with SMTP id 5a478bee46e88-35c15677c5dmr6988514eec.27.1791946410151;
        Tue, 13 Oct 2026 19:53:30 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm46522557eec.28.2026.10.13.19.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:53:29 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 2/2] net: usb: pegasus: check rx pkt_len against the received length
Date: Wed, 14 Oct 2026 10:53:07 +0800
Message-ID: <20261014025307.25233-3-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg>
References: <20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

read_bulk_callback() takes the frame length from the device, from the
receive header on the 0x8513 and from the trailing status bytes on the
other chips, and only checks it against PEGASUS_MTU before passing that
many bytes up the stack. A device that sends a short transfer but
claims a long frame gets the uninitialized remainder of the receive
skb delivered as packet data.

Drop frames whose claimed length, plus the 0x8513 header, does not fit
in the bytes actually received. urb->actual_length never exceeds the
PEGASUS_MTU sized transfer buffer, so this also covers the existing
PEGASUS_MTU check.

Found by code review with LLM assistance. With an emulated USB device,
a 101-byte transfer claiming a 1500-byte frame was passed up as a
1500-byte packet before this change and is dropped after it. The extra
bytes happened to be zero in that test, so disclosure of actual kernel
data was not demonstrated.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/pegasus.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index 7c7d6b69998f..7bc9312eaa9e 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -520,10 +520,11 @@ static void read_bulk_callback(struct urb *urb)
 	}
 
 	/*
-	 * If the packet is unreasonably long, quietly drop it rather than
-	 * kernel panicing by calling skb_put.
+	 * If the packet is longer than what was actually received, quietly
+	 * drop it rather than kernel panicing by calling skb_put or passing
+	 * up stale buffer contents. count is at most PEGASUS_MTU.
 	 */
-	if (pkt_len > PEGASUS_MTU - rx_offset)
+	if (pkt_len + rx_offset > count)
 		goto goon;
 
 	/*
-- 
2.43.0

