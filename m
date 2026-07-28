Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1DE42CAF8
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239507; cv=none; b=usrc3+zxUoO1If9TNwM+MRMdHgKdJr2SU/ixaXPzZrCtV6e0z37La6Lugiv/R1Yn3Jr8gDFv1hZCJKRzeeBYGRMuftWkwBfszvMf9a8uFUr1g+afzwP39L24vIBZxp/winDiS8JXm+ZI8W7UUJcQgSDnuLaLNEygZOtkzcAWo0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239507; c=relaxed/simple;
	bh=vDTEff2eS/Q3Rvv1sv1+Lq9jXTNqWo1n6DG6lcMymlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYMdB269w/4t1wHuGcaB3l5X1xPkZVh2dTfXgA++OZlnN5ZpVYdYyng80oMK4UpTiW24mR/7mH5TZuwMujHyd3nBRGD9+E7VmPcWSmUxSOa70v+9TB/aRZKIfj8sw++/jafFqhBLxPrwx+/bqPB04dPXnJuZ6r2So2g+vqRlZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLzYv3/p; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLzYv3/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785239506; x=1816775506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vDTEff2eS/Q3Rvv1sv1+Lq9jXTNqWo1n6DG6lcMymlU=;
  b=dLzYv3/poFqLa7Zijqtuhcw/aQJo4Zj9qlYPtbgKLxtm0/npRpGYpudk
   Rd1W3/aCWwTS1W85z2NfJ7740qMqCes2+qcL+LG09W/hWA5h0alYd0UF4
   vnk/LTpZdwTcv5a6IuwQgoyniIkEsIYB/vPT0WozbVb13W8+KIltU2JNt
   vlKMb3tPwMRQjXrxEc8tsi2p5UEh/4SA1KXNjkQ/VQhIIyy9EbZX3BEI6
   IoYjXzw6u361+vGPRp8MLkWhtmJV59r6AghPGjC/tKrwHENDywpSRrVvO
   QXpRohadeLVYQfz22umXl1byTJX3ptYQ+DGIic7rmkaJkgUcWIY03mmgZ
   w==;
X-CSE-ConnectionGUID: 03P7bxd+Tyu2DBYDS67FKg==
X-CSE-MsgGUID: 8KIMJusqQlyT4wZU6cL0Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85939319"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85939319"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:51:44 -0700
X-CSE-ConnectionGUID: SXbKTOtmSIGwVsxaeBeS6Q==
X-CSE-MsgGUID: faxw5AP0TziZXauOgoYgTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="253353519"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jul 2026 04:51:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 597C59D; Tue, 28 Jul 2026 13:51:41 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/5] thunderbolt: stream: Fix possible short reads/writes
Date: Tue, 28 Jul 2026 13:51:38 +0200
Message-ID: <20260728115141.2585464-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260728115141.2585464-1-mika.westerberg@linux.intel.com>
References: <20260728115141.2585464-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since copy_page_{to|from}_iter() advances the iterator and makes
iov_iter_count() reflect the remaining bytes, subtracting nbytes from it
makes it count it twice resulting in possible short reads/writes on a
read/write spanning multiple frames.

Fix this by using iov_iter_count() directly.

Fixes: 6db21d817b43 ("thunderbolt: Add support for USB4STREAM")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index 279a0cfc2ac8..20e6ad586879 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -673,7 +673,7 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	}
 
 	nbytes = 0;
-	while (nbytes < iov_iter_count(to)) {
+	while (iov_iter_count(to)) {
 		struct tbstream_frame *sf;
 		size_t size, sf_size;
 
@@ -695,7 +695,7 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 		}
 
 		sf_size = tb_ring_frame_size(&sf->frame);
-		size = min(iov_iter_count(to) - nbytes, sf_size);
+		size = min(iov_iter_count(to), sf_size);
 
 		if (copy_page_to_iter(sf->page, sf->offset, size, to) != size) {
 			ret = -EFAULT;
@@ -765,10 +765,10 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 	}
 
 	nbytes = 0;
-	while (nbytes < iov_iter_count(from)) {
+	while (iov_iter_count(from)) {
 		size_t size;
 
-		size = min(iov_iter_count(from) - nbytes, TB_MAX_FRAME_SIZE);
+		size = min(iov_iter_count(from), TB_MAX_FRAME_SIZE);
 		ret = tbstream_dev_send_data(sdev, from, size);
 		if (ret) {
 			/*
-- 
2.50.1

