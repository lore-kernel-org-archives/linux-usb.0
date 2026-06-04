Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264C53A383C;
	Thu,  4 Jun 2026 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570348; cv=none; b=rJZl6clvyZr/euF/woHjbo7+k1N5S8RK1gpnm3TgI7imTQ/j3saLcWitHVCRtz0MXuUfTnD5op0ln3/+C0ZopkypEhUdogfTBq5wQa++CJNzTiHsN1epIm28VYlVj/+gs3p4imLfUg1bxfyqhw7A6YNzSqfPXzksJc5w8TulqH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570348; c=relaxed/simple;
	bh=tjIIZ54mVaWVTbYr6ZcmKvMoZ61vg/mdhqD1hHL3Fsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqQRHNqqSY1ZxrRLWTpd+aPo7qAOUMLam2Rb2KYYhqYkfnrWhlJLGQKifnw/YM/JTs1YAdLDaWPYADwoiDtNpu9wIHSSFMGenij4VZFY9qy6n6QjuOTslhNugVqQVi5k2kPAc4TEiV5lM+wfqFdtUS6BFHmpAhLyGlMiaig/aKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XpTsxzhE; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XpTsxzhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=KR
	K+iY8NCsd2VE0DHhBFKTX0BgXAwVQ4fPEG3XeL5vY=; b=XpTsxzhEjnlCQ3+C7e
	vldeH5mEmxKjBj6bUSvNzy27sEZnG9Q6f/1bv/oP96Z0ydDytKVfylReMgMnsSfz
	TOhxUokfzkM3LbKHSN0dM8Giw5se8iyynnH0gJZDedraZljO3CQ3mYxXTsErton2
	zzeQsd7PjVq3EmVw047+JUZTg=
Received: from ProDesk-480.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCXb6WbWCFq1Zt2AQ--.48206S2;
	Thu, 04 Jun 2026 18:51:34 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: gregkh@linuxfoundation.org
Cc: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH] usb: typec: tcpm: Fix VDM type for Enter Mode commands
Date: Thu,  4 Jun 2026 18:50:24 +0800
Message-ID: <20260604105059.18750-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgCXb6WbWCFq1Zt2AQ--.48206S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4UZry8Kr48Gr1furW5Awb_yoW8Xry3p3
	y7WrWUK34xKFW3Za4xJr1j9Fs8ZwsrtrZFgFWYg3sIkF12grW5W348Jw15CFy3Za13X3yY
	qrWayF15CFW8Jr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piX18kUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxhYmhGohWLaikwAA3m

VDO() second parameter is VDM type (bit 15): 1 for SVDM, 0 for UVDM.
Using 'vdo ? 2 : 1' corrupts SVID low bit when vdo is non-NULL
(2 << 15 = BIT(16)). Enter Mode is always SVDM, hardcode to 1.

Fixes: 8face9aa57c8 ("usb: typec: Add parameter for the VDO to typec_altmode_enter()")
Signed-off-by: Andy Yan <andyshrk@163.com>
---

 drivers/usb/typec/tcpm/tcpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 55fee96d3342a..3674e1cdde57b 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3061,7 +3061,7 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
 	if (svdm_version < 0)
 		return svdm_version;
 
-	header = VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTER_MODE);
+	header = VDO(altmode->svid, 1, svdm_version, CMD_ENTER_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
 	return tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TCPC_TX_SOP);
@@ -3109,7 +3109,7 @@ static int tcpm_cable_altmode_enter(struct typec_altmode *altmode, enum typec_pl
 	if (svdm_version < 0)
 		return svdm_version;
 
-	header = VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTER_MODE);
+	header = VDO(altmode->svid, 1, svdm_version, CMD_ENTER_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
 	return tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TCPC_TX_SOP_PRIME);
-- 
2.43.0

