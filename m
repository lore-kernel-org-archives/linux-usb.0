Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4A1372EE3
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345249; cv=none; b=JJhg7kk+WDj5ZF0Z2NPr4aM9DGDH77Ae+J59KsCM6DItu58cpckhxnxEkNshDcyGXdHQWIWjec7QppxjPKoBJUVlKuhpbAcZjorL9dJHrnHkBo9FL7OTj3IobkSA7DffobHsgbLiLC2W7WYPJ4e5msTPfVCURYucjiDS6K3K0/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345249; c=relaxed/simple;
	bh=BWgc9Iyj2TcgxZPnjdFYu7FeDt/Ds9TPxXfbQE2PjHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ENke4D6Ns4RzwDuQEeSJFpjoUC2mrhYDsIrBs1xUCbF/HbkttPMGQt9Clb3m/hqrJcsXPC/5U6XzkGnggA1uwQoW2G3ah15NlD93SOJnidYXJP+fbGJFVQCWwkKRB7IMp++xtDQUDyb+isFCb+Pl7H1rxku4X06Bdc/BeoHvLy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GBnQ/WPs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GBnQ/WPs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so33663835e9.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 06:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783345246; x=1783950046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eI5+JB42wBJEMgs0lBBfnLbJuBx+ok4DAUzZO7PojRg=;
        b=GBnQ/WPsfBEsCFhtwQIEGaazqv9WvQc2ROR7vnKxg4RBDn6lWNuGJl922IKZ/gweN/
         4hkKhJeFx09kCQ2A67NeimvtG3j12TT1NfKghSnyjxmyK+OAYN2nGyiUBT33FOBje6Fa
         MoxhWdwdbSzfoi0GR5koAYubbQVKtOsWNj3gSAGNIngMQXSNGebF77yxSA3j8u6jmkNK
         mrBNnRGGyD+cdX6Oxoxl8E6BJXHBOe6s+J4RdHV9CfhR3ObILrGK+j2dLsBsh7Hlkf1Y
         U57iA5Gf9mFGJ8kKFt4/RzR2ahL/jVVAAlSLxNwdKpwcFuVMm1tpRuh0RAWsxRkmo3LO
         iyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345246; x=1783950046;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eI5+JB42wBJEMgs0lBBfnLbJuBx+ok4DAUzZO7PojRg=;
        b=pPftpjgqqojyofPrQMaVRk0spgTboKhDjwLyFIcvnzDCGlilyGUojPDBEC2j0fkykq
         xWyxYKclbNpsmtOE/PCcFJeWu5z/CrfqShc9unDHHSTenAxPE4l97dJAEDIJZ/WB1Jh2
         wTwxApmk4DjfGFALI6hsEXSokqAanGRBBfgEA+Odgq6LCcJwxOYNuOtPMfEtWuixe+ez
         U3E9KhByRM3XFXcmxOBaaz3B0b2oPfGMwovkn1HcL2xH9QUsbuiGXiJ9hKYZdu+mOoYn
         kcxreYGUlPtRx5Um/W6ztyaergEsqgfBK/381LYd6arQSyEPgjazx/my0zN/mVoTZCOt
         CYXg==
X-Forwarded-Encrypted: i=1; AHgh+RqHBN5COKZ68ofJ+HnSKeUtWILdlwWwrs6UHd5XBuowRVL6mkEyX+pFxfIk4iDC62ZoqrHQD66IXUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVC4HAyFdO2Tp549q86XHh+TXZxjKHyYSkoyX2NMOZduUwW8p
	zb7sew97LvH0NkfEjAv0Wsz8vlQZcOmtFultUc4qNAcprQY8svx1gEag10XjOVIQv8Y=
X-Gm-Gg: AfdE7clNUgzzLR1Z2S0uM5drhdflrw0umk/jsaoehrxffx33jlBu65G3NMnqr4THrHH
	p2e6UZSGqn7V7zXbP52KSlYTiw4stGy9NlaeoDTyjKTzuDrFQqF61Phw3NrSO6ddAfXPHeVH1Fd
	kTO7sG5KP6AXqezregnSMFItZEVcPZuktmxJukjZzeRSlqfX5+C02eVk4nII51eYmtUfuyr516c
	aUUTprydqmxkw7rjYdNuTCEZVusHDuOyDP4VT+9ygd2p4CT+2LW7rLldkFzAWEzjifapTGDv3j8
	KyDBAAYZP0ycVXIIu9uVccYZ74W+cp/ilePIAx8DXscCz0SLK22Gh8CHdwBYRU2rBaAazRQHsUK
	efm02pivAgefM2r57FrL5dHeoJZTEZByQYv0ytA6s/fSrXxEKB/WpjhxhWeRtL8QLd0YmAYDWsp
	nI3TMCKKsee6XenCdVUCrOe8RXimz2ov/L5TgloH567LNC6g==
X-Received: by 2002:a05:600c:860b:b0:493:b9cd:1272 with SMTP id 5b1f17b1804b1-493df065f66mr7102735e9.23.1783345245780;
        Mon, 06 Jul 2026 06:40:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm24424868f8f.33.2026.07.06.06.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:40:45 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Petko Manolov <petkan@nucleusys.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH net-next v2 4/5] net: usb: pegasus: Move long delayed work on system_dfl_long_wq
Date: Mon,  6 Jul 2026 15:40:27 +0200
Message-ID: <20260706134033.244295-5-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706134033.244295-1-marco.crivellari@suse.com>
References: <20260706134033.244295-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: Petko Manolov <petkan@nucleusys.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/net/usb/pegasus.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index 8700eeb8e22d..c1798e14b224 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -1126,8 +1126,9 @@ static void check_carrier(struct work_struct *work)
 	pegasus_t *pegasus = container_of(work, pegasus_t, carrier_check.work);
 	set_carrier(pegasus->net);
 	if (!(pegasus->flags & PEGASUS_UNPLUG)) {
-		queue_delayed_work(system_long_wq, &pegasus->carrier_check,
-			CARRIER_CHECK_DELAY);
+		queue_delayed_work(system_dfl_long_wq,
+				   &pegasus->carrier_check,
+				   CARRIER_CHECK_DELAY);
 	}
 }
 
@@ -1232,7 +1233,7 @@ static int pegasus_probe(struct usb_interface *intf,
 	res = register_netdev(net);
 	if (res)
 		goto out3;
-	queue_delayed_work(system_long_wq, &pegasus->carrier_check,
+	queue_delayed_work(system_dfl_long_wq, &pegasus->carrier_check,
 			   CARRIER_CHECK_DELAY);
 	dev_info(&intf->dev, "%s, %s, %pM\n", net->name,
 		 usb_dev_id[dev_index].name, net->dev_addr);
@@ -1297,7 +1298,7 @@ static int pegasus_resume(struct usb_interface *intf)
 		pegasus->intr_urb->actual_length = 0;
 		intr_callback(pegasus->intr_urb);
 	}
-	queue_delayed_work(system_long_wq, &pegasus->carrier_check,
+	queue_delayed_work(system_dfl_long_wq, &pegasus->carrier_check,
 				CARRIER_CHECK_DELAY);
 	return 0;
 }
-- 
2.54.0

