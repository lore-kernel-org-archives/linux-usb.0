Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA947F771
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265028; cv=none; b=krTawccJfhJdtDuMpswLW9+Ux9ADkoYBCRaTIioU/H+FA3JUAJfzmStaVvkGrnz82co8a39/hrFTv83jFFleqLaID7bQACIGffCNS+wYsyY4eoSt8i8p2uKIf6LAxqi1EXDeUuNsvXjCRHo+magip5zCewHTT4E7ipuXzdc7zJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265028; c=relaxed/simple;
	bh=LsfFzWHtxBU7+TpSQ+54TWvjy+EwwjFvU3m36YxNCjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3MGMZ0DtwLyXQiGSfbvqHyd4HNviArV+PNLel+QFF3AqR5QmFcVKO4Iiw1UjzIc7Qj7Ig1wIcxY4x/xQgMNFHnC/dMatzQySMuCTQSE1lcHlBgOruQYsqcJ4OML8mtFwIPXher8qiGOVUknjaXgwG1eJiLlTsE2/H8JxaA5IDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 672C2242EF3CE;
	Tue, 01 Sep 2026 14:09:25 +0200 (CEST)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	nkapron@google.com,
	me@samcday.com,
	michael.bommarito@gmail.com,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 3/3] usb: gadget: f_fs: Fix mmgrab()/mmdrop() balance.
Date: Tue,  1 Sep 2026 14:09:08 +0200
Message-ID: <20260901120908.14386-4-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901120908.14386-1-ingo.rohloff@lauterbach.com>
References: <20260901120908.14386-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1788264565432

This fixes commit 5eb5c72c72fe ("USB: gadget: ffs: fix mm lifetime
handling").  The problem is that the previous patch calls mmgrab() for
reads and writes, but it only calls mmdrop() for reads.  So with each
completed async IO write (via an USB IN endpoint) the number of mm_count
increases.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 9dec09d06ca9..0be989c7c23f 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -884,8 +884,8 @@ static void ffs_user_copy_worker(struct work_struct *work)
 		} else {
 			ret = -EFAULT;
 		}
-		mmdrop(io_data->mm);
 	}
+	mmdrop(io_data->mm);
 
 	io_data->kiocb->ki_complete(io_data->kiocb, ret);
 
-- 
2.55.0

