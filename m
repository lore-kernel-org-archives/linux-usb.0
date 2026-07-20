Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4458B3DA7E1
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542168; cv=none; b=dRQ2bIx43gxdjU1DEhJ3ch8rxfh5sjplmQbH4psDIR58CBTjdDqVdUhI/NcQr/qQu5pMQF979AzyqeNUz9naDcHFm5plKrNWDIYlz7Lok05ZE5bMMWqGxFSJ166QMV58U/N6BYJcFUyRWnKTtGBdacea1w4EwSJqspWw5BFVPos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542168; c=relaxed/simple;
	bh=BWgc9Iyj2TcgxZPnjdFYu7FeDt/Ds9TPxXfbQE2PjHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aWQ/B3qdHZos1Go2mq256k8xDHxK0+NRRL0KIu6TRjRB32Ku3+C92MGBZRfzke+RvBUXP9lxlQhbQD9yFMpjYI281WkGwaFS6eV1/PjuMVOkEHkHsdV6EA9TlvWcL/eX36NFO9nYYg5aWKKjR72gzggLw7h2glSFoibWcbee9zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aen+fRTP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aen+fRTP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f6de72faso24883285e9.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 03:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784542156; x=1785146956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eI5+JB42wBJEMgs0lBBfnLbJuBx+ok4DAUzZO7PojRg=;
        b=aen+fRTP45fNLZ50w3MJuey0pnyDtn8fa5DFZv+n5tZHQoKaG1IYPEDG+zEFwnSi1T
         sT9KvdyQ+LQ5FWDgKKgjKrWaQgAN4ujbIbUmfsD/rsGia5FWAVdgLU/DPEVrv5H8ezY3
         Y6YXCKEhY9vMGRIg0E6R0fGFmf9UNuGQZnjvun26on/7MnBeAV1DPt4WwzLmQCotbmb2
         A+8MH5LPcB80eBpzVp/mUlypDdsDzgxo6n/5x7Y3Bq7nR6nIVwua3HTnqMNtN38MS1KY
         5rjcE4/qP8sTdBz7q7F93fEt9v2CTRO1mW747aJzpWEy8YiCt81ESMp+0NzJD0UAtjyo
         ky1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542156; x=1785146956;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eI5+JB42wBJEMgs0lBBfnLbJuBx+ok4DAUzZO7PojRg=;
        b=Zgdg7hM5418W91iXAwDS7M0qE5sriMkWytqUUUaDMO2FCVdlsnMFy1a4dacxS95nMp
         zKI1vfLy0qZqQQLaX9twZ6t+2mHQUK1AoZCAdmP0wQiuuPSwlXGgZCaZ9bjhxrIOLOqc
         2Oc5cdGVCH1Qmrxo3n+GymoyxSjreXQkv+qLLasuFnFsczQ2r7nPsZqUdrbjzoFGkBX4
         /JkFuQz2sYJrUO4HNM/g8ePqtIoSHrSgQs7xSSe8cNKVPOR2OduZpgpV4s5BFxOWj8ph
         vzxlRwHV2pTBsPe4Yk5Rc1PuyDcsN691e4z4rTHBvqlRJvG0d3nAE70uInYj5D5bLAMH
         Hjqw==
X-Forwarded-Encrypted: i=1; AHgh+RqzNft9xBMG+v0pxnXXe+RvalyDHWNB/ieOYmQQV+ldBzESglqgksJ8Qdjcq3WmrYWtygH2bNt0cFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKg0a+zJe0mU+SZzNOr6gJgCdTwRwM9gbcCnIxqbmjc63a84+
	V/hN2dhlsoforMn9mJOAaUI1Xj7m3yCG6dpc1mPY89PweRHYSKTOvyYTM9Vlwi5U5Xg=
X-Gm-Gg: AfdE7cmi+IZQmvhCR79+nb8JAIS3Cq2XqvwV5PcoYAfwsrR/+fb80B4xzQ/z3IXPeo0
	PilhWCcHQhIVbxy2pWraHB7P72sx+IdUdYi7i2hFAydcEivF/Y33KI4/237XZbTP7MvqEc1/tHq
	LaY45rRV+TzDgduZEmMfU5n4GRovBI1iAeO7LkcK3sLVKztCBM32i6TWMYMYnrrbTHG06xJbK+j
	5wqpEX+bPVhfgpCm1Rln9FPRrT++Pd57OFwGOAQSRnzOa4hNpnt7kxuuCip68u4DF7JiNZmeRS1
	kTxcmycCcWxF79K7Qjq+y4YovYjSQSzvXDVEp3Wx4xs3DqKKREyQZ+MkZrKM5fRYMOXaPjL0mij
	VzOQn6UeoFB0RKZUnJCKgy2H7izLhLXdabfgquQIxRqQYrlCqQKy19r1fhxTH92HhAe8fUdplgT
	GJieYDk/e6E79YuVlAVo8M8efO5A==
X-Received: by 2002:a05:600c:3b88:b0:495:495f:bc30 with SMTP id 5b1f17b1804b1-4954a3391femr147130185e9.12.1784542156162;
        Mon, 20 Jul 2026 03:09:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm294792995e9.2.2026.07.20.03.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:09:15 -0700 (PDT)
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
Subject: [PATCH v3 net-next 5/6] net: usb: pegasus: Move long delayed work on system_dfl_long_wq
Date: Mon, 20 Jul 2026 12:08:55 +0200
Message-ID: <20260720100902.155605-6-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260720100902.155605-1-marco.crivellari@suse.com>
References: <20260720100902.155605-1-marco.crivellari@suse.com>
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

