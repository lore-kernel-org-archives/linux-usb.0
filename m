Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E8C4071EB;
	Thu,  9 Jul 2026 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588729; cv=none; b=Rq8ePi4RhdmgUdm3ppn9vwvQ7ttKzwY4tZ2nr3+L4DbD65Qwq2YxgOJs3kzJQxd/bCWvn6oDMLGHpvvi3EY00RX6PLQDbO0CXxVeb56bF4MzNOe5z6negDND/ZMl7xrKTVSRXzh9ViL2J7N9XKnyqa9wU1d7qpCvALdRzIdW8UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588729; c=relaxed/simple;
	bh=slLK38pHbzNTsj9MnKVxVXmVDZGcbDycNKHrtCjgZlE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sVB13boWLltMioIoE+fdPaAlrPaQpauAVa6+m7Rg5RHzuL30B0A9pd7AFCS6AKATVXlVHVn4RAfQix/U042coOPOzsEQXdRgH5mCnq9Ji8H64atzLLyJGW4n1u0/Qm9BRbx90akTcSwUqrqDBBB1rCJDuiXhNU16kBt2/dx43xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id D06F123381;
	Thu,  9 Jul 2026 12:18:35 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Nazarewicz <m.nazarewicz@samsung.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH] usb: gadget: f_fs: use __GFP_NOWARN for user-controlled buffer allocation
Date: Thu,  9 Jul 2026 12:18:35 +0300
Message-Id: <20260709091835.259708-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffs_alloc_buffer() passes iov_iter_count() of a userspace read(2) or
write(2) buffer directly to kmalloc() when the UDC does not support
scatter-gather (gadget->sg_supported == false). There is no upper
bound imposed on data_len before it reaches kmalloc().

If a userspace program issues a read/write large enough that the
resulting order exceeds the page allocator's MAX_PAGE_ORDER, kmalloc()
routes to the page allocator which triggers a WARN_ON_ONCE before
returning NULL. The allocation failure is already handled correctly
via -ENOMEM in ffs_epfile_io(), so the WARN carries no additional
diagnostic value. On systems booted with panic_on_warn=1 this WARN
becomes fatal.

Use __GFP_NOWARN so oversized allocations quietly fall back to
-ENOMEM, matching the existing error path.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Fixes: ddf8abd25994 ("USB: f_fs: the FunctionFS driver")
Cc: stable@vger.kernel.org
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 44218be1e676..e44b441b844b 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -843,7 +843,7 @@ static inline void *ffs_alloc_buffer(struct ffs_io_data *io_data,
 	if (io_data->use_sg)
 		return ffs_build_sg_list(&io_data->sgt, data_len);
 
-	return kmalloc(data_len, GFP_KERNEL);
+	return kmalloc(data_len, GFP_KERNEL | __GFP_NOWARN);
 }
 
 static inline void ffs_free_buffer(struct ffs_io_data *io_data)
-- 
2.50.1

