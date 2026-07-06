Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033E37F010
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332763; cv=none; b=bZYuIavhbkMZJUQI4jnGTJqNfwwGQ9W6xsLE5t2DcsTVfPv0XyEK1NA3bDYp71NpeonCQjfBpkash6aBjV7UUDZvMcBxpMsXOxNLasoCFhK/uEBHmqDmzWopjPcBv9EPZj2otmppOygoq8IpjbVD2igvJJaVD8rkmIQ29EGKQa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332763; c=relaxed/simple;
	bh=Td4o8heeZk0DnQ8mv67J0Hk3GdFf6dmD1Z4b65a9lqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ENu+bNepTQH8hPxTpiVDS96stdcDbBvO+iwDzBQH2Tce1Fud1zWolVtW3xxngqlOCdC+jm+3+3hYkz7e7IkOUWL31gOSR5Snf7tRtC8XBy8QiPalRgzwNWTxbhCudzYDfMYLZrH8dkmAJBM/Xag+KxEGtEa1Hex5DVSInoGn6do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qvm8nFZZ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qvm8nFZZ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1517505f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 03:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783332760; x=1783937560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mkbc+c0C8PgJHhl5zgZ77lqma+6a8EipNiJ5zSuJCo4=;
        b=Qvm8nFZZU7uAFkf0tZVQiAZP+oEEXiaK9kHVay7nGaO5zbja7CCCwhImJkEpFCGKaO
         tYWrJjLT8wYrvaEMevEwIOqjilqjVFXc4438qT4nZuekpSIVo7fxKdAcsTtgHfA5wwwl
         9vTCBhLvarnTPoaCAkQnM78ISUZEkcOk4m+c2LgakaY+ZsqrQ4/4EP7wH8k4m2/NZRMx
         qGrWwMLmLPxJl4dh4LqLaotCff9ICGSw8jLMDDUgt3IRhb7HjsYhAwniJk7s2P0smQNv
         0+zRTJ3GOePdY6bjFBWv64AU/IdUxrjl17vqICWcg7rw8J2SKJYddFlnY50m7AO03ZW1
         bZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332760; x=1783937560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mkbc+c0C8PgJHhl5zgZ77lqma+6a8EipNiJ5zSuJCo4=;
        b=hdwHabVK0pKYbBA0qoxM2ZRmX0xAFf2kx1eMqTM6WHnHQDatyJsa2wiHQlWaTtOhSb
         r0vX+Or8yMuAHwK5uMoKZ9hm1gAgqL7nEAT7hDCjh5rrJ7jiKPbocaQ3Wuf4cyfVmLUi
         eyFyfPumIzrVXh1NCqrqmXjTS5u5G6WcsUGlZyymXFCqGtoS8kRqCYjg35OjdC1pR/6X
         BHHF4VFLwj5SQadUBWxCVFCgMDu7CsbTVDw0/yI9cuCvsJg3wCXufRJkhmTGLRw81G7M
         9J2/68/CEONgAhes2vIn+mYukytYBGVaeNFVNEU4wir4pg0gJoT4/U2HneH5w44fNbWs
         jWgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq162BUiPhr6oohRMce5dmx6iwyXxmRpuuDlzv/z1+XFCJ7aABLUeJ8TAzKw7pwJxLCnXf0/tEwhj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJKqkkt84FERCBxYQRwXGgv5tT2iNYg05XN6H1p2BhxziARJC/
	tkB2JZMK6z5Bkk0Hc8vBFTPnFH7MNC194cZKR2pmTzvqpL6mb/xRcVwOLQ+q2YJgKW2vwx4C64a
	D7IZoXmY=
X-Gm-Gg: AfdE7cnVooqHg5na+twygxgyfCKAuk0xzCetiC6huYllhp3BzHWOsvcHxxQzVItUTn8
	GG/UK3uivfTHQHRt8yvlv0j0BmzyH836LiwlMWqaV8OIrYWXoeOsJcGAcoGcGej1KYDZJ7KNpKI
	emYLgpysPzP35bzNs6zM2PYdcjM84NOUSiHMAJGeuPM+/3rme0KEF9ZRvThw79A42Hi1581io/0
	wA/luJ34IXJmy46jq9PlomB/OcKBwSreXQM7X4zImkSw7wePTAqJvJtxU13t4H6dwxOfzbNXLAL
	PEJr6UUNgKPfxrZPza1lWoPjf+rH7uZ5r8DMHiSfwqazn8dB24bfpGL4/b+gGlUn3b05IUE12nB
	eMmIRJ1Bse5HOIvIh71ESLWPB7LmgziH63wPIJqHtAAoLY6BKdIiUW5oZCwatgMcbOvHaSZRTuI
	dnWNaapU1EuC3tvURETYd9uCkLy0Gn+DNsJtdN
X-Received: by 2002:a05:6000:4301:b0:475:1583:a414 with SMTP id ffacd0b85a97d-47aab29e5abmr10709384f8f.31.1783332759943;
        Mon, 06 Jul 2026 03:12:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm23412049f8f.3.2026.07.06.03.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:12:39 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4] usb: typec: ucsi: Move long delayed work on system_dfl_long_wq
Date: Mon,  6 Jul 2026 12:12:28 +0200
Message-ID: <20260706101228.135833-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
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

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes in v4:
- rebased on v7.2-rc2

Link to v3: https://lore.kernel.org/all/20260525074857.30816-1-marco.crivellari@suse.com/

Changes in v3:
- Removed RFC prefix from patch subject

Link to v2: https://lore.kernel.org/all/20260508143853.330151-1-marco.crivellari@suse.com/

Changes in v2:
- Fixed a wrong change regarding system_long_wq used by queue_work() instead of queue_delayed_work()

Link to v1: https://lore.kernel.org/all/20260507142726.331206-1-marco.crivellari@suse.com/

 drivers/usb/typec/ucsi/ucsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 92166a3725b1..881b44663c30 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2040,7 +2040,7 @@ static void ucsi_init_work(struct work_struct *work)
 			return;
 		}
 
-		queue_delayed_work(system_long_wq, &ucsi->work,
+		queue_delayed_work(system_dfl_long_wq, &ucsi->work,
 				   UCSI_ROLE_SWITCH_INTERVAL);
 	}
 }
@@ -2164,7 +2164,7 @@ int ucsi_register(struct ucsi *ucsi)
 		UCSI_BCD_GET_MINOR(ucsi->version),
 		UCSI_BCD_GET_SUBMINOR(ucsi->version));
 
-	queue_delayed_work(system_long_wq, &ucsi->work, 0);
+	queue_delayed_work(system_dfl_long_wq, &ucsi->work, 0);
 
 	ucsi_debugfs_register(ucsi);
 	return 0;
-- 
2.54.0

