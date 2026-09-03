Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606FA4E235F
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449880; cv=none; b=ou9E/9Luhni/JI1OgOdI5e39Aa3mYm5Pqr1pZpKAW5G/vqblYT7wiEt/odjKrkxt9Ch3jhYzvwtGIbMx3bvgpnrSDC1KiUa4JioWzdg3flKHierZ/HwblooskyRBnSGJnCrZlstUuOBn/DzFu5laiXOobIp+Ui6UiZ4yO2VC/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449880; c=relaxed/simple;
	bh=byXI6O3080V+bBrAjlx49v6U84mWPi/UvW/GsGemdhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ABpccmhx+xJ8h2YTZlzcpCq+/hawAyt5zJisUWvpD3ig/Qe10d+wyt470tOtcINyU7D8an+UFeqrAgIKAVG0XoIURVJ5gcoPrdSp/h7O66+MEucweC/gk7UKdTNrPdBA6wVEaONRjYooEH08occgCYX89dJu2C1PwVKho3xvgFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 0AA1D1A2CF3D1;
	Thu, 03 Sep 2026 17:37:49 +0200 (CEST)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: viro@zeniv.linux.org.uk,
	nkapron@google.com,
	me@samcday.com,
	nuno.sa@analog.com,
	michael.bommarito@gmail.com,
	prostitisgabriel@gmail.com,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH] usb: gadget: f_fs: Fix synchronous read() behavior
Date: Thu,  3 Sep 2026 17:37:37 +0200
Message-ID: <20260903153737.58087-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1788449869056

To provide consistent read() behavior, USB requests submitted to the UDC
for OUT endpoints must always have a length that is a multiple of the OUT
endpoint's max_packet_size.

Consider a UDC where usb_ep_align_maybe() aligns the request length.

If a request completes with more data than was requested by the read()
call, the excess data is buffered and is returned by the next read() call
via __ffs_epfile_read_buffered().

The buffered excess data has at most "max_packet_size-1" bytes.  This
happens if read() requests "n*max_packet_size+1" bytes and the USB host
sends "(n+1)*max_packet_size" bytes.

However, if usb_ep_align_maybe() does not align the request length to a
multiple of max_packet_size, the behavior is different.  For example, with a
max_packet_size of 512 bytes (USB HighSpeed), a read() request for 512+128
bytes may be completed by an OUT transfer containing 512+256 bytes.  The
kernel returns 512+128 bytes to userspace, while the remaining 128 bytes are
discarded by the UDC instead of being buffered.  The next read() call then
blocks until the USB host submits another OUT transfer.

The former behavior is the expected one.  Enforce it by using
usb_ep_align() instead of usb_ep_align_maybe().

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 43962e05eacf..d31a6330d6a0 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1078,11 +1078,12 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		}
 		data_len = iov_iter_count(&io_data->data);
 		/*
-		 * Controller may require buffer size to be aligned to
-		 * maxpacketsize of an out endpoint.
+		 * To expose a stream like interface for read(), make sure
+		 * the enqueued read request is a multiple of the maxpacketsize
+		 * of an out endpoint.
 		 */
 		if (io_data->read)
-			data_len = usb_ep_align_maybe(gadget, ep->ep, data_len);
+			data_len = usb_ep_align(ep->ep, data_len);
 
 		io_data->use_sg = gadget->sg_supported && data_len > PAGE_SIZE;
 		spin_unlock_irq(&epfile->ffs->eps_lock);
-- 
2.55.0

