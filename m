Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C47D39EF30;
	Tue, 23 Jun 2026 06:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195503; cv=none; b=B6Blrji/f+MT5i4+AQP2fbSDwoJKnH7YI5EJPgbj4L7ha6vUEeWjGRbv2VEFZDsUutupbgOQwoPalrX688fgpB4w5iDDDQACWnhJuw/8DR/6SAhq3s4GqRwWRnPoxmdUYEKuBDaew37m8bNYqnjhbjkm8bUHm/YHCo6h2U1Yb38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195503; c=relaxed/simple;
	bh=fsshT5Pcby25XllhAoRyA7gE05zHhQ8XQ7kWVbpHbTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STQpeIvAIEHAfbwPLg7fk6bCqhklGX1R2HYblEqDFavKXE3obsWdmx/fyJvAf/PJUczPUwzzgPHS8/6wx5Tfb79QiRCRoIe/DHW6lwoezlDtn2mfo99x4t68gxAXsLrNysr1QO5DhSHApTQjLqWApQ2hh2WS7pvKfi5Ctoix+kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHntElJTpq6kXKFA--.5124S2;
	Tue, 23 Jun 2026 14:18:13 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC PATCH] thunderbolt: icm: report switch runtime resume timeout
Date: Tue, 23 Jun 2026 14:18:11 +0800
Message-ID: <20260623061811.62475-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHntElJTpq6kXKFA--.5124S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFykKrWDuryrKry8uw13twb_yoWDGrgE9r
	n5ur17Xwn8uF1DKw17t3W5Z34SgFykuF18Ar92k34fJFy3Xrn8ZrWDWr1DCryUtw4DGF9x
	ur42qFWfZwnrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4AFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjnmRU
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

icm_runtime_resume_switch() waits for firmware to signal switch runtime-
resume completion. If the wait expires, it only prints a debug message
and still returns success to the runtime PM path.

Return -ETIMEDOUT when the completion does not arrive so runtime PM
callers can observe the failed switch resume instead of using the device
as if resume had completed.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/thunderbolt/icm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 10fefac3b1d9..46d491627970 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2179,6 +2179,7 @@ static int icm_runtime_resume_switch(struct tb_switch *sw)
 		if (!wait_for_completion_timeout(&sw->rpm_complete,
 						 msecs_to_jiffies(500))) {
 			dev_dbg(&sw->dev, "runtime resuming timed out\n");
+			return -ETIMEDOUT;
 		}
 	}
 	return 0;
-- 
2.50.1 (Apple Git-155)

