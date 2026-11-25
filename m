Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610916;
	b=5HoFW83nPsYbPTlrhHxGfAh4bR02gYfAy7y32FqohbmxEAXouI7nstVopcQkUefTqKny
	 t3bJsKUSyBC9sXegRQYvClYGVjTP/CuUqU0315blzm4bngXWjolmNjkozruKfdcDkZOPq
	 yGhHSaMWi7d44l731wN8u6jY5femU4o3Kktv5PQlK8lQapEvq3pekMMcAZHuqypiSi190
	 RP+qSkSq8RFNoHTZ//wHE2TExEm0DLjYbj3ftWRhkjs+zRv09QWdDZhcSOoTFGHWELwM8
	 gbRYPwNnSqzJ8sQIIUYswcRoC/nlylmflMqUc4fOaT6RhYLVZA0/WFgfUbC/jq88MfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=SAWXjGXaTZ1yifByDjbk7j6PeeVyExFOz8BWyY4y5x0=;
	b=1r3dBOJkJ0NiHEHmWHEaNcUmrxa32C8QUbqXIrbTa38oHlj+ZY/e+kEBkK9RAdpcmjKb
	 F5B+ey9UPAO2M01gb5JHI2T2KubQmrf+P1LCkp/2r0v5BazbT7HvV2mYB2AXXZaha1LMf
	 PQM0SNTJo7RZpvyEOHuVYVApiM/QfpydYcAjEpwFpA7faTNE5RGDdudR/Hza+YBDIfNkj
	 MJUUAUuEUATapIOABXXFiXidczuNL+AhQYmBdQiwr4u4VYlGpcf1SLNmaQ8BXFFh29M+U
	 uat1CgrdXL4r4CZw2By2PFIsPdf56uU5SZatMTvh0DFxBhIyaREQxUBJrjBNUzm2gHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tc4LiAxI;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B81606A329
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 12:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B81606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tc4LiAxI
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso3580248f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610914; x=1796215714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAWXjGXaTZ1yifByDjbk7j6PeeVyExFOz8BWyY4y5x0=;
        b=tc4LiAxInFZjm0FZKU4AlIyL7VuUe+IeokgpJQK1fsNKpT2FV8j+GejfwjTBvCWagB
         mSx2VwoB4EGPQG04Y8Vp+iiRcPXI99JGObgxyalebVsqxTAg9mNd83wAgYeLssb6nBGk
         NnhWpX59iyE1gYfVLRYZeTfP+MwX2CPG9Hzr+lO1Cr55/pqGxjNjd2buwf8p6S7mHG57
         a9kq5yICWU4KDQDC90VBuRCly2qnvQsEZTqvTd/WZSwwZtRed1QuzP5W9tP6fdpkEzdU
         rluHlcVlTurEqA5ezu/HLHeRlJ6AS/skLrQY1EkXnXlNXzzXn4AlQLhNMFjPUCeStWx0
         ujyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610914; x=1796215714;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAWXjGXaTZ1yifByDjbk7j6PeeVyExFOz8BWyY4y5x0=;
        b=HOTQ0+mpFM2WZEbT8Crn/Le1dw8ItseyamD5z+AsIp9B0OEi1BSZOk2y69U7yFoCqy
         ihMwN+8XfBgcDWrwPJKa9pdb0qiihQ/H3kelR8CGtaZIDOyAM0jDOVEoZoYCllTOd1J1
         PwWzhn2jZwK0rbAHMTaLJhxRk46aNfQET+GTNuIsIm4AZwBxFl1Bq+Vlf9HhdsaRtndG
         oa6iY3Smzfi+9br2aXhE0UVYCT7zr87rXr/a+bi/g4PM5dkMP1VF6NzIUc69Y3jjaj3O
         KMnuj2dftRUmXL3iHhWEBlL9PIjubToYqbpaXfiSee5sq1r6eLr9byVcIp3OVVH92iAh
         moDw==
X-Forwarded-Encrypted: i=1; AL+hErGxYE1A6b6fSq/o7nZn6slsr4Vfc6P3yugY9P+DrEEy/BFvWl2pfWM3Gr+ge3kYCCu7Hls0QcPOIkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5W60LT5urlRWng50TS/OET2ZHyuJGco93GEKI4Vu+rh48NcCO
	zFanv/rI3kQ1+d5aVOYyG7nZP3BIpXQFLpEktY4n8eOLpKAcZNi7jcPK
X-Gm-Gg: AZFdTZflWsp+QbEQviIdit5N8jzTqxQrrx2P9L7CDDr8pbx9NKdTDLCbhBmzfn+Ofx3
	U693SM+70IiAuK44voDA50LLJQ+Q2PxOzM8NXg/rrULF9K6khSH0/MfR4I0HQtqNv0k7pxwlDOc
	u9w9FmBtDGXOFm5E8jkHcaRZA9hFovc3m2dXj7pNFNDfr6ck4fJel62n076OMn3qmIbsSfmqVhU
	kp0000d8KbYOQV3nlXY40kqHe8irowjlbuzR0EIg1YQkerNVMTL6x1J7N9ZCYR+jLBTYqOUKs9Q
	S/z+8zeRhZk8AY2B1Y1xPZXghTk6Uf0qnNo5z2YiMCjj9BtAXPXcV1BJapRWcKuLZfHolWkK3Ox
	cLcbDL3amMf4uZPjLiikgHv/4IgfFjdJfnxMOgjjXksxoB+5KSzCjz+6pbCw7PH7K0gMfhin6yz
	La0qGHxbqocoO+irg1Ss7fGGEqoTlh+X6AqYFwha/OIjC9gUAZ7SKy5XAzs5qzmhVUeFJ/1lhiY
	sAFQGar8TuNn+8MC/G0wxWSdj7/nVRsC+QCKfG9EKHTgn+CHh1j98cFIGU9Qo4BWb2gEvBUHwR5
	refp1EGF0dhUdfOaXCtAN1xtMezDyRRLBqJOuxji0B2B33DaW8OTCypz5rmX8CHMv8t3NEhmkpG
	qybCutWg2ZutP
X-Received: by 2002:a5d:6f13:0:b0:491:3fdd:af42 with SMTP id ffacd0b85a97d-4abb5cc19b5mr30983044f8f.37.1795610914011;
        Wed, 25 Nov 2026 04:48:34 -0800 (PST)
Received: from [192.168.0.36] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm25732393f8f.15.2026.11.25.04.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:48:33 -0800 (PST)
Message-ID: <c3e6cc57-a091-4342-bbb5-03b594c05fdf@gmail.com>
Date: Wed, 25 Nov 2026 12:48:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] atlantic: skip hardware teardown when PCIe parent is
From: Tobias Heath <heathtobias@gmail.com>
To: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Sukhdeep Singh <sukhdeeps@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
Content-Language: en-US
In-Reply-To: <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the PCIe parent bridge of an atlantic NIC is removed - which
happens routinely on laptops with Thunderbolt docks whenever the dock
is physically disconnected while any sleep / power management cycle is
in flight - the kernel enters a deadlock:

  * pciehp_ist invokes pci_stop_and_remove_bus_device() on the atlantic
    device; this acquires the device's lock and calls the driver's
    .remove callback (aq_pci_remove).
  * aq_pci_remove -> unregister_netdev -> aq_ndev_close -> aq_nic_stop
    -> aq_vec_stop -> napi_disable -> napi_disable_locked.
  * napi_disable_locked waits for NAPI_STATE_SCHED to clear in a
    usleep_range loop. NAPI_STATE_SCHED is cleared by the poll
    function (aq_vec_poll) calling napi_complete_done, but the poll
    function reads the RX ring state over the (now disconnected) PCIe
    bus: config reads return 0xffffffff, the poll never decides it has
    quiesced, NAPI_STATE_SCHED never clears, and the loop spins
    indefinitely.
  * Every other device_resume waiting on the parent bridge blocks on
    the mutex held by pciehp_ist; most visibly an async wiphy_resume
    for the laptop's Wi-Fi, which DPM watchdog times out at 120 s,
    panicking the kernel.

The kernel already has the signal we need: pciehp calls
pci_dev_set_disconnected() (which sets dev->error_state to
pci_channel_io_perm_failure) via pci_walk_bus() before starting the
device-removal walk. By the time aq_pci_remove() runs on a surprise-
removed device, pci_dev_is_disconnected(pdev) is already true.

aq_nic_deinit() in the same file already consults the equivalent
c pci_device_is_present() for the firmware deinit path; aq_nic_stop()
simply does not. This patch adds the check: when the PCIe parent is
disconnected, skip the hardware-touch work (hw_irq_disable, aq_vec_stop
with its napi_disable, aq_ptp_ring_stop, hw_stop) and still free the
IRQs that need userspace-side cleanup. unregister_netdev() in the
caller continues to free the NAPI structures on the kernel's side as
normal.

This mirrors the handling in Marvell's AQtion Windows driver
(aqnic650.sys 3.1.10), which uses a "surprise_removed" flag set from
NdisDevicePnPEventSurpriseRemoved to short-circuit every hardware
code path while still completing software teardown. Static analysis of
that driver confirmed both the pattern and the bounded wait times on
its remaining hardware polls (1 s register poll, 2 s firmware mailbox)
- details available on request.

Before this patch, with a TB dock connected to the atlantic device,
disconnecting the dock during any sleep or power transition caused a
reproducible DPM-watchdog panic at T+120 s. With this patch, the
teardown completes in milliseconds and the system continues normally.

Signed-off-by: Tobias Heath <heathtobias@gmail.com>
---
 .../net/ethernet/aquantia/atlantic/aq_nic.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
index 42e0fe924..0cca82974 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
@@ -1434,6 +1434,27 @@ int aq_nic_stop(struct aq_nic_s *self)
 	timer_delete_sync(&self->service_timer);
 	cancel_work_sync(&self->service_task);

+	/*
+	 * If the PCIe parent bridge was removed (e.g. a Thunderbolt dock
+	 * was physically unplugged while the kernel was mid-teardown),
+	 * the device's config space reads as all-ones. Register writes are
+	 * harmless no-ops, but napi_disable() waits for NAPI_STATE_SCHED
+	 * to clear via napi_complete_done() from the poll function, which
+	 * reads the RX ring state from dead hardware and never decides it
+	 * is done — the wait loop spins indefinitely. This matches the
+	 * Windows AQtion driver's handling of NdisDevicePnPEventSurpriseRemoved
+	 * (a "surprise_removed" flag short-circuits every hardware path
+	 * while still freeing software state).
+	 *
+	 * Skip the hardware-touching teardown; unregister_netdev() in the
+	 * caller takes care of the NAPI structures on the kernel side.
+	 */
+	if (pci_dev_is_disconnected(self->pdev)) {
+		if (!self->aq_nic_cfg.is_polling)
+			aq_pci_func_free_irqs(self);
+		return 0;
+	}
+
 	self->aq_hw_ops->hw_irq_disable(self->aq_hw, AQ_CFG_IRQ_MASK);

 	if (self->aq_nic_cfg.is_polling)
-- 
2.56.1
