Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F747A879
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078324; cv=none; b=hPr7WoY5XED3pxKSq0jOEc+2wpL04eH+OCDm+6UdccgHPj9kKwsoUU7+xksKZs7QezmKbtQpQNzmowyehvz4yhx9BAbUqDEzlNwrFtsip2rLDPiqN9I9jcvrdvVLpQCAIfusZmyJ4Nn8aiM0cGBqArHIH218XdAR8d6rUXRZ78U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078324; c=relaxed/simple;
	bh=DeKismMKHS0p82Upd8oTciQyVKpFWEiWOCeG4wxFFmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ln177Iw0xxjL/l/3LUq9P2KseRQKRGxBhcaBcScKRMfHXXo5ro2XxV7VVi1WpUvQ962InjrPGhSPh4JxgHuX5W7U/RVGffpdx5M1FbN1o7t6HKholUc04fqJuY9tjkePQTl9cZIaUFT3WavyoLAfRglQokGTqVOZn+5sOCdVN/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0WAY0/S; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0WAY0/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078323; x=1821614323;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DeKismMKHS0p82Upd8oTciQyVKpFWEiWOCeG4wxFFmE=;
  b=K0WAY0/SKQydZXZ0SEnFoIu0vmgtknpPTxEHN2M4HYQ7bYPp+q8+pwPZ
   l5EggixeqVWy124un/69fBIztGuQ7zFiAPhhSpyAcBPUmxvNki8YXn48K
   BmVrOtADPc3ayxVUojv5yWHHPRwn0DP3oyyXcfGhe6f2QSlVqCmsqgLyY
   RePNfmUFKzW6r+5sIvsha/rFcCe8WuDgp2NbLNLVyyjnydWoSBGHQ/HRf
   B8CgK9yY7ysJXS9QKx7kl3hWk9+W3U9qs1UWDsGLzkzBupWQCDy5fp2RT
   h7Be/6rLyAavFH8g6WNYEWQoX5N5+K+PgdLJrRWFfP5KMIuyJgyiZZAtA
   g==;
X-CSE-ConnectionGUID: 8ho5eyvrTcqMsghCxp4yxw==
X-CSE-MsgGUID: wabn3BvlRi2DVEY9frNPsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="93174864"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="93174864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:58:42 -0700
X-CSE-ConnectionGUID: PRTeUuZBTBuWhGZgahGGwg==
X-CSE-MsgGUID: aXIDeawQRZi79eHPIsN0Fg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 22 Sep 2026 04:58:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8FFD799; Tue, 22 Sep 2026 13:58:34 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: stream: Announce support for FMODE_NOWAIT
Date: Tue, 22 Sep 2026 13:58:34 +0200
Message-ID: <20260922115834.3807356-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 42bc6935339b ("thunderbolt: stream: Support IOCB_NOWAIT in
non-blocking I/O as well") added support for IOCB_NOWAIT but forgot to
actually announce it as part of the file->f_mode. Add this now so users
such as io_uring can actually take advantage of IOCB_NOWAIT.

Fixes: 42bc6935339b ("thunderbolt: stream: Support IOCB_NOWAIT in non-blocking I/O as well")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/stream.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index bdcca78f3449..4f9a57b77bfa 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -1118,6 +1118,9 @@ static int tbstream_dev_fops_open(struct inode *inode, struct file *file)
 	}
 
 	mutex_unlock(&sdev->lock);
+
+	/* Stream handles IOCB_NOWAIT just fine */
+	file->f_mode |= FMODE_NOWAIT;
 	return 0;
 
 err_unlock:
-- 
2.50.1

