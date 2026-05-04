Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10217199931;
	Mon,  4 May 2026 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777895028; cv=none; b=QOFpDC72YrgELJ/WgiOusNAWAz8t94qKamRhOOrXdKii74+eSwp6uMXizCoXjgAoejMBQeOyH9lm6Td1p4Wtae9IdJHAlf6kxuEAlGpnkuYhGRLl4z2tjEfLvrHF97j6qsBd24hOtFZ/moVvgo7JNY9rE6YdROsnIFJb8b4vKgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777895028; c=relaxed/simple;
	bh=C4MMe+3JfNG4xVA54L0AzubSbk87L5OVnFw3J3o++wc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pmiFXTz0yr1wZJV1OgWn2RmUpACdl28G43/U7Wwgwb0dZtbdjs7JYs1nXeESKoYoxj+q+RiQoyaNe85EIHZ5lU6sqJ6eaJ3A1AvJmB260zlfUsUs31uJZlOudAMhm4UoSTQuuDUA2QN5GVuyZaSfSxUfdEW0N6QR3CnLCmivfKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from boringlust.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	(Authenticated sender: rastyoginds)
	by air.basealt.ru (Postfix) with ESMTPSA id 80BA42338B;
	Mon,  4 May 2026 14:43:42 +0300 (MSK)
From: gerben@altlinux.org
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] usb: host: ehci-sched: Fix potential out-of-bounds access of bandwidth[]
Date: Mon,  4 May 2026 14:43:40 +0300
Message-ID: <20260504114340.29295-1-gerben@altlinux.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Rastyogin <gerben@altlinux.org>

The microframe index used to access the bandwidth array is not
properly bounded. Although it is masked to a limited range, subsequent
loop iterations can advance it beyond the end of the array, leading to
an out-of-bounds access.

This can happen when sitd_slot_ok() is called from iso_stream_schedule()
with period = stream->uperiod = 1024. In that case, the loop may reach
sitd_slot_ok() with start = 1981, resulting in uframe = 61. After three
iterations, the index exceeds the array bounds.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d0ce5c6b9208 ("USB: EHCI: use a bandwidth-allocation table")
Signed-off-by: Denis Rastyogin <gerben@altlinux.org>
---
 drivers/usb/host/ehci-sched.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
index a241337c9af8..d2bace03b8c9 100644
--- a/drivers/usb/host/ehci-sched.c
+++ b/drivers/usb/host/ehci-sched.c
@@ -1429,6 +1429,8 @@ sitd_slot_ok(
 		uf = uframe;
 		max_used = ehci->uframe_periodic_max - stream->ps.usecs;
 		for (tmp = stream->ps.cs_mask & 0xff; tmp; tmp >>= 1, uf++) {
+			if (uf >= EHCI_BANDWIDTH_SIZE)
+				return 0;
 			if (ehci->bandwidth[uf] > max_used)
 				return 0;
 		}
-- 
2.42.2

