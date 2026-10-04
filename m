Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0562934D3B0
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 02:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791080788; cv=none; b=CsTUSYLBvvRaNfpcx/5TUAIxqPqVhDnP3xNAt3CN5WkS2oK+aACpVD6/bOq0nvzEQy4b6LlDzEdcIUoTQIyFuUHwzuELAvLqrCq669jsroNAseeSkU1Ncuuwch3aimDkwzQka4ZNVwlDenMp9yX2SegqVkL0nedrF9GTXRAfxio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791080788; c=relaxed/simple;
	bh=emEZYzcpxTLoGOoO9FREghtqhbTyxBUSTdBs6pX27Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exjXH2E+kUUiJttrDobMPmrxN7TWcPDqJ9p7tSjZyke0XhaydOCv1UGwd01lJmb5/3mqCI9B859JP2TmQLTCdeGttkIuGA0qbVlmNO77WQDForSmv4TImjkJmo5uCZeoaehIqhND5aJF7vxOlPZEHcaB+m7h0C+Y6FcCOmAcXhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqrxMJnb; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqrxMJnb"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-81ba09a5d23so990324a34.3
        for <linux-usb@vger.kernel.org>; Sat, 03 Oct 2026 19:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791080786; x=1791685586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pudvm4t8lLEQxc0z90DUb4vG+6ClTKnvhH/OoKD5ihE=;
        b=oqrxMJnbE4szwzur7lRWrnJuCZUadz+Z8OR0arkcJnCGXlOfBR6HDwIJPkLT67FFjt
         Z8qEsSpRMqtt9ZzN/fV7hMhIbaFTcveSar/j2y70sfzWoLx7+xCQqz24WrQqlgbg9fQ8
         eDguxqg9JND7Q3Rt04FdyY9TQMBVXYGZZw6erVbFO/RZSDExwSOQ2U6AkCPiRR0ysDUr
         XtU/SnUHTPQyWmOz+l97S5wQP7kNjJVusqF0g7pK2XBn9splH6WLPLfLy7lGRaCP3h0p
         mtQlzhXdYhdLA4QLr3R8t4xMj2yGxfYezfoABqx1PwVuhrP6mWzmnPlSFJSoiac4w6Yt
         WBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791080786; x=1791685586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pudvm4t8lLEQxc0z90DUb4vG+6ClTKnvhH/OoKD5ihE=;
        b=gR99jFPkUoF+nZ5XVA8aMMzbH0Iel4OGRe5QQNqOeBflRHd+eOq1Dl+CLcjnC4JKjo
         +loqc29PhbBMRIcSTK+MvB97b8zYiL92eRnp+SktzzGeKqMAnljfDKOEu0sXrJEvNMbq
         UT6whklsT/+uej5IiymIgAZ9FmXM0FXaVoN04vMfQ6PDebLkBBSJZeGm7Jj5r3lQwjEK
         hqF+av/LnpJ0huYrjnzwgsDsfM6Wzc2D2arDzvZeqDic9SDNyanM6N/8wl0J7Yhe8cRW
         u22QjxuwiJCVOf6pev6vnuTKhUhuaY1yNO5kqhhjlck4tpMJL5rPupol7n2CSMnrudYT
         RwPA==
X-Gm-Message-State: AFuF++kH/yiQSHnz6OSSO3kAoePHdu8uhhybg6w6AHReCcDmuzCEe7P5
	VcnTUk+YHJdpBR6mmQJ+GipEkr/AB+Lxq6C3O0OCVWA4dkE9Q98hy+yR
X-Gm-Gg: AYBFou38ZT6gLxiKjkTOvdAKxFEa0n2nBF6FAPXooKFufYb8VjPa08h3eFDHlyQ3RrH
	S4R5+6xGEXvNVTCxfMMo9mXqHQbdnUOjasMioKbj37cI49tkBAwEjq6IEnYIH0ghNRmH3AIVbmp
	rVGRijAZLvvtHjTqA+bY12zFxqPUuHPHwMLc0ZVTpArjEx/y4LWmISGpqEFUDekNsORVOZgtkQk
	XpUG3Nt7qFPe4/jHR5Y9hLg2EGkGHhAn+87wPOFwD8EKkT4cyo4wt1HRZbkrC/dEe2hg8CQzL8j
	AA89TsYS8/5p+yU4/Xy1h2rvKU/1wppKFrjGHvWhaQB5hw+6OWM1DHx9G8nyR9SLA/l5H/adMns
	C/PCTD2u/mPgkRnEsWCvAAZkiLDwafk0sXOlaO+qtPgrAG0bgmtpiO+nWKCNjBrDnlz8a13s56p
	R4gmGHECqzDluL3oJwrLT3KxQ/Tdi1IUlWW/Yf8ER4Ox1sig8yj3OVsq1Hir8Z7oX7IHTjYDfhp
	NA+XgMbMUOuSzCvMmaLNzVaTnWWi1qYwHT2h7gZ54w9UKWsDKajQFCKfLoaxFdSG4HIT0rNmgja
	xEtIUfsQB6WPmiKySO9VP2LIca2lKAqr5/MU5uDl9jeXndxee7HH2PEiXD+jXWR4mKIe+d+gemG
	w8DhdJcYcaHBDpQpS6tCic+QkFOZ9Gfs=
X-Received: by 2002:a05:6808:4fe9:b0:4e8:bce4:993d with SMTP id 5614622812f47-4f679edd300mr4833547b6e.11.1791080785808;
        Sat, 03 Oct 2026 19:26:25 -0700 (PDT)
Received: from ThinkPad-X1-Carbon-Gen-12-nixos.rudd-tetra.ts.net (174-16-208-129.hlrn.qwest.net. [174.16.208.129])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e1b2e3664sm5158233fac.7.2026.10.03.19.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 19:26:25 -0700 (PDT)
From: Jonathan Gopel <jgopel@gmail.com>
To: andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Gopel <jgopel@gmail.com>
Subject: [PATCH] thunderbolt: Do not RPM complete unrelated subtrees on unplug
Date: Sat,  3 Oct 2026 20:26:04 -0600
Message-ID: <20261004022604.359663-1-jgopel@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a Thunderbolt device is unplugged, that switch and every switch
subsequent to it on the bus device list is `complete()`d, not just its
child devices. In the case of multiple domains, it may cause, eg, an
attempt to `complete()` the uninitialized domain 1 root switch RPM
completion on unplug of a switch from domain 0 (though ordering is not
guaranteed numerically sorted).

I initially noticed this issue on a Dell XPS9720 when the system would
seem to sporadically not wake after unplugging a Thunderbolt dock. I
tried multiple kernel versions including v7.2.7 and v7.3-rc4 to see if
that resolved the issue, but the issue persisted. Eventually I found
that I could consistently generate a kernel Oops reporting a page fault
at 0xffff_ffff_ffff_fff8 on unplug from one side of the laptop and went
bug hunting. I became suspicious of the `bus_for_each_dev()` walk that I
ultimately ended up changing. To confirm this issue, I did an eBPF trace
of `bus_for_each_dev()`, `complete_rpm()`, and `complete()` while
unplugging in a variety of situations and found that an unplug from
domain 0 tries to `complete_rpm()` domain 1's switch, whose RPM
completion is not initialized and thus is holding a null wait-list
pointer, triggering the page fault.

Here are the key sections of that eBPF trace. Note that HEAD denotes the
completion's own wait-list HEAD:

```
RESCAN_ENTER domain=0

COMPLETE rescan_domain=0 target=0-1 target_domain=0
         route=0x1 parent=0-0 unplugged=1
COMPLETION done=0 head=HEAD next=HEAD prev=HEAD

BUS_WALK domain=0 start=0-1 callback=complete_rpm
CALLBACK_ENTER rescan_domain=0 dev=1-0 parent=domain1 is_switch=1

COMPLETE rescan_domain=0 target=1-0 target_domain=1
         route=0x0 parent=domain1 unplugged=0
COMPLETION done=0 head=HEAD next=0 prev=0

        complete+5
        complete_rpm+43
        bus_for_each_dev+133
        icm_free_unplugged_children+250
        icm_rescan_work+42
```

To fix this, I have reused some of the adjacent logic to recursively
walk and `complete()` only the unplugged switch and its descendants.

I only have a single system with multiple Thunderbolt domains - the Dell
XPS9720. I am consistently able to reproduce the Oops on that system.
Since running with this patch, I have not seen the Oops reoccur. I have
also tested it on a Thinkpad X1-Gen12, and that system boots and runs
well with it, but it only has a single Thunderbolt domain, so it does
not exercise the multi-domain failure case.

Signed-off-by: Jonathan Gopel <jgopel@gmail.com>
---
 drivers/thunderbolt/icm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 669807f0eaf8..d6801d8b669b 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2068,13 +2068,16 @@ static void icm_unplug_children(struct tb_switch *sw)
 	}
 }
 
-static int complete_rpm(struct device *dev, void *data)
+static void complete_rpm(struct tb_switch *sw)
 {
-	struct tb_switch *sw = tb_to_switch(dev);
+	struct tb_port *port;
 
-	if (sw)
-		complete(&sw->rpm_complete);
-	return 0;
+	complete(&sw->rpm_complete);
+
+	tb_switch_for_each_port(sw, port) {
+		if (tb_port_has_remote(port))
+			complete_rpm(port->remote->sw);
+	}
 }
 
 static void remove_unplugged_switch(struct tb_switch *sw)
@@ -2088,8 +2091,7 @@ static void remove_unplugged_switch(struct tb_switch *sw)
 	 * tb_switch_remove() calls pm_runtime_get_sync() that then waits
 	 * for it.
 	 */
-	complete_rpm(&sw->dev, NULL);
-	bus_for_each_dev(&tb_bus_type, &sw->dev, NULL, complete_rpm);
+	complete_rpm(sw);
 	tb_switch_remove(sw);
 
 	pm_runtime_mark_last_busy(parent);
-- 
2.55.0

